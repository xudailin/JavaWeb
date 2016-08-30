package com.wtu.sss.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="sys_order_out")
public class OutOrder implements Serializable{
	private static final long serialVersionUID = 1L;
	private long outId = System.nanoTime();
	private Integer outOrderId;
	private Product product;
	private Integer number;
	private Manager manager;
    private String operator;
    private Date date;
    
    @Id
	public long getOutId() {
		return outId;
	}
	public void setOutId(long outId) {
		this.outId = outId;
	}
	public Integer getOutOrderId() {
		return outOrderId;
	}
	public void setOutOrderId(Integer outOrderId) {
		this.outOrderId = outOrderId;
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

	public OutOrder(Integer outOrderId, Product product, Integer number,
			Manager manager, String operator, Date date) {
		super();
		this.outOrderId = outOrderId;
		this.product = product;
		this.number = number;
		this.manager = manager;
		this.operator = operator;
		this.date = date;
	}
	public OutOrder() {
		super();
	}
    
	
}
