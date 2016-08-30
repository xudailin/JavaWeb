<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="com.wtu.sss.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>出库订单</title>
<%
	String basePath=request.getScheme()+"://"+request.getServerName();
	basePath=basePath+":"+request.getServerPort();
	basePath=basePath+request.getContextPath();
%>

<link href="<%=basePath%>/css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/default.js" language="javascript"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js" language="javascript"></script>
<script type="text/javascript" src="js/DatePicker/WdatePicker.js"></script>
</head>

<body id="container">
<div>
<form id="form2" name="form2" method="post" action="outOrder!queryOutOrder.action">
<div id="searchBlock">
<table border="0" cellpadding="0" cellspacing="0">
  <thead><span id="bar"><p class="STYLE6">>>出库订单</p></span></thead>
  <tbody>
  <tr><td width="100px" align="right"><span class="STYLE15"><strong>时间段：</strong></span></td>
  <td width="270px">
  <input name="startTime" id="startTime" style="width:100px;" class="Wdate" value="<s:property value='startTime'/>" onFocus="WdatePicker({isShowOthers:true,dateFmt:'yyyy-MM-dd'})" />
  <span class="STYLE15"><strong>至</strong></span>
  <input name="endTime" id="endTime" style="width:100px;" class="Wdate" value="<s:property value='endTime'/>" onFocus="WdatePicker({isShowOthers:true,dateFmt:'yyyy-MM-dd'})" />
  </td>
  <td align="left"><input type="submit" name="Submit" value="查询" />
    <input name="reset" type="reset" id="reset" value="重置" /></td>
  </tr>
  </tbody>
  </table></br>
</div>
<div id="resultBlock">
  <table  border="0" align="center" cellpadding="0" cellspacing="0" id="senfe">
  <tbody>
 <tr>
	<td width="10%" height="39"><div align="center"><span class="STYLE14">
	  <input type="checkbox" name="checkAll" value="checkbox" id="checkAll" onclick="check();"/>
	  全选</span></div></td>
    <td width="10%"><span class="STYLE14">出库编号</span></td>
    <td width="10%"><span class="STYLE14">商品编号</span></td>
    <td width="10%"><span class="STYLE14">数量</span></td>
	<td width="15%"><span class="STYLE14">负责人</span></td>
    <td width="15%"><span class="STYLE14">操作员</span></td>
    <td width="15%"><span class="STYLE14">出库日期</span></td>
    <td width="15%"><span class="STYLE14">操作</span></td>
</tr>

<c:forEach var="outOrder" items="${pageBean.list}">
    <tr>
	  <td height="61"><input type="checkbox" name="ids" value="${outOrder.outId}" /></td>
	<td ><span class="STYLE15">${outOrder.outOrderId}</span></td>
    <td><span class="STYLE15">${outOrder.product.productName}</span></td>
    <td><span class="STYLE15">${outOrder.number}</span></td>
    <td><span class="STYLE15">${outOrder.manager.managerName}</span></td>
	<td><span class="STYLE15">${outOrder.operator}</span></td>
    <td><span class="STYLE15">${outOrder.date}</span></td>
   <td><span class="STYLE15">
	<a href="outOrder!delete.action?flag=0&outId=${outOrder.outId}" class="STYLE14">删除</a></span></td>
      </tr>
</c:forEach>
</tbody>
</table>
</div>
<div id="pageBlock">
<table>
<tr>
<td width="10%"><input name="button" type="button" value="批量删除" onclick="delOutAll();" /></td>
<td align="right" width="58%">
<span class="STYLE6">共<s:property value="pageBean.allRow"/>条记录,
  共<s:property value="pageBean.totalPage"/>页,
  当前第<s:property value="pageBean.currentPage"/>页</span></td>
  <s:if test="%{pageBean.currentPage == 1}">
　　　　　　<td width="8%" align="center"><img src="<%=basePath%>/images/first.gif" border="0" /></td>
        <td width="8%" align="left"><img src="<%=basePath%>/images/pre.gif" border="0" /></td>
　</s:if>
　　　　<s:else>
　　　　　　<td width="8%" align="center"><a href="outOrder!queryOutOrder.action?page=1&startTime=<s:property value='startTime'/>&endTime=<s:property value='endTime'/>"><img src="<%=basePath%>/images/first.gif" border="0" /></a></td>
　　　　　　<td width="8%" align="left"><img src="<%=basePath%>/images/pre.gif" border="0" onclick="goOutPre();" /></a></td>
        <input type="hidden" id="page1" value=<s:property value="%{pageBean.currentPage-1}"/> />　　　　
</s:else>
　　　　<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
　　　　　　<td width="8%" align="center"><img src="<%=basePath%>/images/next.gif" border="0" onclick="goOutNext();"/></a>
        <input type="hidden" id="page2" value=<s:property value="%{pageBean.currentPage+1}"/> />
        </td>                                                                             
　　　　　　<td width="8%" align="left"><a href="outOrder!queryOutOrder.action?page=<s:property value="pageBean.totalPage"/>"><img src="<%=basePath%>/images/last.gif" border="0" /></a></td>
　　　　</s:if>
　　　　<s:else>
　　　　　　<td width="8%" align="center"><img src="<%=basePath%>/images/next.gif" border="0" /></td>
        <td width="8%" align="left"><img src="<%=basePath%>/images/last.gif" border="0" /></td>
　　　　</s:else>
</tr>　
</table>
</div>
</form>
</div>
</body>
</html>
<script language="javascript"><!--
//senfe("表格名称","奇数行背景","偶数行背景","鼠标经过背景","点击后背景");
senfe("senfe","#fff","#ccc","#cfc","#FF8080");
--></script>
