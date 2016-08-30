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
import com.wtu.sss.model.OutOrder;
import com.wtu.sss.service.OutOrderService;
import com.wtu.sss.util.PageBean;

@Component("outOrder")
@Scope("prototype")
public class OutOrderAction extends ActionSupport implements
		ModelDriven<OutOrder> {

	private OutOrderService outOrderService;
	private List<OutOrder> list;
	private OutOrder outOrder = new OutOrder();
	private int page;
	private PageBean pageBean;
	private String startTime;
	private String endTime;

	/*
	 * 获得所有的出库订单
	 */
	public String getAllOutOrder() {
		pageBean = this.outOrderService.getAllOutOrderForPage(3, page);
		return "queryOutOrderSuccess";
	}

	/*
	 * 根据管理员输入的时间段，查询相应的出库订单
	 */
	public String queryOutOrder() throws Exception {
		if ((!(startTime == null || endTime == null))
				&& (startTime.trim().length() != 0 || endTime.trim().length() != 0)) {
			pageBean = this.outOrderService.getOutOrdersByDate(startTime,
					endTime, 3, page);
			return "queryOutOrderSuccess";
		} else {
			pageBean = this.outOrderService.getAllOutOrderForPage(3, page);
			return "queryOutOrderFailure";
		}
	}

	/*
	 * 删除出库订单
	 */
	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String flag = request.getParameter("flag");
		if (flag.equals("0")) {
			String inId = request.getParameter("outId");
			Long id = Long.parseLong(inId);
			String[] str = { "确定", "取消" };
			int res = JOptionPane.showOptionDialog(null, "您确信要删除该条记录吗",
					"Question", JOptionPane.YES_NO_OPTION,
					JOptionPane.QUESTION_MESSAGE, null, str, str[1]);
			if (res == 0) {
				this.outOrderService.deleteOneById(id);
				return "deleteOutOrderSuccess";
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
					this.outOrderService.deleteSome(ids);
					return "deleteOutOrderSuccess";
				}
			}
		}
		return "deleteOutOrderFailure";
	}

	public OutOrderService getOutOrderService() {
		return outOrderService;
	}

	@Resource
	public void setOutOrderService(OutOrderService outOrderService) {
		this.outOrderService = outOrderService;
	}

	public List<OutOrder> getList() {
		return list;
	}

	public OutOrder getModel() {
		return this.outOrder;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public OutOrder getOutOrder() {
		return outOrder;
	}

	public void setOutOrder(OutOrder outOrder) {
		this.outOrder = outOrder;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

}
