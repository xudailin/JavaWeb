package com.wtu.sss.dao;

import java.util.List;

import com.wtu.sss.model.InOrder;
import com.wtu.sss.model.Manager;
import com.wtu.sss.model.OutOrder;
import com.wtu.sss.model.Product;
import com.wtu.sss.model.Provider;

public interface ProductDAO {

	public abstract List<Product> queryProductForPage(final String hql,final int offset,final int length);
	public abstract int getAllRowCount(String hql);
	public abstract Product getProductById(long prodId);
	public abstract boolean updateProductNum(Product product);
	public abstract boolean insertInOrder(InOrder inOrder);
	public abstract boolean insertOutOrder(OutOrder outOrder);
	public abstract List<Manager> getManagerItems();
	public abstract Manager getManagerByName(String managerName);
	public abstract List<Provider> getProvidersByProdId(long prodId);
	public abstract List<Provider> getProviderItems();
	public abstract boolean addProduct(Product product);
	public abstract boolean addProdProv(Product product,Provider provider);
	public abstract Boolean deleteProduct(String[] ids);
	public abstract List<Product> queryProductId(int productId);
	public abstract List<Product> queryProductName(String productName);
	
}