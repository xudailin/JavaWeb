<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="com.wtu.sss.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看供应商</title>
<script language="javascript" src="js/jquery-1.9.1.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div>
  <table width="102%"  border="0" align="center" cellpadding="0" cellspacing="0" id="senfe">
  <thead><span id="bar"><p class="STYLE6">>>供应商查询结果</p></span>
  <a href="product!showAllProduct.action"><span class="STYLE13">返回</span></a></thead>
  <tbody>
<tr>
	<td width="16%"><span class="STYLE14">供应商编号</span></td>
	<td width="20%"><span class="STYLE14">供应商名称</span></td>
	<td width="15%"><span class="STYLE14">地区</span></td>
	<td width="13%"><span class="STYLE14">联系电话</span></td>
	<td width="10%"><span class="STYLE14">电子邮箱</span></td>
	<td width="10%"><span class="STYLE14">开户银行</span></td>
</tr>
<c:forEach var="provider" items="${provList}">
    <tr>
		<td><span class="STYLE15">${provider.providerId}</span></td>
		<td><span class="STYLE15">${provider.providerName}</span></td>
		<td><span class="STYLE15">${provider.place.placeName}</span></td>
		<td><span class="STYLE15">${provider.phone}</span></td>
		<td><span class="STYLE15">${provider.email}</span></td>
		<td><span class="STYLE15">${provider.bank.bankName}</span></td>
      </tr>
</c:forEach>
</tbody>
</table>
</div>
</body>
</html>
<script language="javascript"><!--
//senfe("表格名称","奇数行背景","偶数行背景","鼠标经过背景","点击后背景");
senfe("senfe","#fff","#ccc","#cfc","#FF8080");
-->
</script>
