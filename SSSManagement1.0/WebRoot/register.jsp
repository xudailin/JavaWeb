<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
<link href="css/register.css" rel="stylesheet" type="text/css" />
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script src="js/validate.js" type="text/javascript"></script>
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/default.js"></script>
</head>

<body  background="images/1.jpg" onload="initProvince();" >
 <div>
 <form id="myForm" name="myForm" method="post" action="" >
 <table align="center" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
 <thead><span id="bar"><p align="left" class="STYLE6">>>请输入注册信息：（注：带<strong><span class="STYLE11">*</span></strong>号的为必填）</p></span></thead>
 <tbody  class="STYLE5" >
 <tr>
 <td colspan="3" >
<a href="login.jsp" style="text-decoration:none;"><span class="STYLE13" style="margin-left: 160px;" >返回登陆</span></a></td></tr>
   <tr>
   <td align="right"><p align="right">用户名：</p></td>
    <td align="left"> <input name="adminName" type="text" id="adminName" onblur="validateAdminName();" /></td>
    <td><span id="adminNameHint"></span><span class="STYLE11">*</span></td>
	 </tr>
	 <tr>
      <td><p align="right">真实姓名：</p></td>
     <td align="left"><input name="trueName" type="text" id="trueName" onblur="validateTrueName();"/></td>
     <td><span id="TrueHint"></span><span class="STYLE11">*</span></td>
	 </tr>
	 <tr>
    <td><p align="right">密码：</p></td>
    <td align="left"> <input name="password" type="password" id="password" onblur="validatePassword();" /></td>
    <td><span id="passwordHint"></span><span class="STYLE11">*</span></td>
	 </tr>
	 <tr>
     <td><p align="right">确认密码：</p></td>
     <td align="left"><input name="password1" type="password" id="password1"  onblur="validatePassword1();"/></td>
     <td><span id="password1Hint"></span><span class="STYLE11">*</span></td>
	 </tr>
	 <tr>
	 <td><p align="right">性别：</p></td>
     <td align="left"><input type="radio" name="gender"  value="男"  onblur="validateGender();" id="gender"/>
     <span class="STYLE4">     男     </span>
     <input type="radio" name="gender"  value="女"  onblur="validateGender();" id="gender"/>
     <span class="STYLE4">女    </span>　</td>
     <td><span id="genderHint"></span><span class="STYLE11">*</span></td>
	 </tr>
	 <tr>
     <td><p align="right">联系电话：</p></td>
     <td align="left"><input name="mobile" type="text" id="mobile" onblur="validateMobile();" /></td>
	 <td><span id="MobileHint"></span>   <span class="STYLE11">*</span></td>
	 </tr>
	 <tr>
     <td><p align="right">QQ：</p></td>
     <td align="left"><input name="QQ" type="text" id="QQ" onblur="validateQQ();" /></td>
     <td><span id="qqHint"></span><span class="STYLE11">*</span></td>
	 </tr>
	 <tr>
    <td><p align="right">邮箱：</p></td>
     <td align="left"><input name="email" type="text" id="email" onblur="validateEmail();"/></td>
   <td><span id="EmailHint"></span><span class="STYLE11">*</span></td>
   </tr>
   <tr>
   <td><p align="right">出生日期：</p></td>
     <td align="left"><input name="birth" type="text" id="birth" onblur="validateBirth();" /></td>
	 <td><span id="BirthHint"></span>
     <span class="STYLE11">*</span></td>
	 </tr>
	 <tr>
     <td><p align="right">兴趣爱好：</p></td>
     <td align="left" colspan="2"><input name="fav" type="checkbox" id="fav" value="游泳"/>
     <span class="STYLE4"> 游泳</span>
     <input name="fav" type="checkbox" id="fav" value="跳舞"/>
   <span class="STYLE4"> 跳舞</span>
   <input name="fav" type="checkbox" id="fav" value="下棋"/>
   <span class="STYLE4"> 下棋</span></td>
   </tr>
   <tr>
   <td><p align="right">省份：</p></td>
    <td align="left" colspan="2"> 
       <select id="placeId" style="width:150px;" name="province" onblur="validateProviderPlace();">
    	<option value="-1">--请选择--</option>
      </select>
     <span class="STYLE11">*</span></td>
	 </tr>
	 <tr><td><p align="right">简介：</p></td>
     <td align="left"><textarea name="textarea"></textarea></td>
   </tr>
   <tr>
   <td align="right"></td>　
     <td align="left">
	 <input name="register" type="button"  id="submit1" value="立即注册" onclick="formSubmit('admin!regist.action');"/>
	 <input name="reset" type="reset" id="submit2" value="重置"  onclick="Reset();"/></td>
	 </tr>
	 </tbody>
   </table>
 </form>
</div>
</body>
</html>
