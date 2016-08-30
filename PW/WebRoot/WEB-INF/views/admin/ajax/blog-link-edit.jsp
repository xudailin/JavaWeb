<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>

<style type="text/css">
	.link-name-text{
		float: left;
		line-height: 30px;
	}
	.link-url-text{
		float: left;
		line-height: 30px;
	}
	.link-url-input {
		padding-left: 70px; 
	}
	.link-name {
		margin-left: 10px;
	}
	.link-url {
		margin-left: 10px;
	}
</style>

<form id="editForm" method="post">
<div class="modal-body">
	<input type="hidden" name="id" value="${blogLink.id}"/>
	<div class="link-name">
		<div class="link-name-text"><strong>链接名称：</strong></div>
		<div class="link-name-input"><input type="text" name="linkname" value="${blogLink.linkname}"/></div>
	</div>
	<div class="link-url">
		<div class="link-url-text"><strong>路径：</strong></div>
		<div class="link-url-input"><input type="text" name="url" value="${blogLink.url}"/></div>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" id="close">关闭</button>
	<a type="submit" onclick="javaScript:$('#editForm').submit();" class="btn btn-primary">提交</a>
</div>
</form>
<script type="text/javascript">
(function($){
		$(function(){
			$("#editForm").submit(function(){
				$.post('${staticPath }/after/editBlogLink.html',
				$("#editForm").serialize(),
				function(data){
					if(data.success){
						$("#close").click();  
						$.alert("提示",data.msg,function(){
							$.openHTML('${staticPath }/after/blogLinkPage.html');
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