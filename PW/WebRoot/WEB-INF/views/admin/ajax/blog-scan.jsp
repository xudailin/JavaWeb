<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>

<style type="text/css">

	.modal-body {
		overflow-y: scroll;
		overflow-x: hidden;
		height: 500px;
	}
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
		width: 340px;
		
	}
	select {
		padding:5px 10px;
	}
	textarea {
		padding:5px 10px;
		width: 340px;
	}
	
</style>

<div class="bloginfo">
	<ul>
		<li>
			<span class="item-title">博客题目：</span>
			<input type="text" id="title" name="title" value="${blog.title}" disabled="disabled"/>
		</li>
		<li>
			<span class="item-title">博客内容：</span>
			<span><textarea rows="3" id="content" name="content" disabled="disabled">${blog.content}</textarea>
			</span>
		</li>
		<li>
			<span class="item-title">博客类型：</span>
			<span><input type="text" id="typename" name="blogType.typename" value="${blog.blogType.typename}" disabled="disabled"/></span>
		</li>
		<li>
			<span class="item-title">作者：</span>
			<span><input type="text" id="loginname" name="user.loginname" value="${blog.user.loginname}" disabled="disabled"/></span>
		</li>
		<li>
			<span class="item-title">发布时间：</span>
			<span>
			<fmt:formatDate  value="${blog.publishtime}" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></span>
		</li>
		<li>
			<span class="item-title">浏览次数：</span>
			<span><input type="text" id="readtimes" name="readtimes" value="${blog.readtimes}" disabled="disabled"/></span>
		</li>
		<li>
			<span class="item-title">评论数：</span>
			<span><input type="text" id="comNum" name="comNum" value="${blog.comNum}" disabled="disabled"/></span>
		</li>
		<li>
			<span class="item-title">收藏次数：</span>
			<span><input type="text" id="collectNum" name="collectNum" value="${blog.collectNum}" disabled="disabled"/></span>
		</li>
	</ul>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" id="close">确定</button>
</div>
