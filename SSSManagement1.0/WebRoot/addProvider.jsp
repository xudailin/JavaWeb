<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>供应商信息增加</title>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/default.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" />
</head>

<body onload="init();">
<div>
<form method="post" action="provider!addProvider.action">
<table  id="addTab">
<thead><span id="bar"><p align="left"class="STYLE6"/>>>供应商信息增加（注：带<strong><span class="STYLE11">*</span></strong>号的为必填）</p></span></thead>
<tbody>
　　<tr>
    <td colspan="3"><a href="provider!queryProvider.action" ><span class="STYLE16">返回</span></a></td></tr>
    <tr><td><p align="right"><span class="STYLE5">供应商编号：</span></p></td>　
      <td align="right"><input name="providerId" type="text" id="providerId" onblur="validateProviderId();"/> </td>         
      <td align="left" style="font-size: 12px"><span  id="IDhint"></span><span  class="STYLE11">* </span></td></tr>
    <tr><td><p align="right"><span class="STYLE5">　供应商名称：</span></p></td>
          <td align="right"><input name="providerName" type="text" id="providerName" onblur="validateProviderName();"/></td>
        <td align="left" style="font-size: 12px"><span  id="providerNameHint"></span><span  class="STYLE11">* </span></td></tr>
      <tr><td><p align="right"><span class="STYLE5">地区：</span></p></td>
        <td align="right"><select id="placeId" style="width:150px;" name="place.placeName" onblur="validateProviderPlace();">
    	<option value="-1">--请选择--</option>
      </select></td><td align="left"><span class="STYLE11" id="placeHint">*</span></td>
     　</tr>
      <tr><td><p align="right"><span class="STYLE5">联系电话：</span></p></td>
        <td align="right"><input name="phone" type="text" id="phone" onblur="validateProviderPhone();" /></td>
        <td align="left"><span class="STYLE11" id="phoneHint">*</span></td></tr>
      <tr><td><p align="right"><span class="STYLE5">E-Mail：</span></p></td>
        <td align="right"><input name="email" type="text" id="email" onblur="validateProviderEmail();" /></td>
        <td align="left"><span id="emailHint"></span></td>
       </tr>
      <tr><td><p align="right"><span class="STYLE5">开户银行：</span></p></td>
        <td align="right"> <select id="bankId" style="width:150px;" name="bank.bankName" onblur="validateProviderBank();">
    	<option value="-1">--请选择--</option>
      </select></td><td align="left"><span class="STYLE11" id="bankHint">*</span></td>
      </tr>
 <tr>
 <td align="right"><input type="submit" name="submit" value="保存信息"/></td>
 <td align="left"><input name="reset" type="reset" id="reset" value="重置" /></td>
</tr>
</tbody>
</table>
</form>
</div>
 </body>
</html>

