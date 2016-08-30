<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>
<%@ page import="com.wtu.sss.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>库存管理</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/default.js"></script>
</head>

<body>
	<div id="container">
		<form method="post" action="product!queryProduct.action" name="form3">
			<div id="searchBlock">
				<table width="100%" cellspacing="0" cellpadding="0" id="search">
					<thead>
						<span id="bar"><p class="STYLE6">>>请选择输入查询条件</p> </span>
					</thead>
					<tbody>
						<tr>
							<td width="13%"><p align="right"><span class="STYLE5">商品编号：</span></p></td>
							<td width="17%"><input name="productId" type="text" id="productId" /></td>
							<td width="13%"><p align="right"><span class="STYLE5">商品名称：</span></p></td>
							<td width="22%"><input name="productName" type="text" id="productName" /></td>
							<td width="13%"><p align="right"><span class="STYLE5">商品简称：</span></p></td>
							<td width="22%"><input name="shortName" type="text" id="shortName" /></td>
						</tr>
						<tr>
							<td align="right"><input type="submit" name="Submit" value="开始查询" /></td>
							<td align="left"><input name="reset" type="reset" id="reset" value="重置" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="resultBlock">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					id="senfe">
					<thead>
						<span id="bar"><p class="STYLE6">>>商品查询结果</p> </span>
					</thead>
					<tbody>
						<tr>
							<td width="7%"><div align="center"><span class="STYLE14"> 
							<input type="checkbox" name="checkAll" value="checkbox" id="checkAll" onclick="check();" /> <strong>全选</strong> </span>
							</div></td>
							<td width="8%" height="35"><div align="center" class="STYLE14">商品编号</div></td>
							<td width="12%"><span class="STYLE14">商品全称</span></td>
							<td width="10%"><span class="STYLE14">简称</span></td>
							<td width="7%"><span class="STYLE14">批号</span></td>
							<td width="10%"><span class="STYLE14">单价</span></td>
							<td width="8%"><span class="STYLE14">库存量</span></td>
							<td width="8%"><span class="STYLE14">单位</span></td>
							<td width="9%"><span class="STYLE14">备注</span></td>
							<td width="21%"><span class="STYLE14">操作</span></td>
						</tr>
						<c:forEach var="product" items="${pageBean.list}">
							<tr>
								<td height="81"><input type="checkbox" name="ids"
									value="${product.prodId}" /></td>
								<td><span class="STYLE15">${product.productId}</span></td>
								<td><span class="STYLE15">${product.productName}</span></td>
								<td><span class="STYLE15">${product.shortName}</span></td>
								<td><span class="STYLE15">${product.productBatch}</span></td>
								<td><span class="STYLE15">${product.productPrice}</span></td>
								<td><span class="STYLE15">${product.productStoreNum}</span>
								</td>
								<td><span class="STYLE15">${product.productUnit}</span></td>
								<td><span class="STYLE15">${product.productRemark}</span></td>
								<td><a href="product!preProductIn.action?prodId=${product.prodId}"><span class="STYLE6">入库</span></a> 
								<a href="product!preProductOut.action?prodId=${product.prodId}"><span class="STYLE6">出库</span></a>
								<a href="product!getProvidersOfProd.action?prodId=${product.prodId}"><span class="STYLE6">查看供应商</span></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<table>
<tr>
<td width="7%"><input name="button" type="button" value="删除" onclick="delProdAll()" /></td>
						<td><input name="button" type="button" id="button" value="新增" onclick="go('addProduct.jsp')" /></td>

<td align="right" width="61%"><span class="STYLE6">共<s:property value="pageBean.allRow"/>条记录,
  共<s:property value="pageBean.totalPage"/>页,
  当前第<s:property value="pageBean.currentPage"/>页</span></td>
  <s:if test="%{pageBean.currentPage == 1}">
　　　　　　<td width="8%" align="center"><img src="images/first.gif" border="0" /></td>
        <td width="8%" align="left"><img src="images/pre.gif" border="0" /></td>
　</s:if>
　　　　<s:else>
　　　　　　<td width="8%" align="center"><a href="product!showAllProduct.action?page=1"><img src="images/first.gif" border="0" /></a></td>
　　　　　　<td width="8%" align="left"><a href="product!showAllProduct.action?page=<s:property value="%{pageBean.currentPage-1}"/>"><img src="images/pre.gif" border="0" /></a></td>
　　　　</s:else>
　　　　<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
　　　　　　<td width="8%" align="center"><a href="product!showAllProduct.action?page=<s:property value="%{pageBean.currentPage+1}"/>"><img src="images/next.gif" border="0" /></a></td>
　　　　　　<td width="8%" align="left"><a href="product!showAllProduct.action?page=<s:property value="pageBean.totalPage"/>"><img src="images/last.gif" border="0" /></a></td>
　　　　</s:if>
　　　　<s:else>
　　　　　　<td width="8%" align="center"><img src="images/next.gif" border="0" /></td>
        <td width="8%" align="left"><img src="images/last.gif" border="0" /></td>
　　　　</s:else>
</tr>　
</table>
			</div>
		</form>
	</div>
</body>
</html>
<script language="javascript">
<!--
	//senfe("表格名称","奇数行背景","偶数行背景","鼠标经过背景","点击后背景");
	senfe("senfe", "#fff", "#ccc", "#cfc", "#FF8080");
	-->
</script>

