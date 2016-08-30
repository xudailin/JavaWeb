package com.wtu.sss.model;

import java.io.Serializable;
import java.util.HashSet;
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

@Entity
@Table(name="sys_provider")
public class Provider implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private long id = System.nanoTime();
	private Integer providerId;
	private String providerName;
	private Place place;
	private String phone;
	private String email;
	private Bank bank;
	private Set<ProdProv> prodProv=new LinkedHashSet<ProdProv>();
	
	@Id
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getProviderName() {
		return providerName;
	}
	public void setProviderName(String providerName) {
		this.providerName = providerName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@ManyToOne(targetEntity=Place.class)
	@JoinColumn(name="placeId",referencedColumnName="placeId")
	public Place getPlace() {
		return place;
	}
	public void setPlace(Place place) {
		this.place = place;
	}
	@ManyToOne(targetEntity=Bank.class)
	@JoinColumn(name="bankId",referencedColumnName="bankId")
	public Bank getBank() {
		return bank;
	}
	public void setBank(Bank bank) {
		this.bank = bank;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getProviderId() {
		return providerId;
	}
	
	@OneToMany(mappedBy = "provider")
	public Set<ProdProv> getProdProv() {
		return prodProv;
	}
	public void setProdProv(Set<ProdProv> prodProv) {
		this.prodProv = prodProv;
	}
	public void setProviderId(Integer providerId) {
		this.providerId = providerId;
	}
	public Provider() {
		super();
	}
	public Provider(Integer providerId, String providerName, Place place,
			String phone, String email, Bank bank, Set<ProdProv> prodProv) {
		super();
		this.providerId = providerId;
		this.providerName = providerName;
		this.place = place;
		this.phone = phone;
		this.email = email;
		this.bank = bank;
		this.prodProv = prodProv;
	}

}
