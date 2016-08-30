package com.wtu.sss.dao;

import java.util.List;

import com.wtu.sss.model.OutOrder;

public interface OutOrderDAO {

	public abstract List<OutOrder> queryOutOrderForPage(final String hql,final int offset,final int length);
	public abstract Boolean deleteOne(OutOrder outOrder);
	public abstract OutOrder queryOutOrderById(Long outId);
	public abstract Boolean deleteSome(String[] ids);
	public abstract int getAllRowCount(String hql);

}