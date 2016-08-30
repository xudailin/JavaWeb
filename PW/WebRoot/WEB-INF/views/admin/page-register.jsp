<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<head>
    	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>Personal Website - Administrator Register</title>		
		
		<!-- Import google fonts - Heading first/ text second -->
        <link rel='stylesheet' type='text/css' href='http://fonts.useso.com/css?family=Open+Sans:400,700|Droid+Sans:400,700' />
        <!--[if lt IE 9]>
<link href="http://fonts.useso.com/css?family=Open+Sans:400" rel="stylesheet" type="text/css" />
<link href="http://fonts.useso.com/css?family=Open+Sans:700" rel="stylesheet" type="text/css" />
<link href="http://fonts.useso.com/css?family=Droid+Sans:400" rel="stylesheet" type="text/css" />
<link href="http://fonts.useso.com/css?family=Droid+Sans:700" rel="stylesheet" type="text/css" />
<![endif]-->

		<!-- Favicon and touch icons -->
		<link rel="shortcut icon" href="${staticPath }/static/ico/favicon.ico" type="image/x-icon" />

	    <!-- Css files -->
	    <link rel="stylesheet" href="${staticPath }/static/css/bootstrap.min.css" type="text/css"></link>
	    <link rel="stylesheet" href="${staticPath }/static/css/jquery.mmenu.css" type="text/css"></link>
	    <link rel="stylesheet" href="${staticPath }/static/css/font-awesome.min.css" type="text/css"></link>
	    <link rel="stylesheet" href="${staticPath }/static/css/jquery-ui-1.10.4.min.css" type="text/css"></link>
	    <link rel="stylesheet" href="${staticPath }/static/css/style.min.css" type="text/css"></link>
	    <link rel="stylesheet" href="${staticPath }/static/css/add-ons.min.css" type="text/css"></link>
	    <script src="${staticPath }/static/script/common.js"></script>
	    
		<style>
			footer {
				display: none;
			}
			.login-box, .register-box {
				height: 350px;
			}
		</style>

	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>
</head>

<body>
	<div class="container-fluid content">
		<div class="row">
			<div id="content" class="col-sm-12 full">
				<div class="row">				
					<div class="login-box">
						<div class="header">
						Create new account
						</div>					
						<form id="registerForm" class="form-horizontal register" method="post">				<fieldset class="col-sm-12">
								<div class="form-group">							  	
									<div class="controls row">
										<div class="input-group col-sm-12">
											<input type="text" class="form-control" placeholder="Username" id="loginname" name="loginname"/>
										</div>	
									</div>
								</div>
								<div class="form-group">							  	
									<div class="controls row">
										<div class="input-group col-sm-12">
											<input type="password" class="form-control" placeholder="Password" id="password" name="password"/>
										</div>	
									</div>
								</div>
								<div class="form-group">							  	
									<div class="controls row">
										<div class="input-group col-sm-12">
											<input type="text" class="form-control" placeholder="Nick Name" id="nickname" name="nickname"/>
										</div>	
									</div>
								</div>
								<div class="form-group">							  	
									<div class="controls row">
										<div class="input-group col-sm-12">
											<input type="text" class="form-control" placeholder="Phone" id="phone" name="phone"/>
										</div>	
									</div>
								</div>
								<div class="row">
									<button type="submit" class="btn btn-primary btn-lg col-xs-12">Create Account!</button>							
								</div>							
							</fieldset>	
						</form>																	
					</div>
				</div><!--/row-->
		
			</div>	
			
		</div><!--/row-->			
		
	</div><!--/container-->
		
		
	<!-- start: JavaScript-->
	<!--[if !IE]>-->
	<script type="text/javascript" src="${staticPath }/static/js/jquery-2.1.1.min.js"></script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script src="${staticPath }/static/js/jquery-1.11.1.min.js"></script>
	
	<![endif]-->

	<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script type='text/javascript' src='${staticPath }/static/js/jquery-2.1.1.min.js'>"+"<"+"/script>");
		</script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script type="text/javascript">
	 	window.jQuery || document.write("<script src='${staticPath }/static/js/jquery-1.11.1.min.js'>"+"<"+"/script>");
		</script>
		
	<![endif]-->
	<script type="text/javascript" src="${staticPath }/static/js/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="${staticPath }/static/js/bootstrap.min.js"></script>
	
	
	<!-- page scripts -->
	
	<!-- theme scripts -->
	<script type="text/javascript" src="${staticPath }/static/js/SmoothScroll.js"></script>
	<script type="text/javascript" src="${staticPath }/static/js/jquery.mmenu.min.js"></script>
	<script type="text/javascript" src="${staticPath }/static/js/core.min.js"></script>
	
	<!-- inline scripts related to this page -->
	<script src="${staticPath }/static/js/index.js"></script>
	
	<!-- end: JavaScript-->
	
</body>
</html>

<script type="text/javascript">
	(function($){
		$(function(){
			$("#registerForm").submit(function(){
				$.post('${staticPath }/after/register.html',
				$("#registerForm").serialize(),
				function(data){
					if(data.success){
						window.location.href='${staticPath }/after/index.html';
					}else{
						alert(data.msg);
					}
				},'json');
				return false;
			});
		});	
	})(jQuery);
</script>