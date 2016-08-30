package edu.whut.entity;

import java.io.Serializable;
import java.util.List;

public class PictrueType implements Serializable {
	
	private static final long serialVersionUID = -9168067266073769343L;
	
	private Long id;
	private String typename;
	private List<Picture> pictures;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public List<Picture> getPictures() {
		return pictures;
	}
	public void setPictures(List<Picture> pictures) {
		this.pictures = pictures;
	}
	

}
