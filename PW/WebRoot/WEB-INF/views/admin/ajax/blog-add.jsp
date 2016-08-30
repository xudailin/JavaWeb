<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>

<style type="text/css">
	li {
		list-style-type:none;
		padding: 10px 0;
		margin-left: 30px;
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
		width: 340px;
	}
	
</style>

<form id="addForm" method="post">
	<div class="modal-body">
		<ul>
			<li>
				<span class="item-title">博客题目：</span>
				<span><input type="text" id="title" name="title" style="width: 340px;"/>
				</span>
			</li>
			<li>
				<span class="item-title">博客内容：</span>
				<span><textarea rows="3" id="content" name="content"></textarea>
				</span>
			</li>
			<li>
				<span class="item-title">博客类型：</span>
				<span>
				 <select id="blogType" name="blogType.typename" style="width: 340px;" >
				 	<option value="0">请选择</option>
				 	<c:forEach items="${blogTypeList}" var="blogType">
				 	<option value="${blogType.typename}">${blogType.typename} </option>
				 	</c:forEach>
				</select>
				</span>
			</li>
			<li>
				<span class="item-title">作者：</span>
				<span><input type="text" id="loginname" name="user.loginname" value="${currentUser.loginname}" disabled="disabled" style="width: 340px;"/></span>
			</li>
		</ul>
		
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" id="close">关闭</button>
		<a type="submit" onclick="javaScript:$('#addForm').submit();" class="btn btn-primary">提交</a>
	</div>
</form>

<script type="text/javascript">
(function($){
		$(function(){
			$("#addForm").submit(function(){
				$.post('${staticPath }/after/addBlog.html',
				$("#addForm").serialize(),
				function(data){
					if(data.success){
						$("#close").click();  
						$.alert("提示",data.msg,function(){
							$.openHTML('${staticPath }/after/blogPage.html');
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
	