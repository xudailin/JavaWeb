<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>

<style type="text/css">
	li {
		list-style-type:none;
		padding: 10px 0;
	}
	.item-title {
		display: inline-block;
		width:80px;
	}
	input {
		padding:5px 10px;
	}
	select {
		padding:5px 10px;
	}
	textarea {
		padding:5px 10px;
		width: 270px;
	}
	
</style>

<form id="editForm" method="post">
<div class="modal-body">
	<ul>
		<li>
			<input type="hidden" name="id" value="${blog.id}"/>
			<span class="item-title">博客题目：</span>
			<input type="text" id="title" name="title" value="${blog.title}" style="width: 270px;"/>
		</li>
		<li>
			<span class="item-title">博客内容：</span>
			<span><textarea rows="3" id="content" name="content">${blog.content}</textarea>
			</span>
		</li>
		<li>
			<span class="item-title">博客类型：</span>
			<span>
			<select id="blogType" name="blogType.typename" style="width: 270px;" >

				<option value="0">请选择</option>
				 <c:forEach items="${blogTypeList}" var="blogType">
					<option value="${blogType.typename}" <c:if test="${blog.type_id==blogType.id}">selected="selected"</c:if>>${blogType.typename}</option>
				 </c:forEach>
			
			</select>
			</span>
		</li>
		<li>
			<span class="item-title">作者：</span>
			<span><input type="text" id="loginname" name="user.loginname" value="${blog.user.loginname}" disabled="disabled" style="width: 270px;"/></span>
		</li>
	</ul>
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
				$.post('${staticPath }/after/editBlog.html',
				$("#editForm").serialize(),
				function(data){
					if(data.success){
						$("#close").click();  
						$.alert("提示",data.msg,function(){
							$.openHTML('${staticPath}/after/blogPage.html');
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