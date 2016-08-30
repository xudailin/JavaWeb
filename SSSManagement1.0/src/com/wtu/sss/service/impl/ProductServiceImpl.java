package com.wtu.sss.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.wtu.sss.dao.ProductDAO;
import com.wtu.sss.model.Bank;
import com.wtu.sss.model.InOrder;
import com.wtu.sss.model.Manager;
import com.wtu.sss.model.OutOrder;
import com.wtu.sss.model.Product;
import com.wtu.sss.model.Provider;
import com.wtu.sss.service.ProductService;
import com.wtu.sss.util.PageBean;

@Component("productService")
public class ProductServiceImpl implements ProductService {
	
	private ProductDAO productDAO;
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProductService#checkProductId(int)
	 * 查询货物编号是否存在
	 */
	public boolean checkProductId(int productId){
		List<Product> list = this.productDAO.queryProductId(productId);
		if(list.size() == 0){
			return true;
		}else{
			return false;
		}
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProductService#checkProductName(java.lang.String)
	 * 查询货物名称是否存在
	 */
	public boolean checkProductName(String productName){
		List<Product> list = this.productDAO.queryProductName(productName);
		if(list.size() == 0){
			return true;
		}else{
			return false;
		}
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProductService#deleteProduct(java.lang.String[])
	 * 删除若干条货物信息
	 */
	public Boolean deleteProduct(String[] ids){
		return this.productDAO.deleteProduct(ids);
	}
	
	public boolean addProdProv(Product product,Provider provider){
		return this.productDAO.addProdProv(product, provider);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProductService#addProduct(com.wtu.sss.model.Product)
	 * 添加货物
	 */
	public boolean addProduct(Product product){
		return this.productDAO.addProduct(product);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProductService#getProviderItems()
	 * 获取所有供应商
	 */
	public List<Provider> getProviderItems(){
		List<Provider> list = this.productDAO.getProviderItems();
		return list;
	}

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProductService#getProvidersByProdId(long)
	 * 通过货物id获取其所有供应商
	 */
	public List<Provider> getProvidersByProdId(long prodId){
		return this.productDAO.getProvidersByProdId(prodId);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProductService#getManagerByName(java.lang.String)
	 * 根据负责人姓名查询得到相应负责人
	 */
	public Manager getManagerByName(String managerName){
		return this.productDAO.getManagerByName(managerName);
	}

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProductService#getManagerItems()
	 * 获取所有负责人选项
	 */
	public List<Manager> getManagerItems(){
		List<Manager> list = this.productDAO.getManagerItems();
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProductService#addInOrder(com.wtu.sss.model.InOrder)
	 * 添加入库订单
	 */
	public boolean addInOrder(InOrder inOrder){
		return this.productDAO.insertInOrder(inOrder);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProductService#addOutOrder(com.wtu.sss.model.OutOrder)
	 * 添加出库订单
	 */
	public boolean addOutOrder(OutOrder outOrder){
		return this.productDAO.insertOutOrder(outOrder);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProductService#updateProductNum(com.wtu.sss.model.Product)
	 * 更新货物数量
	 */
	public boolean updateProductNum(Product product){
		return this.productDAO.updateProductNum(product);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProductService#getProductById(long)
	 * 根据货物id得到相应货物信息
	 */
	public Product getProductById(long prodId){
		return this.productDAO.getProductById(prodId);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProductService#getAllProductForPage(int, int)
	 * 分页查询得到货物信息
	 */
	public PageBean getAllProductForPage(int pageSize,int page){
		final String hql = "from Product as prod order by prod.productId desc";
		int allRow = this.productDAO.getAllRowCount(hql);//总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);//总页数
		int currentPage = PageBean.countCurrentPage(page);
		final int offset = PageBean.countOffset(pageSize, currentPage);//当前页开始记录
		final int length = pageSize;
		List<Product> list = this.productDAO.queryProductForPage(hql,offset, length);
		PageBean pageBean = new PageBean(list,allRow,totalPage,currentPage,pageSize);
		pageBean.init();
		return pageBean;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProductService#getProducts(com.wtu.sss.model.Product, int, int)
	 * 根据查询条件查询相应的货物
	 */
	public PageBean getProducts(Product product,int pageSize,int page){
		String hql = "from Product as prod where 1=1";
		if (product.getProductId() != null) {
			hql += " and prod.productId=" + product.getProductId();
		}
		if (!(product.getProductName() == null || product.getProductName().equals(""))) {
			hql += " and prod.productName like '%" + product.getProductName()
					+ "%'";
		}
		if (!(product.getShortName() == null || product.getShortName().equals(
				""))) {
			hql += " and prod.shortName like '%" + product.getShortName()
					+ "%'";
		}
		hql += "order by prod.productId desc";
		int allRow = this.productDAO.getAllRowCount(hql);//总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);//总页数
		int currentPage = PageBean.countCurrentPage(page);
		final int offset = PageBean.countOffset(pageSize, currentPage);//当前页开始记录
		final int length = pageSize;
		List<Product> list = this.productDAO.queryProductForPage(hql,offset,length);
		PageBean pageBean = new PageBean(list,allRow,totalPage,currentPage,pageSize);
		pageBean.init();
		return pageBean;
	}

	public ProductDAO getProductDAO() {
		return productDAO;
	}

	@Resource
	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}
	

}
