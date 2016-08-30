<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="com.wtu.sss.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>供应商管理</title>
<link rel="stylesheet" href="css/default.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/default.js"></script>
</head>

<body onload="init();">
<div id="container">
<form method="post" action="provider!queryProvider.action" name="form1">
<div id="searchBlock">
  <table cellspacing="0" cellpadding="0" id="search">
  <thead><span id="bar"><p class="STYLE6">>>请选择输入查询条件</p></span></thead>
  <tbody>
  <tr>
  <td><p align="right"><span class="STYLE5">供应商编号：</span></p></td>
  <td><input name="providerId" type="text" id="providerId"/></td>
  <td><p align="right"><span class="STYLE5">供应商名称：</span></p></td>
  <td><input name="providerName" type="text" id="providerName"/></td>
  </tr>
  <tr>      
  <td><p align="right"><span class="STYLE5">地区：</span></p></td>
  <td>
	  <select id="placeId" style="width:150px;" name="place.placeName">   
	   	<option value="-1">--请选择--</option>
      </select>
	   <span id="nameHint"></span></td>
  <td><p align="right"><span class="STYLE5">开户银行：</span></p></td>
  <td>
	  <select id="bankId" style="width:150px;" name="bank.bankName" value="${provider.bank.bankName }">
    	<option value="-1">--请选择--</option>
      </select>
  </td>
  </tr>
	<tr>
    <td align="right"><input type="submit" name="Submit" value="开始查询" /></td>
	<td align="left"><input name="reset" type="reset" id="reset" value="重置" /></td>
	</tr>
	</tbody>
	</table>
	</div>
<div id="resultBlock">	
<table border="0" align="center" cellpadding="0" cellspacing="0" id="senfe">
  <thead><span id="bar"><p class="STYLE6">>>供应商查询结果</p></span></thead>
  <tbody>
<tr>
	<td width="7%"><div align="center"><span class="STYLE14">
	  <input type="checkbox" name="checkAll" value="checkbox"  id="checkAll" onclick="check();"/>
	  全选</span></div></td>
	<td width="8%"><span class="STYLE14">供应商编号</span></td>
	<td width="20%"><span class="STYLE14">供应商名称</span></td>
	<td width="15%"><span class="STYLE14">地区</span></td>
	<td width="13%"><span class="STYLE14">联系电话</span></td>
	<td width="10%"><span class="STYLE14">电子邮箱</span></td>
	<td width="10%"><span class="STYLE14">开户银行</span></td>
	<td width="9%"><span class="STYLE14">操作</span></td>
</tr>

<c:forEach var="provider" items="${pageBean.list}">
    <tr class="STYLE15">
	  <td height="61"><input type="checkbox" name="ids" value="${provider.id}" /></td>
		<td height="37"><span class="STYLE15">${provider.providerId}</span></td>
		<td><span class="STYLE15">${provider.providerName}</span></td>
		<td><span class="STYLE15">${provider.place.placeName}</span></td>
		<td><span class="STYLE15">${provider.phone}</span></td>
		<td><span class="STYLE15">${provider.email}</span></td>
		<td><span class="STYLE15">${provider.bank.bankName}</span></td>
		<td><a href="provider!delete.action?flag=0&id=${provider.id}"><span class="STYLE6">删除</span></a> 
		<a href="provider!getProviderById.action?id=${provider.id}"><span class="STYLE6">更新</span></a></td>
      </tr>
</c:forEach>
</tbody>
</table>
<div>
<table>
<tr>
<td width="10%"><input name="button" type="button" value="批量删除"  onclick="delProvAll()"/></td>　　
 <td><input name="button" type="button" id="button" value="新增" onclick="go('addProvider.jsp')"/></td>
<td align="right" width="58%"><span class="STYLE6">共<s:property value="pageBean.allRow"/>条记录,
  共<s:property value="pageBean.totalPage"/>页,
  当前第<s:property value="pageBean.currentPage"/>页</span></td>
  <s:if test="%{pageBean.currentPage == 1}">
　　　　　　<td width="8%" align="center"><img src="images/first.gif" border="0" /></td>
								<td width="8%" align="left"><img
									src="images/pre.gif" border="0" />
								</td>
							</s:if>
　　　　<s:else>
　　　　　　<td width="8%" align="center"><a href="provider!getAllProviders.action?page=1"><img src="images/first.gif" border="0" /></a></td>
　　　　　　<td width="8%" align="left"><a href="provider!getAllProviders.action?page=<s:property value="%{pageBean.currentPage-1}"/>"><img src="images/pre.gif" border="0" /></a></td>
　　　　</s:else>
　　　　<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
　　　　　　<td width="8%" align="center"><a href="provider!getAllProviders.action?page=<s:property value="%{pageBean.currentPage+1}"/>"><img src="images/next.gif" border="0" /></a></td>
　　　　　　<td width="8%" align="left"><a href="provider!getAllProviders.action?page=<s:property value="pageBean.totalPage"/>"><img src="images/last.gif" border="0" /></a></td>
　　　　</s:if>
　　　　<s:else>
　　　　　　<td width="8%" align="center"><img src="images/next.gif" border="0" /></td>
        <td width="8%" align="left"><img src="images/last.gif" border="0" /></td>
　　　　</s:else></td>
</tr>　
</table>
</div>
</div>
</form>
</div>
</body>
</html>
<script language="javascript"><!--
//senfe("表格名称","奇数行背景","偶数行背景","鼠标经过背景","点击后背景");
senfe("senfe","#fff","#ccc","#cfc","#FF8080");
-->
</script>
