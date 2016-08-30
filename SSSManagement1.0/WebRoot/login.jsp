<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>
<link href="css/Login.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	var code;
	$(document).ready(function() {
		createCode();
	});
</script>
</head>

<body style="margin-left: 250px;">
	<div id="Up"></div>
	<div id="Center">
	<div id="Center_left" class="STYLE8">
		<div id="Center_left_1"></div>
			<div class="STYLE3" id="Center_left_2">
				<form id="Login" name="Login" method="post"
					action="admin!checkAdmin.action" onsubmit="return checkForm();"
					style="table-layout: fixed">
					<table cellpadding="0" cellspacing="5" border="0">
						<tr>
							<td><span class="STYLE8">用户:</span>
							</td>
							<td colspan="2"><input name="adminName" type="text"
								id="adminName" size="17" />
							</td>
						</tr>
						<tr>
							<td><span class="STYLE8">密码:</span>
							</td>
							<td colspan="2"><input name="password" type="password"
								id="password" size="17" />
							</td>
						</tr>
						<tr>
							<td><span class="STYLE8">验证码:</span>
							</td>
							<td><input id="userimg" name="" type="text" size="7" />
							</td>
							<td><input type="text" onclick="createCode()"
								readonly="readonly" id="checkCode" style="width: 65px" />
							</td>
						</tr>
						<tr>
							<td><input name="login" type="submit" id="login" value="登录" />
							</td>
							<td><input type="reset" name="clear" value="重置" />
							</td>
							<td><input type="button" name="register" value="注册"
								onclick="goRegister('register.jsp')" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div id="Center_right"></div>
	</div>
	<div id="Down">
		<p style="padding-top: 37px;">
			<span class="STYLE2">Inventory management system</span>
		</p>
	</div>
</body>
</html>
