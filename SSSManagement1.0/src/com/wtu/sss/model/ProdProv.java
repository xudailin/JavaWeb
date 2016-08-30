package com.wtu.sss.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="sys_provider_product")
public class ProdProv implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private long ppId = System.nanoTime();
	private Product product;
	private Provider provider;
	
	@Id
	public long getPpId() {
		return ppId;
	}
	public void setPpId(long ppId) {
		this.ppId = ppId;
	}
	
	@ManyToOne
    @JoinColumn(name = "prodId")
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	@ManyToOne
    @JoinColumn(name = "id")
	public Provider getProvider() {
		return provider;
	}
	public void setProvider(Provider provider) {
		this.provider = provider;
	}
	public ProdProv(Product product, Provider provider) {
		super();
		this.product = product;
		this.provider = provider;
	}
	public ProdProv() {
		super();
	}


}
