package com.wtu.sss.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="sys_order_in")
public class InOrder implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Long inId = System.nanoTime();
	private Integer inOrdeId;
	private Product product;
	private Integer number;
    private Manager manager;
    private String operator;
    private Date date;

    @Id
	public long getInId() {
		return inId;
	}
	public void setInId(Long inId) {
		this.inId = inId;
	}

	@Column(name="inOrderId")
	public Integer getInOrdeId() {
		return inOrdeId;
	}
	public void setInOrdeId(Integer inOrdeId) {
		this.inOrdeId = inOrdeId;
	}
	@ManyToOne(targetEntity=Product.class)
	@JoinColumn(name="productId",referencedColumnName="prodId")
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
    
	@ManyToOne(targetEntity=Manager.class)
	@JoinColumn(name="managerId",referencedColumnName="managerId")
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	public InOrder(Integer inOrdeId, Product product, Integer number,
			Manager manager, String operator, Date date) {
		super();
		this.inOrdeId = inOrdeId;
		this.product = product;
		this.number = number;
		this.manager = manager;
		this.operator = operator;
		this.date = date;
	}
	public InOrder() {
		super();
	}
    
    
}
