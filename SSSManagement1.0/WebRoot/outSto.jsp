<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>商品出库登记</title>
<script language="javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/default.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" />
</head>

<body onload="initManager();">
<div>
<form method="post" action="product!productOutSto.action?prodId=${product.prodId}">
<table align="center" cellpadding="0" cellspacing="0">
<thead><span id="bar"><p align="left" class="STYLE6">>>商品出库登记（注：带<strong><span class="STYLE11">*</span></strong>号的为必填）</p></span></thead>
<tbody>
  <tr>
  <td colspan="2"><a href="product!showAllProduct.action" class="STYLE19">返回</a></td></tr>
    <tr>
	<td><p align="right"><span class="STYLE5">商品编号：</span></p></td>
    <td> <input name="productId" type="text" id="productId" value="${product.productId}" readonly="readonly" onfocus="this.blur()"/>
   </td></tr>
	<tr>
    <td><p align="right"><span class="STYLE5">商品名称：</span></p></td>
    <td><input name="productName" type="text" id="productName" value="${product.productName}" readonly="readonly" onfocus="this.blur()"/></td></tr>
    <tr>
	<td><p align="right"><span class="STYLE5">库存量：</span></p></td>
     <td> <input name="productStoreNum" type="text" id="productStoreNum" value="${product.productStoreNum}" readonly="readonly" onfocus="this.blur()"/></td>
    </tr>
	<tr>
	<td><p align="right"><span class="STYLE5">出库编号：</span></p></td>
     <td>  <input name="outOrderId" type="text" id="outOrderId" /> <span id="IDhint"></span><span class="STYLE11">*</span></td>
     </tr>
     <tr> 
	 <td><p align="right"><span class="STYLE5">数量：</span></p></td>
        <td><input name="number" type="text" id="number" />
       <span class="STYLE11">*</span></td></tr>
            <tr>
	  <td><p align="right"><span class="STYLE5">负责人：</span></p></td>　
        <td> <select id="managerId" style="width:150px;" name="manager.managerName" value="${manager.managerName }">
    	<option value="-1">--请选择--</option>
      </select><span class="STYLE11">*</span>　</td>
		</tr>
      <tr>
	  <td><p align="right"><span class="STYLE5">操作员：</span></p></td>　
        <td><input name="operator" type="text" id="operator" value="${sessionScope.currentAdmin.getAdminName()}" readonly="readonly"/>
        <span class="STYLE11">*</span>　</td>
		</tr>
      <tr>
	  <td><p align="right"><span class="STYLE5">出库日期：</span></p></td>　
       <td>  <input name="date" type="text" id="date" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime())%>" readonly="readonly" onfocus="this.blur()"/></td>
      </tr>
 <tr>
 <td align="right">
    <input type="submit" name="Submit" value="保存信息" />
    </td><td align="left">　　　　
    <input name="reset" type="reset" id="reset" value="重置" /></td>
</tr>
</tbody>
</table>
</form>
</div>
 </body>
</html>