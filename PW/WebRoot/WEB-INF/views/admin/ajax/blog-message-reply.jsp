<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>

<style>
.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden}
.clearfix{*+height:1%;}
	
	.left {
		float: left;
	}
	.modal-body {
		overflow-y: scroll;
		overflow-x: hidden;
	}
	.modal-footer{
		margin-top: 0;
	}
	.message-content {
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
	.message-list {
		margin: 0;
	}
	.message-item {
		padding: 5px 0;
	}
	li {
		list-style-type:none;
		padding: 10px 0;
	}
	.message-pic {
		padding-right: 10px;
	}
	.message-img {
		width: 40px;
	}
	.message-item-name {
		font-size: 12px;
		color: blue;
	}
	.message-item-time {
		font-size: 10px;
		color: #B3B0B3;
	}
	.message-item-content {
		width: 480px;
		font-size: 12px;
		padding: 5px 0;
	}
	.reply-content{
		margin-left: 50px;
		width: 450px;
	}
	.show-all {
		padding: 5px 10px;
		color: #848484;
	}
</style>
<form id="replyForm" method="post">
<div class="message-content">
	<div class="message-info">
		<input type="hidden" id="mId" value="${blogMessage.id}" />
		<input type="hidden" id="rootId" value="${blogMessage.root_id}"/>
		<div style="margin-bottom: 5px"><i class="fa fa-comment-o"></i><strong style="margin-left: 5px">留言</strong></div>
		<div>
		<ul class="message-list" id="message-list">
			<li class="message-item clearfix" id="messageinfo"></li>
		</ul>
		</div>
		<div class="reply">
			<textarea name="mcontent" id="myReply" rows="3" class="reply-content" placeholder="回复${blogMessage.leaver.nickname}:"></textarea>
		</div>
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
			var mId = $("#mId").val();
			var list ;
			$.post('${staticPath}/after/scanBlogMessage.html',{id:mId},function(data){
 					list = data;
 					showDate();
			 },'json');

			$("#close").click(function(){
				$.openHTML('${staticPath }/after/blogMessagePage.html');
			});

			function showDate(){
				var dComcontent ;
				$("#messageinfo").empty();
				$.each(list,function(i,message){
					var mtime = message.writetime.time;
					var mpubtime = new Date(parseInt(mtime));
					if (message.id==mId) { dComcontent="<strong>"+message.mcontent+"</strong>"}else{dComcontent=message.mcontent};
					if (message.super_id=='0'){
						$("#messageinfo").append("<div class='message-pic left'><img src='${staticPath }/"+message.leaver.headimgurl+"' class='message-img'/></div><div class='left'><div class='message-item-name'><font color='blue'>"+message.leaver.nickname+"</font></div><div class='message-item-time'>"+mpubtime.toLocaleString()+"</div><div class='message-item-content'>"+dComcontent+"</div></div>");
						}else{
							$("#messageinfo").append("<div style='padding-left: 50px;'><span class='message-item-name'>"+message.leaver.nickname+"</span><span>回复</span><span class='message-item-name'>"+message.superBlogMessage.leaver.nickname+"</span><span class='message-item-name'>:</span><span class='message-item-content'>"+dComcontent+"</span></div>");
						}
					});
				}

	$("#replyForm").submit(function(){
			var supermId = $("#mId").val();
			var content = $("#myReply").val();
			var rootId = $("#rootId").val();
			$.post('${staticPath }/after/replyMessage.html',
				{mcontent:content,root_id:rootId,super_id:supermId},
				function(data){
					if(data.success){
						$("#close").click();
						$.alert("提示",data.msg,
							function(){
								$.openHTML('${staticPath }/after/blogMessagePage.html');
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



