package com.wtu.sss.action;

import java.io.PrintWriter;
import java.net.URLDecoder;
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
import com.wtu.sss.model.Bank;
import com.wtu.sss.model.Place;
import com.wtu.sss.model.Provider;
import com.wtu.sss.service.ProviderService;
import com.wtu.sss.util.PageBean;

@Component("provider")
@Scope("prototype")
public class ProviderAction extends ActionSupport implements
		ModelDriven<Provider> {
	
	private Provider provider = new Provider();
	private ProviderService providerService;
	private List<Provider> list;
	private List<Place> listPlace;
	private List<Bank> listBank;
	private int page;
	private PageBean pageBean;
	
	/*
	 * 删除供应商
	 */
	public String delete(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String flag = request.getParameter("flag");
		if(flag.equals("0")){
			provider = this.providerService.getProviderById(provider.getId());
			String[] str = { "确定", "取消" };
			int res = JOptionPane.showOptionDialog(null, "您确信要删除该条记录吗",
					"Question", JOptionPane.YES_NO_OPTION,
					JOptionPane.QUESTION_MESSAGE, null, str, str[1]);
			if(res == 0){
				this.providerService.deleteOneProvider(provider);
				return "deleteProviderSuccess";
			}
		}else{
			String[] ids = new String[]{};
			ids = request.getParameterValues("ids");
			if(ids.length == 0){
				JOptionPane.showMessageDialog(null, "请选择要删除的记录！", "Warning",
						JOptionPane.WARNING_MESSAGE);
			}else{
				String[] str = { "确定", "取消" };
				int res = JOptionPane.showOptionDialog(null, "确定要删除这"
						+ ids.length + "条的记录吗？", "Question",
						JOptionPane.YES_NO_OPTION,
						JOptionPane.QUESTION_MESSAGE, null, str, str[1]);
				if(res == 0){
					this.providerService.deleteSome(ids);
					return "deleteProviderSuccess";
				}
			}		
		}
		return "deleteProviderFailure";
	}

	/*
	 * 更新供应商
	 */
	public String updateProvider() {
		int placeId = this.providerService.getPlaceByName(
				this.provider.getPlace().getPlaceName()).getPlaceId();
		this.provider.getPlace().setPlaceId(placeId);
		int bankId = this.providerService.getBankByName(
				this.provider.getBank().getBankName()).getBankId();
		this.provider.getBank().setBankId(bankId);		
		this.providerService.updateProvider(provider);
			return "updateProviderSuccess";
	}

	/*
	 * 获取所有的供应商
	 */
	public String getAllProviders() {
		pageBean = this.providerService.getProvidersForPage(5, page);
		return "providerManageSuccess";
	}

	/*
	 * 根据供应商id获取该供应商相关信息
	 */
	public String getProviderById() {
		provider = this.providerService.getProviderById(provider.getId());
		listPlace = this.providerService.getPlaceItems();
		listBank = this.providerService.getBankItems();
		return "preUpdateProviderSuccess";
	}

	/*
	 * 添加供应商
	 */
	public String addProvider() {
		int placeId = this.providerService.getPlaceByName(
				this.provider.getPlace().getPlaceName()).getPlaceId();
		this.provider.getPlace().setPlaceId(placeId);
		int bankId = this.providerService.getBankByName(
				this.provider.getBank().getBankName()).getBankId();
		this.provider.getBank().setBankId(bankId);
		this.providerService.addProvider(provider);
		return "addProviderSuccess";
	}

	/*
	 * 根据查询条件查询相应供应商
	 */
	public String queryProvider() {
		Bank bank = provider.getBank();
		Place place = provider.getPlace();
		if (bank != null) {
			if ("-1".equals(bank.getBankName())) {
				provider.setBank(null);
			}
		}
		if (place != null) {
			if ("-1".equals(place.getPlaceName())) {
				provider.setPlace(null);
			}
		}
		pageBean = this.providerService.getProviders(provider,5, page);
		return "queryProvidersSuccess";
	}

	/*
	 * 获取所有的地区选项
	 */
	public String getPlaceItems() {
		List<Place> list = this.providerService.getPlaceItems();
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
	 * 获取所有的银行选项
	 */
	public String getBankItems() {
		List<Bank> list = this.providerService.getBankItems();
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
	 * 添加供应商时，检查供应商编号是否存在
	 */
	public String checkProviderId(){
		String msg = null;
		try {
			boolean ret = this.providerService.checkProviderId(Integer.parseInt(URLDecoder.decode(this.provider.getProviderId().toString(),"UTF-8")));
			if(!ret){
				msg= "此ID已存在,请更换一个！";
			}else{
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
	 * 添加供应商时，检查供应商名称是否存在
	 */
	public String checkProviderName(){
		String msg = null;
		try {
			boolean ret = this.providerService.checkProviderName(URLDecoder.decode(this.provider.getProviderName(), "UTF-8"));
			if(!ret){
				msg= "此供应商已存在！";
			}else{
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

	public Provider getModel() {
		// TODO Auto-generated method stub
		return this.provider;
	}

	public ProviderService getProviderService() {
		return providerService;
	}

	@Resource
	public void setProviderService(ProviderService providerService) {
		this.providerService = providerService;
	}

	public List<Provider> getList() {
		return list;
	}

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	public List<Place> getListPlace() {
		return listPlace;
	}

	public List<Bank> getListBank() {
		return listBank;
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
	
}
