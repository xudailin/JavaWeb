package com.wtu.sss.action;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wtu.sss.model.InOrder;
import com.wtu.sss.service.InOrderService;
import com.wtu.sss.util.PageBean;

@Component("inOrder")
@Scope("prototype")
public class InOrderAction extends ActionSupport implements
		ModelDriven<InOrder> {
	
	private InOrderService inOrderService;
	private List<InOrder> list;
	private InOrder inOrder = new InOrder();
	private int page;
	public PageBean pageBean;
	private String startTime;
	private String endTime;

	/*
	 * 获得所有的入库订单
	 */
	public String getAllInOrder() throws Exception {
		pageBean = this.inOrderService.getAllInOrderForPage(3, page);
		return "queryInOrderSuccess";
	}

	/*
	 * 根据管理员输入的时间段，查询相应的入库订单
	 */
	public String queryInOrder() throws Exception {
		if ((!(startTime == null || endTime == null))&& (startTime.trim().length() != 0 || endTime.trim().length() != 0)) {
			pageBean = this.inOrderService.getInOrdersByDate(startTime,endTime, 3, page);
			return "queryInOrderSuccess";
		} else {
			pageBean = this.inOrderService.getAllInOrderForPage(3, page);
			return "queryInOrderSuccess";
		}
	}

	/*
	 * 删除入库订单
	 */
	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String flag = request.getParameter("flag");
		if (flag.equals("0")) {
			String inId = request.getParameter("inId");
			Long id = Long.parseLong(inId);
			String[] str = { "确定", "取消" };
			int res = JOptionPane.showOptionDialog(null, "您确信要删除该条记录吗",
					"Question", JOptionPane.YES_NO_OPTION,
					JOptionPane.QUESTION_MESSAGE, null, str, str[1]);
			if (res == 0) {
				this.inOrderService.deleteOneById(id);
				return "deleteInOrderSuccess";
			}
		} else {
			String[] ids = new String[] {};
			ids = request.getParameterValues("ids");
			if (ids.length == 0) {
				JOptionPane.showMessageDialog(null, "请选择要删除的记录！", "Warning",
						JOptionPane.WARNING_MESSAGE);
			} else {
				String[] str = { "确定", "取消" };
				int res = JOptionPane.showOptionDialog(null, "确定要删除这"
						+ ids.length + "条的记录吗？", "Question",
						JOptionPane.YES_NO_OPTION,
						JOptionPane.QUESTION_MESSAGE, null, str, str[1]);
				if (res == 0) {
					this.inOrderService.deleteSome(ids);
					return "deleteInOrderSuccess";
				}
			}
		}
		return "deleteInOrderFailure";
	}

	public InOrderService getInOrderService() {
		return inOrderService;
	}

	@Resource
	public void setInOrderService(InOrderService inOrderService) {
		this.inOrderService = inOrderService;
	}

	public List<InOrder> getList() {
		return list;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	public InOrder getModel() {
		return this.inOrder;
	}

}
