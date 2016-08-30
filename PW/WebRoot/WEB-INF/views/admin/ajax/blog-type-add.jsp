<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>

<form id="addForm" method="post">
	<div class="modal-body">
		<p><strong>类型名称：</strong><input type="text" id="typename" name="typename" /></p>
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
				$.post('${staticPath }/after/addBlogType.html',
				$("#addForm").serialize(),
				function(data){
					if(data.success){
						$("#close").click();  
						$.alert("提示",data.msg,function(){
							$.openHTML('${staticPath }/after/blogTypePage.html');
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
	