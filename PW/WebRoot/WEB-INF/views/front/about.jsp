<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/fbasejs.jsp" %>
<title>About</title>
<script src="${staticPath}/static/js/jquery.wmuSlider.js"></script> 
<style type="text/css">

	.word {
		margin-left: 15px; 
		text-indent: 24px;
		line-height:1.3em;
		color: #362f2f;
		font-size: 1em;
		text-align:justify;
	}
	.word p {
	    font-size: 1.1em;
	    font-weight: 400;
	    margin-bottom: 1.1em; 
	}
	#myphoto {
		margin-left: 65px;
	}
	.about-grid-info h4 {
		margin-left: 50px; 
	}

	.about-middle-grid p {
		margin-bottom: 0.5em; 
	}
	.about-middle-grid {
		word-wrap: break-word; 
		word-break: normal;
	}
	.about-middle-grid h5 {
		line-height: 1.3em; 
	}
	.about-middle-grid ul li {
		margin-bottom: 0.5em; 
	}
	.about-middle-grids {
		background: #F7F7F7;
    	padding: 3em 8em;
	}
	a {
		color: #FFFFFF;
	}
	a:hover, a:focus{
		text-decoration: inherit;
	}
</style>
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
						<li><a class="active" href="about.html">About Us</a></li>
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
	<div class="about-content">
			<!-- about-us -->
			<div id="about" class="about-us text-center">
				<!-- head-section -->
					<div class="head-section text-center">
						<h2>Just About Me</h2>
						<span> </span>
					</div>
					<!-- /head-section -->
					<p>人生就是一个得与失的过程，而我却是一个幸运者，得到的永远比失去的多。</p>
					<!-- about-grids -->
					<div class="about-grids">
						<div class="col-md-6 about-grid text-center">
							<div class="about-grid-info">
								<img src="${staticPath}/static/img/fimg/myphoto.jpg" title="name" id="myphoto" />
								<h4>${currentBlogAdmin.nickname}</h4>
								<label> </label>
							</div>		
						</div>
						<div class="col-md-6 about-grid text-center">
							<div class="word">
							<p style="text-indent: 0px;margin-bottom: 5px;margin-top: 5px; ">籍贯：${currentBlogAdmin.hometown}</p>
							<p style="text-indent: 0px;margin-bottom: 0px;margin-top: 5px; ">现居：${currentBlogAdmin.presentaddress}</p>
							<p style="text-indent: 0px;margin-bottom: 5px;margin-top: 5px; ">职业：${currentBlogAdmin.profession}</p>
								<p>
作为一个90后草根女站长，我认为：不管学习什么东西，一定要有属于自己的“学习方法”和善于“对事物的总结”。</p>
<p>俗话说的好：“方向不对，努力白费！”很多人都是盲目的去学习，导致花了大量的时间，在学习一些没有用处的东西，到头来什么都没学会，因此会打击自己的学习欲望，也会让自己处于迷茫当中...一个优秀的传道授业者“不单单传授的是知识，更多传授的是思维和方法”。---授人以鱼不如授人以渔。</p>
<p>其实，人的一生中都是在不断的学习，不管是技术也好，做人也罢！我觉得都应该以一颗“谦卑的心态来学习，秉持利他之心来帮助他人。”</p>
<p>人就得学会感恩，滴水之恩应当涌泉相报。感谢那些曾经帮助过我的人，因为有你们，才有今天的我。----By:徐带林</p>
							</div>		
						</div>
						<div class="clearfix"> </div>
					</div>
					<!-- about-grids -->				
			</div>
			<div class="about-middle-grids">
				<div class="col-md-6 about-middle-grid">
					<h3>About my blog</h3>
					<h5>域名：115.28.101.21/PersonalWebsite/front/index.html</h5>
					<p>创建于2016年07月15日</p>
					<p>服务器：阿里云服务器</p>
					<p>程序：JAVA Spring SpringMVC Mybatis Shiro</p>
				</div>
				<div class="col-md-6 about-middle-grid">
					<h3>Our Links</h3>
					<h5>You can see a lot of useful links from here:</h5>
					<ul>
						<c:forEach var="blogLink" items="${blogLinks}">
							<li><a href="${blogLink.url}">${blogLink.linkname}</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			</div>
				<div class="testimonials">
			<h4>Testimonials</h4>
		<div id="testimonials">
			 <div class="wmuSlider example1">
		 	<div class="container-flueid">
		 		<c:forEach var="motto" items="${mottos}">
					<article style="position: absolute;"> 
				   	<div class=" cont span_2_of_3  client-main">
							<div class="slide-text">
								<p><span>${motto.mottoContent}<span></p>
						  		<a href="#">by ${motto.createdate}</a>
								<div class="clearfix"></div>								
						 	</div> 
					</div>
				 </article>
				</c:forEach>
				<div class="clearfix"></div>
	         </div>
	     </div>
		 <div class="arrow">
			<div class="shows">
				<span class="a1"><img src="${staticPath}/static/img/fimg/tes.png" alt="" /></span>
			</div>
		 </div>

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
(function($){
	$(function(){
		$('.example1').wmuSlider(); 
		addEventListener("load", function() { 
			setTimeout(hideURLbar, 0); 
		}, false); 
		function hideURLbar(){ 
			window.scrollTo(0,1); 
		}
		$( "span.menu" ).click(function() {
			$( ".top-menu" ).slideToggle( "slow", function() {
				// Animation complete.
			});
		});
	});
})(jQuery);
</script>

</head>
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
			});
		});
	</script>
</html>