<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/fbasejs.jsp" %>
<title>Portfolio</title>
<link rel="stylesheet" href="${staticPath}/static/css/swipebox.css">
<script src="${staticPath}/static/js/jquery.min.js"></script>
<script src="${staticPath}/static/js/jquery.mixitup.min.js"></script>
<script src="${staticPath}/static/js/jquery.swipebox.min.js"></script>
<script src="${staticPath}/static/js/jquery.wmuSlider.js"></script>
<style type="text/css">
		a {
			color: #FFFFFF;
		}
		a:hover, a:focus{
			text-decoration: inherit;
		}
		.option-item{
			display: inline-block;
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
				<span style="color: #ffffff">
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
						<li><a class="active" href="fPortfolioPage.html">Portfolio</a></li>
						<li><a href="fBlogPage.html">Blog</a></li>
						<li><a href="contact.html">Contact</a></li>				
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="container">
	<div class="portfolio-content">
			<!-- portfolio -->
			<div class="portfolio-section" id="portfolio">			
				<!-- head-section -->
					<div class="head-section text-center">
						<h2>PICTURE VIEWER</h2>
						<span> </span>
					</div>
					<!-- /head-section -->
				    <ul id="filters" class="clearfix">
						<li class="option-item"><span class="filter active" data-filter="app card icon logos web" onclick="choose(this);">ALL</span></li>
						<li class="option-item"><span class="filter" data-filter="app"  onclick="choose(this);">app</span></li>
						<li class="option-item"><span class="filter" data-filter="card"  onclick="choose(this);">card</span></li>
						<li class="option-item"><span class="filter" data-filter="icon"  onclick="choose(this);">icon</span></li>
						<li class="option-item"><span class="filter" data-filter="logos"  onclick="choose(this);">logos</span></li>
					</ul>
					<div id="portfoliolist">
						<c:forEach var="picture" items="${list}">
							<div class="portfolio card mix_all  wow bounceIn" data-wow-delay="0.4s" data-cat="${picture.pictrueType.typename}" style="display: inline-block; opacity: 1;">
								<div class="portfolio-wrapper grid_box">		
							 		<a href="${staticPath}/${picture.imgUrl}" class="swipebox"  title="Image Title"> <img src="${staticPath}/${picture.imgUrl}" class="img-responsive" alt=""><span class="zoom-icon"> </span> </a> 
		            			</div>
							</div>	
						</c:forEach>														
					<div class="clearfix"></div>					
				</div>			
				<div class="clearfix"></div>	
			</div>

			</div>
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
					<a href="#header" class="scroll"><img src="${staticPath}/static/img/fimg/go-to-top.png" alt="" /></a>
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
	jQuery(function($) {
		$(".swipebox").swipebox();
	});

	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
		});
	});

	$(function () {
		var filterList = {
		init: function () {
			// MixItUp plugin
			// http://mixitup.io
			$('#portfoliolist').mixitup({
				targetSelector: '.portfolio',
				filterSelector: '.filter',
				effects: ['fade'],
				easing: 'snap',
				// call the hover effect
				onMixEnd: filterList.hoverEffect()
			});				
		},
		hoverEffect: function () {
			// Simple parallax effect
			$('#portfoliolist .portfolio').hover(
				function () {
					$(this).find('.label').stop().animate({bottom: 0}, 200, 'easeOutQuad');
					$(this).find('img').stop().animate({top: -30}, 500, 'easeOutQuad');	
				},
				function () {
					$(this).find('.label').stop().animate({bottom: -40}, 200, 'easeInQuad');
					$(this).find('img').stop().animate({top: 0}, 300, 'easeOutQuad');
				}		
			);				
		}
		};
		// Run the show!
		filterList.init();
	});

	$( "span.menu" ).click(function() {
		$( ".top-menu" ).slideToggle( "slow", function() {
			// Animation complete.
		});
	});

	function choose(elem){
		var str = elem.innerHTML;
		 $.post('${staticPath}/front/fPortfolio.html',function(data){
			$("#portfoliolist").empty();
			$.each(data,function(i,picture){
				var di ='';
				if (str=="ALL") {
					window.location.href='${staticPath }/front/fPortfolioPage.html';
				};
				if (picture.pictrueType.typename==str) {
					console.log(picture.pictrueType.typename)
					di += "<div class='portfolio card mix_all  wow bounceIn' data-wow-delay='0.4s' data-cat='"+picture.pictrueType.typename+"' style='display: inline-block; opacity: 1;'><div class='portfolio-wrapper grid_box'>	<a href='${staticPath}/"+picture.imgUrl+"' class='swipebox' title='Image Title'><img  src='${staticPath}/"+picture.imgUrl+"' class='img-responsive' alt=''><span class='zoom-icon'></span></a></div></div>";
				}
				$("#portfoliolist").append(di);
			});
		 },'json');
	}
</script>
</html>