package com.wtu.sss.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.wtu.sss.dao.InOrderDAO;
import com.wtu.sss.model.InOrder;

@Component("inOrderDAO")
public class InOrderDAOImpl implements InOrderDAO {
	
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
		
	/* 
	 * 通过接收不同的hql语句，进行不同的查询，分别为条件查询、无条件查询
	 * 将查询结果分页展示
	 */
	public List<InOrder> queryInOrderForPage(final String hql,final int offset,final int length){
		Query query = this.hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		List<InOrder> list =query.list();
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.InOrderDAO#getAllRowCount(java.lang.String)
	 * 获取入库订单总记录数
	 */
	public int getAllRowCount(String hql){
		return getHibernateTemplate().find(hql).size();
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.InOrderDAO#queryInOrderById(java.lang.Long)
	 * 根据id查询相应入库订单
	 */
	public InOrder queryInOrderById(Long inId){
		List<InOrder> list = this.hibernateTemplate.find("from InOrder as inOrder where inOrder.inId = "+inId);
		return list.get(0);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.InOrderDAO#deleteOne(com.wtu.sss.model.InOrder)
	 * 删除一条入库订单
	 */
	public boolean deleteOne(InOrder inOrder){
		this.hibernateTemplate.delete(inOrder);
		return true;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.InOrderDAO#deleteSome(java.lang.String[])
	 * 删除若干条入库订单
	 */
	public boolean deleteSome(String[] ids){
		List<InOrder> list = new ArrayList<InOrder>();
		for(int i = 0;i<ids.length;i++){
			list.add(this.queryInOrderById(Long.parseLong(ids[i])));
		}
		this.hibernateTemplate.deleteAll(list);
		return true;
	}

}
