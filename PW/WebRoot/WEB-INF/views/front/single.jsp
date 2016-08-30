<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/fbasejs.jsp" %>
<title>Single</title>
<style type="text/css">
	.men img {
		width:100%;
		height:100%;
	}
	.men {
		padding: 0 0;
	}
	.modal-content{
		margin-left: 50%;
    width: 650px;
	}
	a {
		color: #FFFFFF;
	}
	a:hover, a:focus{
		text-decoration: inherit;
	}
		.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden}
	.clearfix{*+height:1%;}
	.left {
		float: left;
	}
	.blog-owner-pic {
		padding-right: 20px;
	}
	.blog-owner-img {
		width: 50px;
	}
	.blog-owner-name, .blog-publish-time {
		font-size: 14px;
		line-height: 20px;
		padding: 5px 0;
		color: #333;
	}
	.blog-content {
		clear: left;
		font-size: 14px;
		color: #000000;
		line-height: 24px;
		padding: 10px 0;
	}
	.comment-pic {
		padding-right: 10px;
	}
	.comment-img {
		width: 40px;
	}
	.comment-item-name {
		font-size: 12px;
		color: blue;
	}
	.comment-item-time {
		font-size: 10px;
		color: #B3B0B3;
	}
	.comment-item-content {
		width: 480px;
		font-size: 12px;
		padding: 5px 0;
	}
	.comment-info{
		margin: 0;
	}
	.commenter-info{
		padding: 5px 0;
		line-height: 20px;
	}
	.reply-content{
		margin-left: 50px;
		width: 450px;
	}
	.modal-body {
		padding: 10px 15px;
		overflow-y: scroll;
		overflow-x: hidden;
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
			<h3> <span>志向</span>不过是记忆的奴隶，生气勃勃地降生，但却很难成长。</h3>
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
			<div class="single">				
					<div class="head-section text-center">
						<h2>blog post</h2>
						<span> </span>
					</div>
				<div class="top-single">
				<h2>${blog.title}</h2>
				<input type="hidden" name="id" value="${blog.id}" id="id">
					<div class="grid-single">
						<div class="single-one"><fmt:formatDate  value="${blog.publishtime}" type="both" pattern="yyyy.MM.dd HH:mm:ss" /> </div>
						<div class="single-one"><span><a href="javascript:onComNumClick();"><i class="com"> </i>${blog.comNum}</a></span></div>
						<div class="single-one"><span><a href="javascript:onCollectNumClick();"><i class="four"> </i>${blog.collectNum}</a></span></div>
						<div class="clearfix"> </div>
					</div>
					<p class="eget"  style="text-indent:24px;"><b>${blog.content}</b></p> 
			<div class="top-comments">
			<h3>10 Comments</h3>
			<c:forEach items="${topList}" var="comment">
				<c:choose>
	       <c:when test="${comment.super_id == 0}">
						<div class="met">
							<div class="code-in">
								<p class="smith"><a href="#">${comment.commenter.nickname}</a> <span><fmt:formatDate  value="${comment.cmttime}" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></span></p>
								<p class="reply"><a data-dialog='' title='回复' href="replyCommentPage.html?id=${comment.id}" id="reply"><i></i>REPLY</a></p>
								<div class="clearfix"> </div>
							</div>
							<div class="comments-top-top">
								<div class="men">
									<img src="${staticPath }/${comment.commenter.headimgurl}" alt="">
								</div>					
								<p class="men-it">${comment.comcontent}</p>
								<div class="clearfix"> </div>
							</div>
							<div class="replycontainer" style="display: none" >
								<textarea name="comcontent" id="myReply" rows="3" class="reply-content" placeholder="回复${comment.commenter.nickname}:"></textarea>
								<div class="clearfix"> </div>
							</div>
						</div>    
	       </c:when>
	       <c:otherwise>
					<div class="met met-in">
						<div class="code-in">
							<p class="smith"><a href="#">${comment.commenter.nickname}</a> <span><fmt:formatDate  value="${comment.cmttime}" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></span></p>
							<p class="reply"><a data-dialog='' title='回复' href="replyCommentPage.html?id=${comment.id}" id="reply"><i></i>REPLY</a></p>
							<div class="clearfix"> </div>
						</div>
						<div class="comments-top-top top-in">
							<div class="men" >
								<img  src="${staticPath}/${comment.commenter.headimgurl}" alt="">
							</div>					
							<p class="men-it">${comment.comcontent}</p>
							<div class="clearfix"> </div>
						</div>
						<div class="replycontainer" style="display: none">
								<textarea name="comcontent" id="myReply" rows="3" class="reply-content" placeholder="回复${comment.commenter.nickname}:"></textarea>
								<div class="clearfix"> </div>
						</div>
					</div>
	       </c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div class="leave" id="leave">
			<h3>Leave a comment</h3>
				<form id="commentSubmit" method="post">
					<div class="single-grid">
						<div class="col-md-6 single-us">
							<input type="text" name="nickname" id="nickname" value="${currentVisitor.nickname}" disabled="disabled">
						</div>
						<div class="col-md-6 single-us">
							<input type="text" name="email" id="email" value="${currentVisitor.email}" disabled="disabled">
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="single-grid">
						<div class="col-md-6 single-us">
							<input type="text" name="front_url" id="front_url" value="${currentVisitor.front_url}" disabled="disabled">
						</div>
						<div class="col-md-6 single-us">
							<input type="text" name="profession" id="profession" value="${currentVisitor.profession}" disabled="disabled">
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="text-top">
						<div class="col-md-8 text-in">
							<textarea  name="comcontent" id="comcontent" onfocus="this.value='';" onblur="if (this.value == '') {this.value = 'Comment';}">Comment</textarea>
						</div>
						<div class="col-md-4 text-in">
							<input type="submit" value="SEND">
						</div>
						<div class="clearfix"> </div>
					</div>
				</form>
				<p>Welcome to comment or collection here.</p>
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
					<a href="#header" class="scroll"><img src="${staticPath}/static/img/fimg/go-to-top.png" alt=""/></a>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div id="modelId"></div>
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
(function($){
	$(function(){
		$("#commentSubmit").submit(function(){
			var id = $("#id").val();
			var comcontent = $("#comcontent").val();
			$.post('${staticPath }/front/blogfCommit.html',
				{comcontent:comcontent,blog_id:id},
				function(data){
					$.alert("提示",data.msg,
							function(){
								window.location.href='${staticPath }/front/blogSinglePage.html?id='+id;
							});
				},'json');
			return false;
		});

		$( "span.menu" ).click(function() {
			$( ".top-menu" ).slideToggle( "slow", function() {
				// Animation complete.
			});
		});

		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
		});
	});
})(jQuery);

function onComNumClick(){
	window.location.hash = "#leave";
}

function onCollectNumClick(){
	var bId = $("#id").val();
	$.post('${staticPath }/front/blogCollect.html',
		{id:bId},
		function(data){
		$.alert("提示",data.msg,
			function(){
				window.location.href='${staticPath}/front/blogSinglePage.html?id='+bId;
			});
	},'json');
}

</script>
</html>