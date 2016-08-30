<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ page import="com.wtu.sss.util.FileUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统使用说明</title>
<%

	String basePath=request.getScheme()+"://"+request.getServerName();
	basePath=basePath+":"+request.getServerPort();
	basePath=basePath+request.getContextPath();
	
    String fileTxt="";
    request.setCharacterEncoding("UTF-8");
    String filePath=basePath+"/ReadMe.txt";
    FileUtil fileUtil = new FileUtil();
    if(filePath!=null){
         String path=pageContext.getServletContext().getRealPath(filePath);
         fileTxt=fileUtil.getInfo(filePath);
    }
%> 
<style type="text/css">
<!--
.STYLE29 {font-size: 16px;
color: #003300;
font-weight:bold;
}
.STYLE17 {font-size: 14px; color: #000000; }
-->
</style>

</head>

<body>
<p align="center" class="STYLE29">用户必读</p>
<form id="form1" name="form1" method="post" action="">
  <table width="200" border="0" align="center">
    <tr>
      <td align="center"><textarea name="fileStr" id="fileStr"
	   rows="30" cols="100" readonly="readonly" class="STYLE17" style="overflow-y:hidden"><%=fileTxt%></textarea></td>
    </tr>
    
  </table>
</form>
</body>
</html>
