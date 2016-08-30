<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>错误提示</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	font: 14px/1.6 Arial, Sans-serif;
	background: #fff;
}

a:link,a:visited {
	color: #007ab7;
	text-decoration: none;
}

h1 {
	position: relative;
	z-index: 2;
	width: 540px;
	height: 0;
	margin: 110px auto 15px;
	padding: 230px 0 0;
	overflow: hidden;
	xxxxborder: 1px solid;
	background-image: url("images/Main.jpg");
	background-repeat: no-repeat;
}

.link {
	text-align: center;
}
</style>

</head>


<body>
	<h1></h1>
	<p class="link">
		出现错误，请刷新重试<br /> <span id="leaveTime" style="color:#FF0000">5</span>秒后自动返回!&nbsp;<a
			href="login.jsp">不能自动返回</a>
	</p>
</body>
</html>

<script>
	var leaveTime = 5;
	window.setInterval(updateTime, 1000);
	function updateTime() {
		leaveTime--;
		document.getElementById("leaveTime").innerHTML = leaveTime;
		if (leaveTime == 0) {
			window.location = "login.jsp";
		}
	}
</script>
