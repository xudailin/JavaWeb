<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/commons/fbasejs.jsp" %>
	<title>Contact</title>
	<style type="text/css">
	.modal-content{
		margin-left: 50%;
    width: 650px;
	}
</style>
</head>
<body>
	<!-- header-section-starts -->
	<div class="header" id="header">
		<div class="container">
			<div class="logo">
				<a href="index.html"><img src="${staticPath}/static/img/fimg/logo.png" alt="" /></a>
			</div>
			<div class="social-icons header-social-icons">
				<span style="color: #ffffff" id="login">
				<c:choose>
				<c:when test="${currentVisitor==null}"><a href="login.html">登录</a></c:when>
				<c:otherwise>欢迎您，${currentVisitor.nickname}</c:otherwise>
				</c:choose>
				</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="logout.html"><span style="color: #ffffff">退出</span></a>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="header-bottom">
		<div class="container">
			<h3 style="text-indent: 75px;"> <span>理想</span>还是要有的，万一实现了呢？*_*</h3>
		</div>
	</div>
	<div class="navigation-strip">
		<div class="container">
			<div class="nav_content">
			<div class="home">
					<a href="index.html"><img src="${staticPath}/static/img/fimg/home1.png" alt="" /></a>
				</div>
				<div class="search">
					<form>
						<input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search..';}"/>
						<input type="submit" value="">
					</form>
				</div>
				<span class="menu"></span>
				<div class="top-menu">
					<ul>						
						<li><a href="about.html">About Us</a></li>
						<li><a href="${staticPath}/front/fPortfolioPage.html">Portfolio</a></li>
						<li><a href="${staticPath}/front/fBlogPage.html">Blog</a></li>
						<li><a class="active" href="${staticPath}/front/contact.html">Contact</a></li>
						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="content">
	<div class="container">
	<!-- start contact -->
	<div class="contact-page">
				<!-- head-section -->
					<div class="head-section text-center">
						<h2>contact-us</h2>
						<span> </span>
					</div>
					<!-- /head-section -->	
				<div class="singel_right">
			     <div class="lcontact span_1_of_contact">
				      <div class="contact-form">
				  	        <form method="post" id="sendForm">
				  	        	<input type="hidden" id="visitorId" value="${currentVisitor.id}">
					    	    <p class="comment-form-author"><label for="author">Your Name</label>
					    	    	<input type="text" class="textbox" value="${currentVisitor.nickname}" disabled="disabled">
						    	</p>
						        <p class="comment-form-author"><label for="author">Email</label>
						     	   <input type="text" class="textbox" value="${currentVisitor.email}" disabled="disabled">
						        </p>
						        <p class="comment-form-author"><label for="author">Message</label>
						    	  <textarea value="Enter your message here..." id="emailContent" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter your message here...';}">Enter your message here...</textarea>
						        </p>
						        <input name="submit" type="submit" id="submit" value="Submit">
					        </form>
				       </div>
			     </div>
			     <div class="contact_grid span_2_of_contact_right">
					<h3>Address</h3>
				    <div class="address">
						<i class="pin_icon"></i>
					    <div class="contact_address">
						  Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non
					    </div>
					    <div class="clearfix"></div>
					</div>
					<div class="address">
						<i class="phone"></i>
					    <div class="contact_address">
						   ph-no: 1-25-2568-897
					    </div>
					    <div class="clearfix"></div>
					</div>
					<div class="address">
						<i class="mail"></i>
					    <div class="contact_email">
						  <a href="mailto:example@gmail.com">info(at)company.com</a>
					    </div>
					    <div class="clearfix"></div>
					</div>
		        </div>
		        <div class="clearfix"></div>
		    </div>
			</div>
			<div class="clearfix"></div>
		</div>
		</div>
	<div class="footer">
		<div class="footer-top">
			<div class="container">
				<div class="col-md-4 footer-grid">
					<h5>ABOUT US</h5>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla in purus nibh. Donec ornare felis neque. Nullam tortor nulla, sodales quis posuere quis, tristique nec libero. Proin vitae convallis odio. Morbi nec enim nisi. Aliquam erat volutpat. </p>
				</div>
				<div class="col-md-4 footer-grid">
					<h5>TWITTER FEED</h5>
					<p>Check out th best Themes online in the world <br>at <a href="mail-to:example.com">http://example.com </a></p>
					<span>1 day ago</span>
					<p><a href="#">@envanto</a>, Motive wordpress theme full responsive is coming soon...</p>
					<span>4 day ago</span>
				</div>
				<div class="col-md-4 footer-grid">
					<h5>FOLLOW US</h5>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla in purus nibh. Donec ornare felis neque. Nullam tortor! </p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container">
				<div class="go-top">
					<a href="#header" class="scroll"><img src="${staticPath}/static/img/fimg/go-to-top.png" alt="" id="goTop"/></a>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</body>

<script type="application/x-javascript"> 
	addEventListener("load", function() { 
		setTimeout(hideURLbar, 0); 
	}, false); 
	function hideURLbar(){ 
		window.scrollTo(0,1); 
	} 
</script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
		});
	});
	(function($){
		$(function(){
			$( "span.menu" ).click(function() {
				 $( ".top-menu" ).slideToggle( "slow", function() {
				    // Animation complete.
				  });
			});

			$("#sendForm").submit(function(){
				var emailContent = $("#emailContent").val();
				$.post('${staticPath}/front/sendEmail.html',
					{emailContent:emailContent},
					function(data){
						$.alert("提示",data.msg,
								function(){
									window.location.href='${staticPath}/front/contact.html';
								});
					},'json');
				return false;
			});
		});
	})(jQuery);	
</script>

</html>