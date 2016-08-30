package com.wtu.sss.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.wtu.sss.dao.ProductDAO;
import com.wtu.sss.model.InOrder;
import com.wtu.sss.model.Manager;
import com.wtu.sss.model.OutOrder;
import com.wtu.sss.model.ProdProv;
import com.wtu.sss.model.Product;
import com.wtu.sss.model.Provider;

@Component("productDAO")
public class ProductDAOImpl implements ProductDAO {
	
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
	 * @see com.wtu.sss.dao.ProductDAO#queryProductId(int)
	 * 根据货物编号获取该货物相关信息
	 */
	public List<Product> queryProductId(int productId){
		List<Product> list = this.hibernateTemplate.find("from Product as prod where prod.productId = " + productId);
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProductDAO#queryProductName(java.lang.String)
	 * 根据货物名称查询货物
	 */
	public List<Product> queryProductName(String productName){
		List<Product> list = this.hibernateTemplate.find("from Product as prod where prod.productName = '" + productName+"'");
		return list;
	}

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.impl.ProductDAO#getAllProduct()
	 * 根据不同hql语句，分页查询货物信息
	 */
	public List<Product> queryProductForPage(final String hql,final int offset,final int length) {
		Query query = this.hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		List<Product> list =query.list();
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProductDAO#getAllRowCount(java.lang.String)
	 * 获取货物总记录数
	 */
	public int getAllRowCount(String hql){
		return getHibernateTemplate().find(hql).size();
	}

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProductDAO#getProductById(long)
	 * 根据货物id获取该货物相关信息
	 */
	public Product getProductById(long prodId) {
		List<Product> list = this.hibernateTemplate
				.find("from Product as product where product.prodId = "
						+ prodId);
		return list.get(0);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProductDAO#updateProductNum(com.wtu.sss.model.Product)
	 * 更新货物数量
	 */
	public boolean updateProductNum(Product product) {
		this.hibernateTemplate.update(product);
		return true;
	}

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProductDAO#insertInOrder(com.wtu.sss.model.InOrder)
	 * 添加入库订单
	 */
	public boolean insertInOrder(InOrder inOrder) {
		this.hibernateTemplate.save(inOrder);
		return true;
	}

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProductDAO#insertOutOrder(com.wtu.sss.model.OutOrder)
	 * 添加出库订单
	 */
	public boolean insertOutOrder(OutOrder outOrder) {
		this.hibernateTemplate.save(outOrder);
		return true;
	}

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProductDAO#getManagerItems()
	 * 查询得到所有负责人选项
	 */
	public List<Manager> getManagerItems() {
		List<Manager> list = this.hibernateTemplate.find("from Manager");
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProductDAO#getProviderItems()
	 * 查询得到所有供应商选项
	 */
	public List<Provider> getProviderItems() {
		List<Provider> list = this.hibernateTemplate.find("from Provider");
		return list;
	}

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProductDAO#getManagerByName(java.lang.String)
	 * 通过负责人姓名获取该负责人相关信息
	 */
	public Manager getManagerByName(String managerName) {
		List<Manager> list = this.hibernateTemplate
				.find("from Manager as manager where manager.managerName = '"
						+ managerName + "'");
		return list.get(0);
	}

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProductDAO#getProvidersByProdId(long)
	 * 根据货物id获取该货物的所有供应商
	 */
	public List<Provider> getProvidersByProdId(long prodId) {
		List<Provider> list = this.hibernateTemplate
				.find("select pp.provider from ProdProv pp where pp.product.prodId = "
						+ prodId);
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProductDAO#addProduct(com.wtu.sss.model.Product)
	 * 添加货物
	 */
	public boolean addProduct(Product product){
		this.hibernateTemplate.save(product);
		this.hibernateTemplate.flush();
		return true;
	}
	
	public boolean addProdProv(Product product,Provider provider){
		ProdProv prodProv = new ProdProv(product,provider);
		this.hibernateTemplate.save(prodProv);
		return true;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.ProductDAO#deleteProduct(java.lang.String[])
	 * 批量删除
	 */
	public Boolean deleteProduct(String[] ids){
		List<Product> list = new ArrayList<Product>();
		for(int i = 0;i < ids.length;i++){
			Product product = new Product();
			product = this.getProductById(Long.parseLong(ids[i]));
			list.add(product);
		}
		this.hibernateTemplate.deleteAll(list);
		return true;
	}

}
