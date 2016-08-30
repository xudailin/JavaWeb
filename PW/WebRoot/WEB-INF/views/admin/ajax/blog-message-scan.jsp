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
	.show-all {
		padding: 5px 10px;
		color: #848484;
	}
</style>
<div class="message-content">
	<div class="message-info">
		<input type="hidden" id="mId" value="${currentMessageId}" />
		<div style="margin-bottom: 5px"><i class="fa fa-comment-o"></i><strong style="margin-left: 5px">留言</strong></div>
		<div>
		<ul class="message-list" id="message-list">
			<li class="message-item clearfix" id="minfo"></li>
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
			var mId = $("#mId").val();
			var list ;
			$.post('${staticPath}/after/scanBlogMessage.html',{id:mId},function(data){
 					list = data;
 					if (list.length<=4) {$("#showOrhide").hide()};
 					showDate();
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

			$("#close").click(function(){
				$.openHTML('${staticPath }/after/blogMessagePage.html');
			});

			function showDate(){
				var tag = $("#showOrhide").html();
				if (tag=='收起') {
					$("#minfo").empty();
					var dComcontent ;
					$("#minfo").empty();
					$.each(list,function(i,message){
						var mtime = message.writetime.time;
						var mpubtime = new Date(parseInt(mtime));
						if (message.id==mId) { dComcontent="<strong>"+message.mcontent+"</strong>"}else{dComcontent=message.mcontent};
						if (message.super_id=='0'){
							$("#minfo").append("<div class='message-pic left'><img src='${staticPath }/"+message.leaver.headimgurl+"' class='message-img'/></div><div class='left'><div class='message-item-name'><font color='blue'>"+message.leaver.nickname+"</font></div><div class='message-item-time'>"+mpubtime.toLocaleString()+"</div><div class='message-item-content'>"+dComcontent+"</div></div>");
						}else{
							$("#minfo").append("<div style='padding-left: 50px;'><span class='message-item-name'>"+message.leaver.nickname+"</span><span>回复</span><span class='message-item-name'>"+message.superBlogMessage.leaver.nickname+"</span><span class='message-item-name'>:</span><span class='message-item-content'>"+dComcontent+"</span></div>");
						}
					 });
				}else{
					$("#minfo").empty();
					$.each(list.slice(0,4),function(i,message){
						var mtime = message.writetime.time;
						var mpubtime = new Date(parseInt(mtime));
						if (message.id==mId) { dComcontent="<strong>"+message.mcontent+"</strong>"}else{dComcontent=message.mcontent};
						if (message.super_id=='0'){
							$("#minfo").append("<div class='message-pic left'><img src='${staticPath }/"+message.leaver.headimgurl+"' class='message-img'/></div><div class='left'><div class='message-item-name'><font color='blue'>"+message.leaver.nickname+"</font></div><div class='message-item-time'>"+mpubtime.toLocaleString()+"</div><div class='message-item-content'>"+dComcontent+"</div></div>");
						}else{
							$("#minfo").append("<div style='padding-left: 50px;'><span class='message-item-name'>"+message.leaver.nickname+"</span><span>回复</span><span class='message-item-name'>"+message.superBlogMessage.leaver.nickname+"</span><span class='message-item-name'>:</span><span class='message-item-content'>"+dComcontent+"</span></div>");
						}
					 });
				}
			}
		});	
	})(jQuery);

</script>


