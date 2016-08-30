<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/commons/fbasejs.jsp" %>
	<title>Home</title>
	<style type="text/css">
		a {
			color: #FFFFFF;
		}
		a:hover, a:focus{
			text-decoration: inherit;
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
					<a href="index.html"><img src="${staticPath}/static/img/fimg/home.png" alt="" /></a>
				</div>
				<div class="search">
					<form>
						<input type="text" value="" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search..';}"/>
						<input type="submit" value="">
					</form>
				</div>
			<span class="menu"></span>
				<div class="top-menu">
					<ul>						
						<li><a href="about.html">About Us</a></li>
						<li><a href="fPortfolioPage.html">Portfolio</a></li>
						<li><a href="fBlogPage.html">Blog</a></li>
						<li><a href="contact.html">Contact</a></li>
						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="container">
			<div class="projects-section">
				<h4 class="head">LATEST PROJECTS<span class="line"></span></h4>				
				<div class="latest-projects">
					<div class="col-md-3 project">		
						<a href="${staticPath}/static/img/fimg/p1.jpg"><img src="${staticPath}/static/img/fimg/p1.jpg" alt=""/></a>
					</div>
					<div class="col-md-3 project">
						<a href="${staticPath}/static/img/fimg/p2.jpg"><img src="${staticPath}/static/img/fimg/p2.jpg" alt="" /></a>
					</div>
					<div class="col-md-3 project">
						<a href="${staticPath}/static/img/fimg/p3.jpg"><img src="${staticPath}/static/img/fimg/p3.jpg" alt="" /></a>
					</div>
					<div class="col-md-3 project">
						<a href="${staticPath}/static/img/fimg/p4.jpg"><img src="${staticPath}/static/img/fimg/p4.jpg" alt="" /></a>
					</div>
					<div class="col-md-3 project">
						<a href="${staticPath}/static/img/fimg/p5.jpg"><img src="${staticPath}/static/img/fimg/p5.jpg" alt="" /></a>
					</div>
					<div class="col-md-3 project">
						<a href="${staticPath}/static/img/fimg/p6.jpg"><img src="${staticPath}/static/img/fimg/p6.jpg" alt="" /></a>
					</div>
					<div class="col-md-3 project">
						<a href="${staticPath}/static/img/fimg/p7.jpg"><img src="${staticPath}/static/img/fimg/p7.jpg" alt="" /></a>
					</div>
					<div class="col-md-3 project">
						<a href="${staticPath}/static/img/fimg/p8.jpg"><img src="${staticPath}/static/img/fimg/p8.jpg" alt="" /></a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="blog-section">
			<h4 class="head">BLOG POSTS<span class="line"></span></h4>		
			<div class="blog-post-grids">
					<div class="col-md-4 blog-posts">
						<div class="blog-post">
							<a href="${staticPath}/front/blogSinglePage.html?id=${blogs[0].id}"><img src="${staticPath}/static/img/fimg/b1.jpg"></a>
							<a href="${staticPath}/front/blogSinglePage.html?id=${blogs[0].id}" class="blog-title">${blogs[0].title}</a>
							<p class="sub_head">Posted by <a href="#">${blogs[0].user.nickname}</a> on <fmt:formatDate  value="${blogs[0].publishtime}" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></p>
							<span></span>
							<p>${blogs[0].content}</p>
						</div>	
						<div class="blog-post">
							<a href="${staticPath}/front/blogSinglePage.html?id=${blogs[1].id}"><img src="${staticPath}/static/img/fimg/b2.jpg"></a>
							<a href="${staticPath}/front/blogSinglePage.html?id=${blogs[1].id}" class="blog-title">${blogs[1].title}</a>
							<p class="sub_head">Posted by <a href="#">${blogs[1].user.nickname}</a> on <fmt:formatDate  value="${blogs[1].publishtime}" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></p>
							<span></span>
							<p>${blogs[1].content}</p>
						</div>
					</div>
					<div class="col-md-4 blog-posts">
						<div class="blog-post">
							<a href="${staticPath}/front/blogSinglePage.html?id=${blogs[2].id}"><img src="${staticPath}/static/img/fimg/b3.jpg"></a>
							<a href="${staticPath}/front/blogSinglePage.html?id=${blogs[2].id}" class="blog-title">${blogs[2].title}</a>
							<p class="sub_head">Posted by <a href="#">${blogs[2].user.nickname}</a> on <fmt:formatDate  value="${blogs[2].publishtime}" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></p>
							<span></span>
							<p>${blogs[2].content}</p>
						</div>
						<div class="blog-post">
							<a href="${staticPath}/front/blogSinglePage.html?id=${blogs[3].id}"><img src="${staticPath}/static/img/fimg/b1.jpg"></a>
							<a href="${staticPath}/front/blogSinglePage.html?id=${blogs[3].id}" class="blog-title">${blogs[3].title}</a>
							<p class="sub_head">Posted by <a href="#">${blogs[3].user.nickname}</a> on <fmt:formatDate  value="${blogs[3].publishtime}" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></p>
							<span></span>
							<p>${blogs[3].content}</p>
						</div>
					</div>
					<div class="col-md-4 blog-posts span_66">
						<div class="blog-post">
							<a href="${staticPath}/front/blogSinglePage.html?id=${blogs[4].id}"><img src="${staticPath}/static/img/fimg/b2.jpg"></a>
							<a href="${staticPath}/front/blogSinglePage.html?id=${blogs[4].id}" class="blog-title">${blogs[4].title}</a>
							<p class="sub_head">Posted by <a href="#">${blogs[4].user.nickname}</a> on <fmt:formatDate  value="${blogs[4].publishtime}" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></p>
							<span></span>
							<p>${blogs[4].content}</p>
						</div>	
						<div class="blog-post">
							<a href="${staticPath}/front/blogSinglePage.html?id=${blogs[5].id}"><img src="${staticPath}/static/img/fimg/b3.jpg"></a>
							<a href="${staticPath}/front/blogSinglePage.html?id=${blogs[5].id}" class="blog-title">${blogs[5].title}</a>
							<p class="sub_head">Posted by <a href="#">${blogs[5].user.nickname}</a> on <fmt:formatDate  value="${blogs[5].publishtime}" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></p>
							<span></span>
							<p>${blogs[5].content}</p>
						</div>	
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!--/start-text-slider-->
<div class="testimonials">
			<h4>Testimonials</h4>
		<div id="testimonials">
			 <div class="wmuSlider example1" style="overflow: hidden;">
		 	<div class="container-flueid">
		 		<c:forEach var="motto" items="${mottos}">
					<article style="position: absolute;"> 
				   	<div class=" cont span_2_of_3  client-main">
							<div class="slide-text">
								<p>${motto.mottoContent}</p>
						  		<a href="#">by ${motto.createdate}</a>
								<div class="clearfix"></div>								
						 	</div> 
					</div>
				 </article>
				</c:forEach>
				<div class="clearfix"></div>
	      </div>
	      <a class="wmuSliderPrev">Previous</a>
	      <a class="wmuSliderNext">Next</a>
	     </div>
		 <div class="arrow">
			<div class="shows">
				<span class="a1"><img src="${staticPath}/static/img/fimg/tes.png" alt=""></span>
			</div>
		 </div>
			</div>
		</div>
			<!--//text-slider-->
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
					<p>Check out th best Themes online in the world <br>at <a href="mail-to:example@gmail.com">http://example.com </a></p>
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

				$('.example1').wmuSlider();   

				$( "span.menu" ).click(function() {
				  $( ".top-menu" ).slideToggle( "slow", function() {
				    // Animation complete.
				  });
				});
			});
		})(jQuery);	
	</script>
</body>
</html>

