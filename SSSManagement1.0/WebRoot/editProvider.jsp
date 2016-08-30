<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wtu.sss.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>供应商信息更新</title>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/default.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" />
</head>

<body onload="init();">
<div>
<form method="post" action="provider!updateProvider.action?id=${provider.id}">
<table cellpadding="0" cellspacing="0" style="margin-left: 200px;width: 550px;">
<thead><span id="bar"><p align="left" class="STYLE6">>>供应商信息更新（注：带<strong><span class="STYLE11">*</span></strong>号的为必）</p></span></thead>
<tbody>
<tr>
    <td colspan="2"><a href="provider!queryProvider.action"><span class="STYLE18">返回</span></a></td>
    </tr>
<tr>
<td><p align="right"><span class="STYLE5">供应商编号：</span></p></td>
<td align="left"><input name="providerId" type="text" id="providerId"  value="${provider.providerId}" readonly="readonly"/></td>
</tr>
<tr>
<td><p align="right"><span class="STYLE5">供应商名称：</span></p></td>
<td align="left"> <input name="providerName" type="text" id="providerName" value="${provider.providerName}"/>
        <span class="STYLE11">* </span></td>
</tr>
<tr>
<td><p align="right"><span class="STYLE5">地区：</span></p></td>
<td align="left"><select id="placeId" style="width:150px;" name="place.placeName" >
    	<option value="-1">--请选择--</option>
    	<c:forEach items="${listPlace}" var="place1">
    	<c:if test="${place1.placeName==provider.place.placeName}">
	   	<option value="${place1.placeName }" selected = "selected">${place1.placeName }</option>
    	</c:if>
    	</c:forEach>
      </select>
      <span id="nameHint"></span><span class="STYLE11">*</span></td></tr>
<tr>
<td><p align="right"><span class="STYLE5">联系电话：</span></p></td>
<td align="left"><input name="phone" type="text" id="phone" value="${provider.phone}"/>
      <span class="STYLE11">*</span></td>
</tr>
<tr>
<td><p align="right"><span class="STYLE5">E-Mail：</span></p></td>
<td align="left"><input name="email" type="text" id="email" value="${provider.email}"/></td>
</tr>
<tr>
<td><p align="right"><span class="STYLE5">开户银行：</span></p></td>
<td align="left"><select id="bankId" style="width:150px;" name="bank.bankName" >
    	<option value="-1">--请选择--</option>
    	<c:forEach items="${listBank}" var="bank1">
    	<c:if test="${bank1.bankName==provider.bank.bankName}">
	   	<option value="${bank1.bankName }" selected = "selected">${bank1.bankName }</option>
    	</c:if>
    	</c:forEach>
      </select></td>
</tr>
<tr>
<td align="right"><input type="submit" name="Submit" value="保存信息" /></td>
<td align="left"><input name="reset" type="reset" id="reset" value="重置" /></td>
</tr>
</tbody>
</table>
 </form> 
</div>
 </body>
</html>
