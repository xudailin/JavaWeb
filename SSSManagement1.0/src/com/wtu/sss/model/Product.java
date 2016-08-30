package com.wtu.sss.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="sys_product")
public class Product implements Serializable{
	private static final long serialVersionUID = 1L;
	private long prodId = System.nanoTime();
    private Integer productId;
    private String productName;
    private String shortName;
    private String productBatch;//批次
    private String productUnit;
    private BigDecimal productPrice;
    private Integer productStoreNum =0;
    private String productRemark;
    private Set<ProdProv> prodProv=new LinkedHashSet<ProdProv>();

	@Id
	public long getProdId() {
		return prodId;
	}
	public void setProdId(long prodId) {
		this.prodId = prodId;
	}
	
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public String getProductBatch() {
		return productBatch;
	}
	public void setProductBatch(String productBatch) {
		this.productBatch = productBatch;
	}
	public String getProductUnit() {
		return productUnit;
	}
	public void setProductUnit(String productUnit) {
		this.productUnit = productUnit;
	}
	public BigDecimal getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(BigDecimal productPrice) {
		this.productPrice = productPrice;
	} 
	public Integer getProductStoreNum() {
		return productStoreNum;
	}
	
	@OneToMany(mappedBy = "product")
	public Set<ProdProv> getProdProv() {
		return prodProv;
	}
	public void setProdProv(Set<ProdProv> prodProv) {
		this.prodProv = prodProv;
	}
	public void setProductStoreNum(Integer productStoreNum) {
		this.productStoreNum = productStoreNum;
	}
	public String getProductRemark() {
		return productRemark;
	}
	public void setProductRemark(String productRemark) {
		this.productRemark = productRemark;
	}

	public Product(Integer productId, String productName, String shortName,
			String productBatch, String productUnit, BigDecimal productPrice,
			Integer productStoreNum, String productRemark,
			Set<ProdProv> prodProv) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.shortName = shortName;
		this.productBatch = productBatch;
		this.productUnit = productUnit;
		this.productPrice = productPrice;
		this.productStoreNum = productStoreNum;
		this.productRemark = productRemark;
		this.prodProv = prodProv;
	}
	public Product() {
		super();
	}
    
    
}
