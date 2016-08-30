package com.wtu.sss.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.wtu.sss.dao.OutOrderDAO;
import com.wtu.sss.model.OutOrder;

@Component("outOrderDAO")
public class OutOrderDAOImpl implements OutOrderDAO  {
	
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	/* (non-Javadoc)
	 * 通过接收不同的hql语句，进行不同的查询，分别为条件查询、无条件查询
	 *  将查询结果分页展示
	 */
	public List<OutOrder> queryOutOrderForPage(final String hql,final int offset,final int length){
		Query query = this.hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		List<OutOrder> list = query.list();
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.OutOrderDAO#getAllRowCount(java.lang.String)
	 * 获取出库订单总记录数
	 */
	public int getAllRowCount(String hql){
		return getHibernateTemplate().find(hql).size();
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.OutOrderDAO#deleteOne(com.wtu.sss.model.OutOrder)
	 * 删除一条出库订单
	 */
	public Boolean deleteOne(OutOrder outOrder){
		this.hibernateTemplate.delete(outOrder);
		return true;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.OutOrderDAO#queryOutOrderById(java.lang.Long)
	 * 根据id查询相应出库订单
	 */
	public OutOrder queryOutOrderById(Long outId){
		List<OutOrder> list = this.hibernateTemplate.find("from OutOrder as outOrder where outOrder.outId = "+outId);
		return list.get(0);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.OutOrderDAO#deleteSome(java.lang.String[])
	 * 删除若干条出库订单
	 */
	public Boolean deleteSome(String[] ids){
		List<OutOrder> list = new ArrayList<OutOrder>();
		for(int i = 0;i < ids.length;i++){
			list.add(this.queryOutOrderById(Long.parseLong(ids[i])));
		}
		this.hibernateTemplate.deleteAll(list);
		return true;
	}

}
