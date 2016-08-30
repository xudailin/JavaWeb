<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>

<style type="text/css">
	.row {
		margin-left: -15px;
	    margin-right: -15px;
	}
	.panel {
		margin-left: 0px;
	    margin-right: 0px;
	}
	h1, h2, h3 {
		line-height: 20px;
	}


</style>
<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header"><i class="fa fa-link"></i>友情链接</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
			<li><i class="fa fa-file-text"></i>博客模块</li>		  	
			<li><i class="fa fa-link"></i>友情链接</li>				
		</ol>
	</div>
</div>

	<div class="row">		
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2><i class="fa fa-link red"></i><span class="break"></span><strong>友情链接</strong></h2>
					<div class="panel-actions">
						<a href="javaScript:$.openHTML('${staticPath }/after/blogLinkPage.html');" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
						<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
						<a href="${staticPath }/after/index.action" class="btn-close"><i class="fa fa-times"></i></a>
					</div>
				</div>
				<div class="panel-body">
					<div style="float: right; margin-bottom: 10px"> 
				        <button class="btn btn-primary" href="${staticPath }/after/addBlogLinkPage.action" data-dialog=""><i class="fa fa-plus"></i> 添加博客链接</button>
				    </div>
					<table class="table table-striped table-bordered bootstrap-datatable datatable">
					  <thead>
						  <tr>
							  <th>序号</th>
							  <th>名称</th>
                              <th>链接</th>                            
							  <th>操作</th>
						  </tr>
					  </thead>   
					  <tbody>
					  <c:forEach items="${linkList}" var="blogLink" varStatus="id">	
						<tr>
							<td>${id.index+1}</td>
                            <td>${blogLink.linkname}</td>
                            <td>${blogLink.url}</td>
							<td>
								<input type="hidden" name="id" value="${blogLink.id}"/>
								<a class="btn btn-info" href="${staticPath }/after/editBlogLinkPage.html?id=${blogLink.id}" data-dialog="" title="编辑博客链接"><i class="fa fa-edit "></i></a>
								<a class="btn btn-danger" title="删除" href="javaScript:deleteBlogLink(${blogLink.id})" ><i class="fa fa-trash-o "></i></a>
							</td>
						</tr>
						</c:forEach>
					  </tbody>
				  </table>
				   
				</div>
			</div>
		</div><!--/col-->
	
	</div><!--/row-->

<script type="text/javascript">
	function deleteBlogLink(blId){
		$.confirm("提示","您确定要删除该条记录吗？",function(confirmed){
			if (confirmed) {
				$.post('${staticPath}/after/deleteBlogLink.html',
				{id:blId},
				function(data) {
                  	$.alert("提示",data.msg,function(){
						$.openHTML('${staticPath }/after/blogLinkPage.html');
					});
                },'json');
			};
		}); 
	}
	
</script>	