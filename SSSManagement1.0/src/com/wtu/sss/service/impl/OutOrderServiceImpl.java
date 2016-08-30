package com.wtu.sss.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.wtu.sss.dao.InOrderDAO;
import com.wtu.sss.dao.OutOrderDAO;
import com.wtu.sss.model.InOrder;
import com.wtu.sss.model.OutOrder;
import com.wtu.sss.service.InOrderService;
import com.wtu.sss.service.OutOrderService;
import com.wtu.sss.util.PageBean;

@Component("outOrderService")
public class OutOrderServiceImpl implements OutOrderService {
	private OutOrderDAO outOrderDAO;
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.OutOrderService#getOutOrdersByDate(java.lang.String, java.lang.String, int, int)
	 * 通过日期时间段获取相应出库订单
	 */
	public PageBean getOutOrdersByDate(String startDateStr,String endDateStr, int pageSize, int page){
		final String hql = "from OutOrder as outOrder where outOrder.date <= '"+endDateStr+"' and outOrder.date >= '"+startDateStr+"' order by outOrder.outOrderId desc";
		int allRow = this.outOrderDAO.getAllRowCount(hql);//总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);//总页数
		int currentPage = PageBean.countCurrentPage(page);
		final int offset = PageBean.countOffset(pageSize, currentPage);//当前页开始记录
		final int length = pageSize;
		List<OutOrder> list = this.outOrderDAO.queryOutOrderForPage(hql,offset,length);
		PageBean pageBean = new PageBean(list,allRow,totalPage,currentPage,pageSize);
		pageBean.init();
		return pageBean;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.OutOrderService#deleteSome(java.lang.String[])
	 * 删除若干条出库订单记录
	 */
	public Boolean deleteSome(String[] ids){
		return this.outOrderDAO.deleteSome(ids);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.OutOrderService#deleteOneById(java.lang.Long)
	 * 删除一条出库订单记录
	 */
	public Boolean deleteOneById(Long outId){
		OutOrder outOrder = this.outOrderDAO.queryOutOrderById(outId);
		this.outOrderDAO.deleteOne(outOrder);
		return true;
	}

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.OutOrderService#getAllOutOrderForPage(int, int)
	 * 查询得到所有的出库订单
	 */
	public PageBean getAllOutOrderForPage(int pageSize,int page){
		final String hql = "from OutOrder as outOrder order by outOrder.outOrderId desc";
		int allRow = this.outOrderDAO.getAllRowCount(hql);//总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);//总页数
		int currentPage = PageBean.countCurrentPage(page);
		final int offset = PageBean.countOffset(pageSize, currentPage);//当前页开始记录
		final int length = pageSize;
		List<OutOrder> list = this.outOrderDAO.queryOutOrderForPage(hql,offset, length);
		PageBean pageBean = new PageBean(list,allRow,totalPage,currentPage,pageSize);
		pageBean.init();
		return pageBean;
	}

	public OutOrderDAO getOutOrderDAO() {
		return outOrderDAO;
	}

	@Resource
	public void setOutOrderDAO(OutOrderDAO outOrderDAO) {
		this.outOrderDAO = outOrderDAO;
	}
	

}
