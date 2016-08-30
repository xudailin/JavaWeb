package com.wtu.sss.service;

import java.util.List;

import com.wtu.sss.model.OutOrder;
import com.wtu.sss.util.PageBean;

public interface OutOrderService {

	public abstract PageBean getAllOutOrderForPage(int pageSize,int page);
	public abstract Boolean deleteOneById(Long outId);
	public abstract Boolean deleteSome(String[] ids);
	public abstract PageBean getOutOrdersByDate(String startDateStr,String endDateStr, int pageSize, int page);
}