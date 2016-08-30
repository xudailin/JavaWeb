<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品信息添加</title>
<script language="javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/default.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" />
</head>

<body onload="initProvider();">
<div>
<form method="post" action="product!addProduct.action">
<table cellpadding="0" cellspacing="0" id="addTab">
<thead>
<span id="bar"><p align="left" class="STYLE6">>>商品信息增加（注：带<strong><span class="STYLE11">*</span></strong>号的为必填）</p></span></thead>
<tbody>
<tr><td colspan="2"><a href="product!showAllProduct.action" class="STYLE17">返回</a></td>
</tr>
     <tr><td><p align="right"><span class="STYLE5">商品编号：</span></p></td>　
     <td align="left"> <input name="productId" type="text" id="productId" onblur="validateProductId();"/>
     <span id="IDhint" style="font-size: 12px"></span><span class="STYLE11">*</span> </td>
	 </tr>
    <tr><td><p align="right"><span class="STYLE5">商品全称：</span></p></td>
          <td align="left"><input name="productName" type="text" id="productName" onblur="validateProductName();"/>
          <span id="productNameHint" style="font-size: 12px"></span><span class="STYLE11">*</span></td>
     </tr>
      <tr><td><p align="right"><span class="STYLE5">简称：</span></p></td>
        <td align="left"><input name="shortName" type="text" id="shortName" onblur="validateShortName();" />
        <span id="shortNameHint"></span><span class="STYLE11">*</span></td>
       </tr>
       <tr><td><p align="right"><span class="STYLE5">批号：</span></p></td>
        <td align="left"><input name="productBatch" type="text" id="productBatch" onblur="validateProductBatch();" />
        <span id="productBatchHint"></span><span class="STYLE11">*</span></td></tr>
	   <tr><td><p align="right"><span class="STYLE5">单位：</span></p></td>
        <td align="left"><input name="productUnit" type="text" id="productUnit" onblur="validateProductUnit();" />
        <span id="productUnitHint"></span><span class="STYLE11">*</span></td>
		</tr>
	       <tr><td><p align="right"><span class="STYLE5">单价：</span></p></td>
        <td align="left"><input name="productPrice" type="text" id="productPrice" onblur="validateProductPrice();" />
        <span id="productPriceHint"></span><span class="STYLE11">*</span></td>
		</tr>
	       <tr><td><p align="right"><span class="STYLE5">供应商：</span></p></td>
        <td align="left">
        <select id="providerId" style="width:150px;" name="provider.providerName" onblur="validateProvider();">
    	<option value="-1">--请选择--</option>
      </select>
        <span id="providerHint"></span><span class="STYLE11">*</span></td>
      　　　</tr>
       <tr><td><p align="right"><span class="STYLE5">备注：</span></p></td>
        <td align="left"><textarea rows="2" cols="30" name="productRemark" id="productRemark"></textarea><span class="STYLE11">*</span></td>
      　　　</tr>
  <tr>
  <td align="right"><input type="submit" name="submit" value="保存信息" /></td>
  <td align="left">　<input name="reset" type="reset" id="reset" value="重置" /></td></tr>
  </tbody>
</table>
</form>
</div>
</body>
</html>