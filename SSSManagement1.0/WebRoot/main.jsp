<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主界面</title>
<script language="javascript" src="js/jquery-1.9.1.min.js"></script>
<link href="css/MainGuide.css" rel="stylesheet" type="text/css" />
</head>
<frameset rows="17%,75%,*" frameborder="no"> 
    <frame src="mainTop.jsp" scrolling="no" id="Header" /> 
	<frameset cols="14%,*"  frameborder="no"> 
	<frame src="mainMenu.jsp"  scrolling="no" id="PageBody" /> 
	<frame src="welcome.jsp"  id="Mainbody" name="main"  scrolling="auto" /> 
	</frameset> 
	<frame src="mainFoot.jsp" /> 
	</frameset><noframes></noframes>
</html>
