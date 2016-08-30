<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>

<style type="text/css">

	#searchByDate {
		margin-bottom: 10px;
		margin-left: 5px;
		line-height: 20px;
	}
	.myinput{
		padding: 6px 6px;
    	text-align: center;
    	display: table-cell;
    	vertical-align: middle;
    	cursor: pointer;
    	background-color: #f5f5f5;
    	border: 1px solid #d4d4d4;
	}
	td {
		text-align:center; 
		vertical-align:middle;
	}
	.pagination {
		display: inline-block;
 		width:50%;
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
		<h3 class="page-header"><i class="fa fa-comments"></i>评论管理</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
			<li><i class="fa fa-file-text"></i>博客模块</li>		  	
			<li><i class="fa fa-comments"></i>评论管理</li>				
		</ol>
	</div>
</div>

<div class="row">		
	<div class="col-lg-12">
		<div class="panel panel-default">
				<div class="panel-heading">
					<h2><i class="fa fa-comments red"></i><span class="break"></span><strong>评论管理</strong></h2>
					<div class="panel-actions">
						<a href="javaScript:$.openHTML('${staticPath }/after/blogCommentPage.html');" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
						<a href="table.html#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
						<a href="${staticPath }/after/index.action" class="btn-close"><i class="fa fa-times"></i></a>
					</div>
				</div>
				<div class="panel-body">			
					<div>
						<div style="width: 10%;float: left;text-align: center;padding-top: 4px; "><span><strong>评论时间：</strong></span>
					    </div>
						<div style="width:30%; float: left; ">
						    <div class='input-group date' id='datetimepicker1'>
	                    		<input type="text" class="form-control" id="startdate" />
	                    		<span class="myinput" id="start"><span class="glyphicon glyphicon-remove"></span></span>
	                    		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	                    	</div>
						</div>
						<div style="width: 3%;float: left;text-align: center;padding-top: 4px; "><span>至</span>
					    </div>
					    <div style="width:30%; float: left; ">
					        <div class='input-group date' id='datetimepicker2'>
	                    		<input type="text" class="form-control" id="enddate" />
	                    		<span class="myinput" id="end"><span class="glyphicon glyphicon-remove"></span></span>
	                    		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                			</div>
					    </div>   
					    <div style="width:25%; float: left; ">
						    <button class="btn btn-sm btn-success" id="searchByDate"><i class="fa fa-search"></i> 查询</button>
					   	</div>
					</div>
					<div>
					<table class="table table-striped table-bordered bootstrap-datatable datatable">
					  <thead>
						  <tr>
							  <th width="5%">序号</th>
                              <th width="6%">评论者</th>
                              <th width="23%">评论</th>
							  <th width="23%">博文题目</th>
							  <th width="17%">评论时间</th>
							  <th width="7%">状态</th>
							  <th width="19%">操作</th>
						  </tr>
					  </thead>   
					  <tbody id="tbody"></tbody>
				  </table>
				  </div>
				  	<div style="float: left;margin-top:18px;"> 
		      			<span >显示记录数：</span>
						<span>
							<input type="text" id="pagesize" name="pagesize" value="5" style="width: 100px; text-align: center;"/>
						</span> 
						<span>条</span>
						<a href="javaScript:showDate()" class="btn-setting"><i class="fa fa-rotate-right"></i></a>  
				  </div>
				  	<div class="text-center" id="example" ></div>   
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
			var starttime=$("#startdate").val();
			var endtime=$("#enddate").val();
			$.post('${staticPath}/after/blogComments.html',
				{pagesize:size,starttime:starttime,endtime:endtime},function(data){
			var list = data.rows;
			var total=data.total;
			$("#tbody").empty();
			var strState ;
			$.each(list,function(i,blogComment){
				if (blogComment.state==1) {strState="<font color=red><strong>新评论</strong></font>"}else{strState='已打开'};
				var di = $("<tr><td>"+(total-i)+"</td><td>"+blogComment.commenter.nickname+"</td><td><div style='width: 250px;overflow: hidden; text-overflow: ellipsis;white-space: nowrap;'>"+blogComment.comcontent+"</div></td><td><div style='width: 250px;overflow: hidden; text-overflow: ellipsis;white-space: nowrap;'>"+blogComment.blog.title+"</div></td><td>"+blogComment.cmttime+"</td><td>"+strState+"</td><td><input type='hidden' value='"+blogComment.id+"'/><a class='btn btn-success' data-dialog='' title='详细信息' href='${staticPath}/after/scanBlogCommentPage.html?id="+blogComment.id+"'><i class='fa fa-search-plus'></i></a><a class='btn btn-info' data-dialog='' title='回复' href='${staticPath}/after/replyCommentPage.html?id="+blogComment.id+"'><i class='fa fa-edit'></i></a><a class='btn btn-danger' title='删除' href='javaScript:deleteComment("+blogComment.id+")'><i class='fa fa-trash-o'></i></a></td></tr>");
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
				 	$.post('${staticPath}/after/blogComments.html',{nowpage:page,pagesize:size},function(data){
				 			var list = data.rows;
				 			var from = data.from;
				 			$("#tbody").empty();
				 			$.each(list,function(i,blogComment){
				 				if (blogComment.state==1) {strState="<font color=red><strong>新评论</strong></font>"}else{strState='已打开'};
				 				var di = $("<tr><td>"+(total-i-from)+"</td><td>"+blogComment.commenter.nickname+"</td><td><div style='width: 250px;overflow: hidden; text-overflow: ellipsis;white-space: nowrap;'>"+blogComment.comcontent+"</div></td><td><div style='width: 250px;overflow: hidden; text-overflow: ellipsis;white-space: nowrap;'>"+blogComment.blog.title+"</div></td><td>"+blogComment.cmttime+"</td><td>"+strState+"</td><td><input type='hidden' value='"+blogComment.id+"'/><a class='btn btn-success' data-dialog='' title='详细信息' href='${staticPath}/after/scanBlogCommentPage.html?id="+blogComment.id+"'><i class='fa fa-search-plus'></i></a><a class='btn btn-info' data-dialog='' title='回复' href='${staticPath}/after/replyCommentPage.html?id="+blogComment.id+"'><i class='fa fa-edit'></i></a><a class='btn btn-danger' title='删除' href='javaScript:deleteComment("+blogComment.id+")'><i class='fa fa-trash-o'></i></a></td></tr>");
				 					$("#tbody").append(di);
				 			});
				 	},'json')
				}
			};
			$('#example').bootstrapPaginator(options);
			},'json');
		}

		$(function () {
            $('#datetimepicker1').datetimepicker({
            	format: 'YYYY-MM-DD HH:mm:ss'
            });
            $('#datetimepicker2').datetimepicker({
            	format: 'YYYY-MM-DD HH:mm:ss'
            });
       	});

       	(function($){
			$(function(){
				$("#start").click(function(){
						$("#startdate").attr("value","");
					});
				$("#end").click(function(){
						$("#enddate").attr("value","");
					});
				$("#searchByDate").click(function(){
					showDate(1);
				});
			});	
		})(jQuery);

		function deleteComment(cId){
			$.confirm("提示","您确定要删除该条记录吗？",function(confirmed){
				if (confirmed) {
					$.post('${staticPath}/after/CommentDelete.html',{id:cId},function(data){
						$.alert("提示",data.msg,function(){
							$.openHTML('${staticPath}/after/blogCommentPage.html');
						})	
					},'json')
				};
			});
		}

	</script>