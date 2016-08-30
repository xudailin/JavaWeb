<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wtu.sss.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="css/MainGuide.css" type="text/css"></link>
</head>
<body>
    <div align="left">
      <p align="center">
      <div style="margin-left:155px">
      <img src="images/main_06.gif" width="43" height="50" />
      <img src="images/main_07.gif" width="87" height="50" />
	  <img src="images/main_08.gif" width="144" height="50" />
	  </div>
      <span class="STYLE3">货物进销存管理系统</span>
      <span class="STYLE27">当前用户:</span>
      <span class="STYLE17">${sessionScope.currentAdmin.getAdminName()}</span>　
       <a href="javascript:parent.window.location.href= 'login.jsp';" class="STYLE17">退出</a>
       </p>
    </div>
  <div id="Mid">
  </div>

</body>
</html>
