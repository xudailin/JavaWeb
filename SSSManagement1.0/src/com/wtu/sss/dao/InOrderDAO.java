package com.wtu.sss.dao;

import java.util.List;

import com.wtu.sss.model.InOrder;

public interface InOrderDAO {

	public abstract List<InOrder> queryInOrderForPage(final String hql,final int fromIndex,final int toIndex);
	public abstract InOrder queryInOrderById(Long inId);
	public abstract boolean deleteOne(InOrder inOrder);
	public abstract boolean deleteSome(String[] ids);
	public abstract int getAllRowCount(String hql);
	
}