<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<form id="editForm" method="post">
<div class="modal-body">
	<p><strong>类型名称：</strong>
	<input type="hidden" name="id" value="${blogType.id}"/>
	<input type="text" name="typename" value="${blogType.typename}"/>
	</p>
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
				$.post('${staticPath }/after/editBlogType.html',
				$("#editForm").serialize(),
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