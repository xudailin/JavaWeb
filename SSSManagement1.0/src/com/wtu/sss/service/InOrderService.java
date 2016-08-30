package com.wtu.sss.service;

import com.wtu.sss.util.PageBean;

public interface InOrderService {

	public abstract PageBean getAllInOrderForPage(int pageSize,int currentPage);
	public abstract boolean deleteOneById(Long inId);
	public abstract boolean deleteSome(String[] ids);
	public abstract PageBean getInOrdersByDate(String startTimeStr, String endTimeStr,int pageSize,int page);
}