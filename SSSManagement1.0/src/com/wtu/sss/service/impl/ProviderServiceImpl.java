package com.wtu.sss.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import com.wtu.sss.dao.ProviderDAO;
import com.wtu.sss.model.Bank;
import com.wtu.sss.model.InOrder;
import com.wtu.sss.model.Place;
import com.wtu.sss.model.Product;
import com.wtu.sss.model.Provider;
import com.wtu.sss.service.ProviderService;
import com.wtu.sss.util.PageBean;

@Component("providerService")
public class ProviderServiceImpl implements ProviderService {
	
	private ProviderDAO providerDAO;
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProviderService#checkProviderId(int)
	 * 查询供应商编号是否存在
	 */
	public boolean checkProviderId(int providerId){
		List<Provider> list = this.providerDAO.queryProviderId(providerId);
		if(list.size() == 0){
			return true;
		}else{
			return false;
		}
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProviderService#checkProviderName(java.lang.String)
	 * 查询供应商姓名是否存在
	 */
	public boolean checkProviderName(String providerName){
		List<Provider> list = this.providerDAO.queryProviderByName(providerName);
		if(list.size() == 0){
			return true;
		}else{
			return false;
		}
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProviderService#deleteSome(java.lang.String[])
	 * 删除若干条供应商记录
	 */
	public boolean deleteSome(String[] ids){
		return this.providerDAO.deleteSome(ids);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProviderService#queryProviderByName(java.lang.String)
	 * 根据供应商名称查询相应供应商
	 */
	public Provider queryProviderByName(String providerName){
		List<Provider> list = this.providerDAO.queryProviderByName(providerName);
		return list.get(0);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProviderService#deleteOneProvider(com.wtu.sss.model.Provider)
	 * 删除一条供应商
	 */
	public boolean deleteOneProvider(Provider provider){
		return this.providerDAO.deleteOneProvider(provider);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProviderService#updateProvider(com.wtu.sss.model.Provider)
	 * 更新供应商信息
	 */
	public boolean updateProvider(Provider provider){
		return this.providerDAO.updateProvider(provider);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProviderService#getProviderById(long)
	 * 根据id查询得到相应供应商
	 */
	public Provider getProviderById(long Id){
		return this.providerDAO.getProviderById(Id);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProviderService#getProvidersForPage(int, int)
	 * 分页查询，获取相应供应商
	 */
	public PageBean getProvidersForPage(int pageSize,int page){
		final String hql = "from Provider prov order by prov.providerId desc";
		int allRow = this.providerDAO.getAllRowCount(hql);//总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);//总页数
		int currentPage = PageBean.countCurrentPage(page);
		final int offset = PageBean.countOffset(pageSize, currentPage);//当前页开始记录
		final int length = pageSize;
		List<Provider> list = this.providerDAO.queryProvidersForPage(hql, offset, length);
		PageBean pageBean = new PageBean(list,allRow,totalPage,currentPage,pageSize);
		pageBean.init();
		return pageBean;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProviderService#addProvider(com.wtu.sss.model.Provider)
	 * 添加供应商
	 */
	public Boolean addProvider(Provider provider){
		List<Provider> list = this.providerDAO.queryProviderByName(provider.getProviderName());
		if(list.size()==0){
			return this.providerDAO.addProvider(provider);
		}else{
			return false;
		}	
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProviderService#getProviders(com.wtu.sss.model.Provider, int, int)
	 * 根据查询条件查询相应的供应商
	 */
	public PageBean getProviders(Provider provider,int pageSize,int page){
		String hql="from Provider as prov where 1=1";
		if(provider.getProviderId()!= null){
			hql+=" and prov.providerId="+provider.getProviderId();
		}
		if(!(provider.getProviderName()==null || 
				provider.getProviderName().equals(""))){
			hql+=" and prov.providerName like '%"+provider.getProviderName()+"%'";
		}
		if(provider.getPlace()!=null){
			hql+=" and prov.place.placeName = '"+provider.getPlace().getPlaceName()+"'";
		}
		if(provider.getBank()!=null){
			hql+=" and prov.bank.bankName like '%"+provider.getBank().getBankName()+"%'";
		}
		hql += "order by prov.providerId desc";
		int allRow = this.providerDAO.getAllRowCount(hql);//总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);//总页数
		int currentPage = PageBean.countCurrentPage(page);
		final int offset = PageBean.countOffset(pageSize, currentPage);//当前页开始记录
		final int length = pageSize;
		List<Provider> list = this.providerDAO.getProviders(hql,offset,length);
		PageBean pageBean = new PageBean(list,allRow,totalPage,currentPage,pageSize);
		pageBean.init();
		return pageBean;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProviderService#getBankByName(java.lang.String)
	 * 根据银行名称查询得到相应银行信息
	 */
	public Bank getBankByName(String bankName){
		return this.providerDAO.getBankByName(bankName);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProviderService#getPlaceByName(java.lang.String)
	 * 根据地区名称查询得到相应地区信息
	 */
	public Place getPlaceByName(String placeName){
		return this.providerDAO.getPlaceByName(placeName);
	}
	
	/* (non-Javadoc)
	 * @see com.wtu.sss.service.impl.ProviderService#getPlaceItems()
	 * 获取所有地区选项
	 */
	public List<Place> getPlaceItems(){
		List<Place> list = this.providerDAO.getPlaceItems();
		return list;
	}

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.ProviderService#getBankItems()
	 * 获取所有银行选项
	 */
	public List<Bank> getBankItems(){
		List<Bank> list = this.providerDAO.getBankItems();
		return list;
	}

	public ProviderDAO getProviderDAO() {
		return providerDAO;
	}

	@Resource
	public void setProviderDAO(ProviderDAO providerDAO) {
		this.providerDAO = providerDAO;
	}
	

}
