package com.wtu.sss.action;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.JSONUtil;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wtu.sss.model.InOrder;
import com.wtu.sss.model.Manager;
import com.wtu.sss.model.OutOrder;
import com.wtu.sss.model.ProdProv;
import com.wtu.sss.model.Product;
import com.wtu.sss.model.Provider;
import com.wtu.sss.service.ProductService;
import com.wtu.sss.service.ProviderService;
import com.wtu.sss.util.PageBean;

@Component("product")
@Scope("prototype")
public class ProductAction extends ActionSupport implements
		ModelDriven<Product> {

	private ProductService productService;
	private ProviderService providerService;
	private List<Product> list;
	private List<Provider> provList;
	private Product product = new Product();
	private Integer number;
	private Integer inOrderId;
	private Manager manager;
	private String operator;
	private Date date;
	private Integer outOrderId;
	private Provider provider;
	private int page;
	private PageBean pageBean;

	/*
	 * 添加货物时，检查货物编号是否存在
	 */
	public String checkProductId() {
		String msg = null;
		try {
			boolean ret = this.productService.checkProductId(Integer
					.parseInt(URLDecoder.decode(this.product.getProductId()
							.toString(), "UTF-8")));
			if (!ret) {
				msg = "此ID已存在,请更换一个！";
			} else {
				msg = "合法！";
			}
			Map<String, String> map = new HashMap<String, String>();
			map.put("msg", msg);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(JSONUtil.serialize(map));
			out.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/*
	 * 添加货物时，检查货物名称是否存在
	 */
	public String checkProductName() {
		String msg = null;
		try {
			boolean ret = this.productService.checkProductName(URLDecoder
					.decode(this.product.getProductName(), "UTF-8"));
			if (!ret) {
				msg = "此货物名称已存在！";
			} else {
				msg = "合法！";
			}
			Map<String, String> map = new HashMap<String, String>();
			map.put("msg", msg);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(JSONUtil.serialize(map));
			out.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/*
	 * 删除货物
	 */
	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String[] ids = new String[] {};
		ids = request.getParameterValues("ids");
		if (ids.length == 0) {
			JOptionPane.showMessageDialog(null, "请选择要删除的记录！", "Warning",
					JOptionPane.WARNING_MESSAGE);
		} else {
			String[] str = { "确定", "取消" };
			int res = JOptionPane.showOptionDialog(null, "确定要删除这" + ids.length
					+ "条的记录吗？", "Question", JOptionPane.YES_NO_OPTION,
					JOptionPane.QUESTION_MESSAGE, null, str, str[1]);
			if (res == 0) {
				this.productService.deleteProduct(ids);
				return "deleteProductSuccess";
			}
		}
		return "deleteProductFailure";
	}

	/*
	 * 添加货物
	 */
	public String addProduct() {
		Provider provider = this.providerService
				.queryProviderByName(this.provider.getProviderName());
		this.productService.addProduct(product);
		ProdProv prodProv = new ProdProv(this.product, this.provider);
		this.productService.addProdProv(product, provider);
		return "addProductSuccess";
	}

	/*
	 * 获取所有负责人
	 */
	public String getManagerItems() {
		List<Manager> list = this.productService.getManagerItems();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(JSONUtil.serialize(list));
			out.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/*
	 * 获取所有供应商
	 */
	public String getProviderItems() {
		List<Provider> list = this.productService.getProviderItems();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(JSONUtil.serialize(list));
			out.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/*
	 * 获取所有商品
	 */
	public String showAllProduct() {
		pageBean = this.productService.getAllProductForPage(5, page);
		return "productManageSuccess";
	}

	/*
	 * 获取相应商品的供应商
	 */
	public String getProvidersOfProd() {
		provList = this.productService.getProvidersByProdId(this.product
				.getProdId());
		return "queryProviderSuccess";
	}

	/*
	 * 商品入库，并生成相应订单
	 */
	public String productInSto() {
		product = this.productService.getProductById(product.getProdId());
		manager = this.productService.getManagerByName(this.manager
				.getManagerName());
		InOrder inOrder = new InOrder(inOrderId, product, number, manager,
				operator, date);
		this.productService.addInOrder(inOrder);
		product.setProductStoreNum(product.getProductStoreNum() + this.number);
		this.productService.updateProductNum(product);
		return "productInSuccess";
	}

	/*
	 * 商品出库，并生成相应订单
	 */
	public String productOutSto() {
		product = this.productService.getProductById(product.getProdId());
		manager = this.productService.getManagerByName(this.manager
				.getManagerName());
		OutOrder outOrder = new OutOrder(outOrderId, product, number, manager,
				operator, date);
		this.productService.addOutOrder(outOrder);
		product.setProductStoreNum(product.getProductStoreNum() - this.number);
		this.productService.updateProductNum(product);
		return "productOutSuccess";
	}

	/*
	 * 根据货物id获取该货物相关信息
	 */
	public String preProductIn() {
		product = this.productService.getProductById(product.getProdId());
		return "preProductInSuccess";
	}

	public String preProductOut() {
		product = this.productService.getProductById(product.getProdId());
		return "preProductOutSuccess";
	}

	/*
	 * 根据查询条件查询相应货物信息
	 */
	public String queryProduct() {
		pageBean = this.productService.getProducts(product, 5, page);
		return "productManageSuccess";
	}

	public ProductService getProductService() {
		return productService;
	}

	@Resource
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public List<Product> getList() {
		return list;
	}

	public List<Provider> getProvList() {
		return provList;
	}

	public Product getProduct() {
		return product;
	}

	public Product getModel() {
		// TODO Auto-generated method stub
		return this.product;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getInOrderId() {
		return inOrderId;
	}

	public void setInOrderId(Integer inOrderId) {
		this.inOrderId = inOrderId;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getOutOrderId() {
		return outOrderId;
	}

	public void setOutOrderId(Integer outOrderId) {
		this.outOrderId = outOrderId;
	}

	public ProviderService getProviderService() {
		return providerService;
	}

	@Resource
	public void setProviderService(ProviderService providerService) {
		this.providerService = providerService;
	}

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setList(List<Product> list) {
		this.list = list;
	}

}
