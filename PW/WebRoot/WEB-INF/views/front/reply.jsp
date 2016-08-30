 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>

<style type="text/css">
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
		padding: 20px 0;
		text-indent: 24px;
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
		width: 500px;
	}
	.modal-body {
		padding: 10px 15px;
		overflow-y: scroll;
		overflow-x: hidden;
		margin: 0 25px;
	}
</style>

<form id="replyForm" method="post">
	<div class="comment-content">
		<div class="blog-info">
			<input type="hidden" id="blogId" value="${blogComment.blog_id}"/>
			<div class="blog-owner-pic left"><img src='${staticPath}/${blogComment.blog.user.headimgurl}' class="blog-owner-img"/></div>
			<div class="left"><div class="blog-owner-name">${blogComment.blog.user.nickname}</div>
			<div class="blog-publish-time">${blogComment.blog.publishtime}</div></div>
			<div class="blog-content">${blogComment.blog.content}</div>
		</div>
		<div class="comment-info">
			<div class="commenter-info clearfix">
				<input type="hidden" id="superCId" value="${blogComment.id}"/>
				<input type="hidden" id="rootId" value="${blogComment.root_id}"/>
				<div class="comment-pic left"><img src='${staticPath}/${blogComment.commenter.headimgurl}' class="comment-img"/></div>
				<div class="left">
					<div class="comment-item-name"><font color='blue'>${blogComment.commenter.nickname}</font></div>
					<div class="comment-item-time">${blogComment.cmttime}</div>	
					<div class='comment-item-content'>${blogComment.comcontent}</div>
				</div>
			</div>
		</div>
		<div class="reply">
			<textarea name="comcontent" id="frontReply" rows="5" class="reply-content" placeholder="回复${blogComment.commenter.nickname}:"></textarea>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" id="close">关闭</button>
		<a type="submit" class="btn btn-primary" onclick="javaScript:$('#replyForm').submit();">提交</a>
	</div>
</form>

<script type="text/javascript">
(function($){
	$(function(){
		$("#replyForm").submit(function(){
			var blogId = $("#blogId").val();
			var superCId = $("#superCId").val();
			var content = $("#frontReply").val();
			var rootId = $("#rootId").val();
			$.post('${staticPath }/front/replyComment.html',
				{blog_id:blogId,comcontent:content,root_id:rootId,super_id:superCId},
				function(data){
					if(data.success){
						$("#close").click();
						$.alert("提示",data.msg,
							function(){
								window.location.href='${staticPath }/front/blogSinglePage.html?id='+blogId;
							});
					}else{
						alert(data.msg);
					}
				},'json');
			return false;
		});
	});	
})(jQuery);
</script>
