<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<style>
.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden}
.clearfix{*+height:1%;}
	
	.left {
		float:left;
	}
	.modal-body {
		overflow-y: scroll;
		overflow-x: hidden;
		height: 500px;
	}
	.modal-footer{
		margin-top: 0;
	}
	.comment-content {
		padding: 10px 15px;
	}
	.user-pic {
		padding-right: 20px;
	}
	.user-img {
		width: 50px;
	}
	.user-name, .publish-time {
		font-size: 14px;
		line-height: 20px;
		padding: 5px 0;
		color: #333;
	}
	.blog-content {
		clear: left;
		text-align: justify;
		font-size: 14px;
		color: #000000;
		line-height: 24px;
		padding: 10px 0;
	}
	.comment-list {
		margin: 0;
	}
	.comment-item {
		padding: 5px 0;
	}
	li {
		list-style-type:none;
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
	.show-all {
		padding: 5px 10px;
		color: #848484;
	}
</style>
<div class="comment-content">
	<div class="blog-info">
		<input type="hidden" id="bId" value="${currentBlogId}" />
		<div class="user-info clearifx" id="blogInfo"></div>
		<div><i class="fa fa-comment-o"></i><strong style="margin-left: 5px">评论</strong></div>
		<div>
		<ul class="comment-list" id="comment-list">
			<li class="comment-item clearfix" id="bcinfo"></li>
		</ul>
		</div>
		<div class="show-all" id="showOrhide">展开</div>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" id="close" >确定</button>
</div>

<script type="text/javascript">
(function($){
		$(function(){
			var bId = $("#bId").val();
			var list ;
			$.post('${staticPath}/after/scanBlogComments.html',{id:bId},function(data){
				if(data.length>0){
					var ltime = data[0].blog.publishtime.time;
					var pubtime = new Date(parseInt(ltime));
					var bInfo = $("<div class='user-pic left'><img src='${staticPath}/"+data[0].blog.user.headimgurl+"' class='user-img'/></div><div class='left'><div class='user-name'>"+data[0].blog.user.nickname+"</div><div class='publish-time'>"+pubtime.toLocaleString()+"</div></div><div class='blog-content'>"+data[0].blog.content+"</div>");	
 					$("#blogInfo").append(bInfo);
 					list = data;
 					if (list.length<=4) {$("#showOrhide").hide()};
 					showDate();
				}else{
					$.post('${staticPath}/after/getBlog.html',{id:bId},function(data){
						var ltime = data.publishtime.time;
						var pubtime = new Date(parseInt(ltime));
						var bInfo = $("<div class='user-pic left'><img src='${staticPath}/"+data.user.headimgurl+"' class='user-img'/></div><div class='left'><div class='user-name'>"+data.user.nickname+"</div><div class='publish-time'>"+pubtime.toLocaleString()+"</div></div><div class='blog-content'>"+data.content+"</div>");
 						$("#blogInfo").append(bInfo);
 						{$("#showOrhide").hide()};
					},'json');
				}

			 },'json');

			$("#showOrhide").click(function(){
				var tag = $("#showOrhide").html();
				  if (tag=='展开') {
				  	$("#showOrhide").html('收起');
				  }else{
				  	$("#showOrhide").html('展开');
				  }
				  showDate();
			});

			function showDate(){
				var tag = $("#showOrhide").html();
				if (tag=='收起') {
					$("#bcinfo").empty();
					$.each(list,function(i,comment){
						var ctime = comment.cmttime.time;
						var cpubtime = new Date(parseInt(ctime));
						if (comment.super_id=='0'){
							$("#bcinfo").append("<br><div class='comment-pic left'><img src='${staticPath}/"+comment.commenter.headimgurl+"' class='comment-img'/></div><div class='left'><div class='comment-item-name'><font color='blue'>"+comment.commenter.nickname+"</font></div><div class='comment-item-time'>"+cpubtime.toLocaleString()+"</div><div class='comment-item-content'>"+comment.comcontent+"</div></div>");
						}else{
							$("#bcinfo").append("<div style='padding-left: 50px;'><span class='comment-item-name'>"+comment.commenter.nickname+"</span><span>回复</span><span class='comment-item-name'>"+comment.superComment.commenter.nickname+"</span><span class='comment-item-name'>:</span><span class='comment-item-content'>"+comment.comcontent+"</span></div>");
						}
					 });
				}else{
					$("#bcinfo").empty();
					$.each(list.slice(0,4),function(i,comment){
						var ctime = comment.cmttime.time;
						var cpubtime = new Date(parseInt(ctime));
						if (comment.super_id=='0'){
							$("#bcinfo").append("<br><div class='comment-pic left'><img src='${staticPath}/"+comment.commenter.headimgurl+"' class='comment-img'/></div><div class='left'><div class='comment-item-name'><font color='blue'>"+comment.commenter.nickname+"</font></div><div class='comment-item-time'>"+cpubtime.toLocaleString()+"</div><div class='comment-item-content'>"+comment.comcontent+"</div></div>");
						}else{
							$("#bcinfo").append("<div style='padding-left: 50px;'><span class='comment-item-name'>"+comment.commenter.nickname+"</span><span>回复</span><span class='comment-item-name'>"+comment.superComment.commenter.nickname+"</span><span class='comment-item-name'>:</span><span class='comment-item-content'>"+comment.comcontent+"</span></div>");
						}
					 });
				}
			}
		});	
	})(jQuery);

</script>


