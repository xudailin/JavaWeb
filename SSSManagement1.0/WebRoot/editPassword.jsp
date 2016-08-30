<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>密码修改</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script src="js/default.js" type="text/javascript"></script>
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
</head>

<body>
<div>
<form method="post" action="admin!editPassword.action">
  <table style="table-layout:fixed;margin-left: 350px ">
  <thead><span id="bar"><p class="STYLE6">>>密码修改(注：带<strong><span class="STYLE11">*</span></strong>号的为必填)</p></span></thead>
  <tbody>
	<tr>
	<td><p align="right"><span class="STYLE5">　用户名：</span></p></td>
    <td><input name="adminName" type="text" id="adminName"  value="${sessionScope.currentAdmin.getAdminName()}" readonly="readonly" onfocus="this.blur()"/></td>
	</tr>
	<tr>
	<td><p align="right"><span class="STYLE5">原密码：</span></p></td>
      <td><input name="oldPass" type="password" id="oldPass" onblur="checkOldPwd();" />
      <span id="oldPassHint" class="STYLE11"><strong>*</strong></span></td>
	  </tr>
	  <tr>
	  <td><p align="right"><span class="STYLE5">新密码：</span></p></td>
      <td><input name="newPass" type="password" id="newPass" onblur="checkNewPwd();" />
      <span id="newPassHint" class="STYLE11"><strong>*</strong></span></td>
	  </tr>
	  <tr>
	  <td><p align="right"><span class="STYLE5">确认新密码：</span></p></td>
      <td><input name="confirmPass" type="password" id="confirmPass" onblur="checkPwd();" />
	  <span id="confirmPassHint" class="STYLE11"><strong>*</strong></span></td>
	  </tr>
	  <tr>
	  <td align="right"><input type="submit" name="Submit" value="确认修改" /></td>
	  <td align="left"><input name="reset" type="reset" id="reset" value="重置" /></td>
	  </tr>
	  </tbody>
   </table>
</form>
</div>
 </body>
</html>
