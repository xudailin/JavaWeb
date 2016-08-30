<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/commons/fbasejs.jsp" %>
	<title>Blog</title>
	<link href="${staticPath }/static/css/style.min.css" rel="stylesheet">
	<link href="${staticPath }/static/css/bootstrap-combined.min.css" rel="stylesheet">
	<script type="text/javascript" src="${staticPath }/static/js/bootstrap-paginator.js"></script>
	<style type="text/css">
		.pagination ul li a {
			color: #20a8d8;
		}

		a:hover, a:focus{
			text-decoration: inherit;
		}
		a {
		color: #FFFFFF;
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
					</c:choose></span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="color: #ffffff">退出</span>
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
						<li><a href="fPortfolioPage.html">Portfolio</a></li>
						<li><a class="active" href="fBlogPage.html">Blog</a></li>
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
			<div class="blog-posts-section">		
				<!-- head-section -->
				<div class="head-section text-center">
					<h2>blog posts</h2>
					<span> </span>
				</div>
				<!-- /head-section -->	
				<div class="blog-post-grids blog_grids" id="blogBody"></div>
				<div class="text-center pagination" id="paging"></div>
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
	function hideURLbar(){ window.scrollTo(0,1); } 
</script>

<script type="text/javascript">

	(function($){
		$(function(){
			showDate(1);
			/* script for menu */
			$( "span.menu" ).click(function() {
				  $( ".top-menu" ).slideToggle( "slow", function() {
				    // Animation complete.
				  });
			});

			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});

		});
	})(jQuery);

	function showDate(pNow){
		$.post('${staticPath}/front/getfPageBlog.html',
			{pagesize:9},function(data){
			var list = data.rows;
			var total=data.total;
			var di ='';
			$.each(list,function(i,blog){
				if(i<list.length){
					if (i%3==0) {
						di += "<div class='col-md-4 blog-post'><div class='blog-post'><a href='${staticPath}/front/blogSinglePage.html?id="+blog.id+"' class='blog-title'>"+blog.title+"</a><p class='sub_head'>Posted by <a href='#'>"+blog.user.nickname+"</a> on "+blog.publishtime+"</p><span></span><p>"+blog.content+"</p></div>";
					}else if(i%3==1){
						di += "<div class='blog-post'><a href='${staticPath}/front/blogSinglePage.html?id="+blog.id+"' class='blog-title'>"+blog.title+"</a><p class='sub_head'>Posted by <a href='#'>"+blog.user.nickname+"</a> on "+blog.publishtime+"</p><span></span><p>"+blog.content+"</p></div>";
					}else{
						di += "<div class='blog-post' ><a href='${staticPath}/front/blogSinglePage.html?id="+blog.id+"' class='blog-title'>"+blog.title+"</a><p class='sub_head'>Posted by <a href='#'>"+blog.user.nickname+"</a> on "+blog.publishtime+"</p><span></span><p>"+blog.content+"</p></div></div>";
					}
				}
				if (i==list.length-1){
					$("#blogBody").empty();
					di += "<div class='clearfix'></div>";
					$("#blogBody").append(di);
				}
			});
			var totalPages  = Math.ceil(total/9);
			var currentPage = data.nowpage;
			var options = {
				currentPage: currentPage,
				totalPages: totalPages,
				size:"normal",
				alignment: "center",
				itemTexts: function(type, page, current){
					switch(type){
						case "first":
							return "First";
						case "prev":
							return "Prev";
						case "next":
							return "Next";
						case "last":
							return "Last";
						case "page":
							return page;
					}
				},
				onPageClicked: function(event, originalEvent, type, page){
					$.post('${staticPath}/front/getfPageBlog.html',{nowpage:page,pagesize:9},function(data){
							var list = data.rows;
							var di = '';
							$("#blogBody").empty();
							$.each(list,function(i,blog){
								if(i<list.length){
									if (i%3==0) {
										di += "<div class='col-md-4 blog-post'><div class='blog-post'><a href='${staticPath}/front/blogSinglePage.html?id="+blog.id+"' class='blog-title'>"+blog.title+"</a><p class='sub_head'>Posted by <a href='#'>"+blog.user.nickname+"</a> on "+blog.publishtime+"</p><span></span><p>"+blog.content+"</p></div>";
									}else if(i%3==1){
										di += "<div class='blog-post'><a href='${staticPath}/front/blogSinglePage.html?id="+blog.id+"' class='blog-title'>"+blog.title+"</a><p class='sub_head'>Posted by <a href='#'>"+blog.user.nickname+"</a> on "+blog.publishtime+"</p><span></span><p>"+blog.content+"</p></div>";
									}else{
										di += "<div class='blog-post' ><a href='${staticPath}/front/blogSinglePage.html?id="+blog.id+"' class='blog-title'>"+blog.title+"</a><p class='sub_head'>Posted by <a href='#'>"+blog.user.nickname+"</a> on "+blog.publishtime+"</p><span></span><p>"+blog.content+"</p></div></div>";
									}
								}
								if (i==list.length-1){
									di += "<div class='clearfix'></div>"
									$("#blogBody").append(di);
								}
							});
					},'json')
				}
			};
			$('#paging').bootstrapPaginator(options);
		},'json');
	}

</script>
</html>