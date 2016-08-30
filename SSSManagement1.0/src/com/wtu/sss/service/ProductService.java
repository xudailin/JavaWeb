package com.wtu.sss.service;

import java.util.List;

import com.wtu.sss.model.InOrder;
import com.wtu.sss.model.Manager;
import com.wtu.sss.model.OutOrder;
import com.wtu.sss.model.Product;
import com.wtu.sss.model.Provider;
import com.wtu.sss.util.PageBean;

public interface ProductService {

	public abstract PageBean getAllProductForPage(int pageSize,int page);
	public abstract PageBean getProducts(Product product,int pageSize,int page);
	public abstract Product getProductById(long prodId);
	public abstract boolean updateProductNum(Product product);
	public abstract boolean addInOrder(InOrder inOrder);
	public abstract List<Manager> getManagerItems();
	public abstract Manager getManagerByName(String managerName);
	public abstract boolean addOutOrder(OutOrder outOrder);
	public abstract List<Provider> getProvidersByProdId(long prodId);
	public abstract List<Provider> getProviderItems();
	public abstract boolean addProduct(Product product);
	public abstract boolean addProdProv(Product product,Provider provider);
	public abstract Boolean deleteProduct(String[] ids);
	public abstract boolean checkProductId(int productId);
	public abstract boolean checkProductName(String productName);
}