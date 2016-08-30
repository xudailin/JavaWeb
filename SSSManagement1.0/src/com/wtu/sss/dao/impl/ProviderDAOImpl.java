package com.wtu.sss.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.wtu.sss.dao.ProviderDAO;
import com.wtu.sss.model.Bank;
import com.wtu.sss.model.InOrder;
import com.wtu.sss.model.Place;
import com.wtu.sss.model.Provider;

@Component("providerDAO")
public class ProviderDAOImpl implements ProviderDAO {
	
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProviderDAO#queryProviderId(int)
	 * 根据供应商编号获取相应供应商信息
	 */
	public List<Provider> queryProviderId(int providerId){
		List<Provider> list = this.hibernateTemplate.find("from Provider as prov where prov.providerId = " + providerId);
		return list;
	}
	
	/* (non-Javadoc)
	 * @see com.wtu.sss.dao.impl.ProviderDAO#getPlaceItems()
	 * 获取所有地区选项
	 */
	public List<Place> getPlaceItems(){
		List<Place> list = this.hibernateTemplate.find("from Place");
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProviderDAO#getBankItems()
	 * 获取所有银行选项
	 */
	public List<Bank> getBankItems(){
		List<Bank> list = this.hibernateTemplate.find("from Bank");
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProviderDAO#getProviders(java.lang.String, int, int)
	 * 分页查询所有供应商
	 */
	public List<Provider> getProviders(String hql,final int offset,final int length ){
		Query query = this.hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		List<Provider> list =query.list();
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProviderDAO#addProvider(com.wtu.sss.model.Provider)
	 * 添加供应商
	 */
	public Boolean addProvider(Provider provider){
		this.hibernateTemplate.save(provider);
		this.hibernateTemplate.flush();
		return true;
	}

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProviderDAO#queryProviderByName(java.lang.String)
	 * 根据供应商名称查询相应供应商
	 */
	public List<Provider> queryProviderByName(String providerName){
		List<Provider> list = this.hibernateTemplate.find("from Provider as prov where prov.providerName='"+providerName+"'");
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProviderDAO#getBankByName(java.lang.String)
	 * 根据银行名称获取相应银行信息
	 */
	public Bank getBankByName(String bankName){
		List<Bank> list = this.hibernateTemplate.find("from Bank as bank where bank.bankName = '"+bankName+"'");
		return list.get(0);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProviderDAO#getPlaceByName(java.lang.String)
	 * 根据地区名称获取相应地区信息
	 */
	public Place getPlaceByName(String placeName){
		List<Place> list = this.hibernateTemplate.find("from Place as place where place.placeName = '"+placeName+"'");
		return list.get(0);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProviderDAO#queryProvidersForPage(java.lang.String, int, int)
	 * 根据不同hql语句，分页查询供应商
	 */
	public List<Provider> queryProvidersForPage(final String hql,final int offset,final int length){
		Query query = this.hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		List<Provider> list =query.list();
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProviderDAO#getAllRowCount(java.lang.String)
	 * 获取供应商总记录数
	 */
	public int getAllRowCount(String hql){
		return getHibernateTemplate().find(hql).size();
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProviderDAO#getProviderById(long)
	 * 根据id查询相应供应商
	 */
	public Provider getProviderById(long Id){
		List<Provider> list = this.hibernateTemplate.find("from Provider as provider where provider.id = "+Id);
		return list.get(0);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProviderDAO#updateProvider(com.wtu.sss.model.Provider)
	 * 更新供应商信息
	 */
	public boolean updateProvider(Provider prov){
		String hql = "update Provider set providerName='"
		+ prov.getProviderName() + "',place="
		+ prov.getPlace().getPlaceId() + ",phone='"
		+ prov.getPhone() + "',email='"
		+ prov.getEmail() + "',bank.bankId ="
		+ prov.getBank().getBankId()+ "  where id="
		+ prov.getId() ;
		this.hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql).executeUpdate();
		return true;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProviderDAO#deleteOneProvider(com.wtu.sss.model.Provider)
	 * 删除一条供应商记录
	 */
	public boolean deleteOneProvider(Provider provider){
		this.hibernateTemplate.delete(provider);
		return true;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProviderDAO#deleteSome(java.lang.String[])
	 * 删除若干条供应商记录
	 */
	public boolean deleteSome(String[] ids){
		List<Provider> list = new ArrayList<Provider>();
		for(int i = 0;i<ids.length;i++){
			list.add(this.getProviderById(Long.parseLong(ids[i])));
		}
		this.hibernateTemplate.deleteAll(list);
		return true;
	}

}
