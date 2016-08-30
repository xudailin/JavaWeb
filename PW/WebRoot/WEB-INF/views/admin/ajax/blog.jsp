<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>

<style type="text/css">
	td {
		text-align:center; 
		vertical-align:middle;
	} 
	.pagination {
	  	width: 50%;
	  	margin-left: 25%;
	}
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
		<h3 class="page-header"><i class="fa fa-file"></i>博客管理</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
			<li><i class="fa fa-file-text"></i>博客模块</li>  	
			<li><i class="fa fa-file"></i>博客管理</li>				
		</ol>
	</div>
</div>
<div class="row">		
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2><i class="fa fa-file red"></i><span class="break"></span><strong>博客管理</strong></h2>
					<div class="panel-actions">
						<a href="javaScript:$.openHTML('${staticPath }/after/blogPage.html');" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
						<a href="table.html#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
						<a href="${staticPath }/after/index.action" class="btn-close"><i class="fa fa-times"></i></a>
					</div>
				</div>
				<div class="panel-body">
					<div style="float: left"> 
		      	<span >当前显示记录数：</span>
						<span>
							<input type="text" id="pagesize" name="pagesize" value="5" style="width: 100px; text-align: center;"/>
						</span> 
						<span> 条</span>
						<a href="javaScript:showDate()" class="btn-setting"><i class="fa fa-rotate-right"></i></a>  
				     </div>
						<div style="float: right; margin-bottom: 10px"> 
			        <button class="btn btn-primary" href="${staticPath }/after/addBlogPage.action" data-dialog="">
			        	<i class="fa fa-plus"></i> 写博客
			        </button>
				    </div>
						<table class="table table-striped table-bordered bootstrap-datatable datatable" >
						  <thead>
							  <tr>
								  <th width="5%">序号</th>
								   <th width="15%">题目</th>
				                  <th width="30%">博客内容</th>
				                  <th width="8%">类型</th>
				                  <th width="6%">作者</th>
								  <th width="15%">发布时间</th>
								  <th width="21%">操作</th>
							  </tr>
						  </thead>   
						  <tbody id="tbody">
						  </tbody>
					  </table>
					  <div class="text-center" id="example" ></div>
				 </div>
				</div>	
			</div>
		</div><!--/col-->
	
	</div><!--/row-->

<script type="text/javascript">

	(function($){
		$(function(){
			showDate(1);
		});
	})(jQuery);

	function showDate(pNow){
		var size=$("#pagesize").val();
		$.post('${staticPath}/after/blogList.html',
			{pagesize:size},function(data){
			var list = data.rows;
			var total=data.total;
			$("#tbody").empty();
			$.each(list,function(i,blog){
				var di = $("<tr><td>"+(total-i)+"</td><td>"+blog.title+"</td><td><div style='width:300px;overflow: hidden; text-overflow: ellipsis;white-space: nowrap;'>"+blog.content+"</div></td><td>"+blog.blogType.typename+"</td><td>"+blog.user.loginname+"</td><td>"+blog.publishtime+"</td><td><input type='hidden' value='"+blog.id+"'/><a class='btn btn-success' data-dialog='' title='浏览博客信息' href='${staticPath}/after/scanBlogPage.html?id="+blog.id+"'><i class='fa fa-search-plus'></i></a><a class='btn btn-info' data-dialog='' title='编辑博客' href='${staticPath}/after/editBlogPage.html?id="+blog.id+"'><i class='fa fa-edit'></i></a><a class='btn btn-warning' data-dialog='' title='浏览博客评论' href='${staticPath}/after/scanCommentPage.html?id="+blog.id+"'><i class='fa fa-envelope-o'></i></a><a class='btn btn-danger' title='删除' href='javaScript:deleteBlog("+blog.id+")'><i class='fa fa-trash-o'></i></a></td></tr>");
				$("#tbody").append(di);
			});
			var totalPages  = Math.ceil(total/size);
			var currentPage = data.nowpage;
			var options = {
				currentPage: currentPage,
				totalPages: totalPages,
				size:"normal",
				alignment: "center",
				itemTexts: function(type, page, current){
					switch(type){
						case "first":
							return "首页";
						case "prev":
							return "上一页";
						case "next":
							return "下一页";
						case "last":
							return "末页";
						case "page":
							return page;
					}
				},
				onPageClicked: function(event, originalEvent, type, page){
					$.post('${staticPath}/after/blogList.html',{nowpage:page,pagesize:size},function(data){
							var list = data.rows;
							var from = data.from;
							$("#tbody").empty();
							$.each(list,function(i,blog){
								var di = $("<tr><td>"+(total-i-from)+"</td><td>"+blog.title+"</td><td><div style='width:300px;overflow: hidden; text-overflow: ellipsis;white-space: nowrap;'>"+blog.content+"</div></td><td>"+blog.blogType.typename+"</td><td>"+blog.user.loginname+"</td><td>"+blog.publishtime+"</td><td><input type='hidden' value='"+blog.id+"'/><a class='btn btn-success' data-dialog='' title='浏览博客信息' href='${staticPath}/after/scanBlogPage.html?id="+blog.id+"'><i class='fa fa-search-plus'></i></a><a class='btn btn-info' data-dialog='' title='编辑博客' href='${staticPath}/after/editBlogPage.html?id="+blog.id+"'><i class='fa fa-edit'></i></a><a class='btn btn-warning' data-dialog='' title='浏览博客评论' href='${staticPath}/after/scanCommentPage.html?id="+blog.id+"'><i class='fa fa-envelope-o'></i></a><a class='btn btn-danger' title='删除' href='javaScript:deleteBlog("+blog.id+")'><i class='fa fa-trash-o'></i></a></td></tr>");
								$("#tbody").append(di);
							});
					},'json')
				}
			};
			$('#example').bootstrapPaginator(options);
		},'json');
	}

	function deleteBlog(bId){
		$.confirm("提示","您确定要删除该条记录吗？",function(confirmed){
			if (confirmed) {
				$.post('${staticPath}/after/BlogDelete.html',{id:bId}, function(data){
					$.alert("提示",data.msg,function(){
						$.openHTML('${staticPath}/after/blogPage.html');
					})
				},'json')
			};
		}); 
	}
</script>
