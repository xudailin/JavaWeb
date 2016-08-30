package com.wtu.sss.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.wtu.sss.dao.InOrderDAO;
import com.wtu.sss.model.InOrder;
import com.wtu.sss.service.InOrderService;
import com.wtu.sss.util.PageBean;

@Component("inOrderService")
public class InOrderServiceImpl implements InOrderService {
	private InOrderDAO inOrderDAO;
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.InOrderService#deleteSome(java.lang.String[])
	 * 删除若干条入库订单记录
	 */
	public boolean deleteSome(String[] ids){
		return this.inOrderDAO.deleteSome(ids);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.InOrderService#deleteOneById(java.lang.Long)
	 * 删除一条入库订单记录
	 */
	public boolean deleteOneById(Long inId){
		InOrder inOrder = this.inOrderDAO.queryInOrderById(inId);
		return this.inOrderDAO.deleteOne(inOrder);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.InOrderService#getInOrdersByDate(java.lang.String, java.lang.String, int, int)
	 * 通过日期时间段获取相应入库订单
	 */
	public PageBean getInOrdersByDate(String startTimeStr, String endTimeStr,int pageSize,int page){
		final String hql = "from InOrder as inOrder where inOrder.date <= '"+endTimeStr+"' and inOrder.date >= '"+startTimeStr+"' order by inOrder.inOrdeId desc";
		int allRow = this.inOrderDAO.getAllRowCount(hql);//总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);//总页数
		int currentPage = PageBean.countCurrentPage(page);
		final int offset = PageBean.countOffset(pageSize, currentPage);//当前页开始记录
		final int length = pageSize;
		List<InOrder> list = this.inOrderDAO.queryInOrderForPage(hql,offset,length);
		PageBean pageBean = new PageBean(list,allRow,totalPage,currentPage,pageSize);
		pageBean.init();
		return pageBean;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.InOrderService#getAllInOrderForPage(int, int)
	 * 获取所有的入库订单
	 */
	public PageBean getAllInOrderForPage(int pageSize,int page){
		final String hql = "from InOrder as inOrder order by inOrder.inOrdeId desc";
		int allRow = this.inOrderDAO.getAllRowCount(hql);//总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);//总页数
		int currentPage = PageBean.countCurrentPage(page);
		final int offset = PageBean.countOffset(pageSize, currentPage);//当前页开始记录
		final int length = pageSize;
		List<InOrder> list = this.inOrderDAO.queryInOrderForPage(hql,offset, length);
		PageBean pageBean = new PageBean(list,allRow,totalPage,currentPage,pageSize);
		pageBean.init();
		return pageBean;
	}

	public InOrderDAO getInOrderDAO() {
		return inOrderDAO;
	}

	@Resource
	public void setInOrderDAO(InOrderDAO inOrderDAO) {
		this.inOrderDAO = inOrderDAO;
	}
	

}
