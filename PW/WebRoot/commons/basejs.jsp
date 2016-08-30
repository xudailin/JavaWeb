<%--标签 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="edge" />




<!-- Import google fonts - Heading first/ text second -->
        <link rel='stylesheet' type='text/css' href='http://fonts.useso.com/css?family=Open+Sans:400,700|Droid+Sans:400,700' />
        <!--[if lt IE 9]>
<link href="http://fonts.useso.com/css?family=Open+Sans:400" rel="stylesheet" type="text/css" />
<link href="http://fonts.useso.com/css?family=Open+Sans:700" rel="stylesheet" type="text/css" />
<link href="http://fonts.useso.com/css?family=Droid+Sans:400" rel="stylesheet" type="text/css" />
<link href="http://fonts.useso.com/css?family=Droid+Sans:700" rel="stylesheet" type="text/css" />
<![endif]-->

		<!-- Fav and touch icons -->
		<link rel="shortcut icon" href="${staticPath }/static/ico/favicon.ico" type="image/x-icon" />    

	    <!-- Css files -->
	    <link href="${staticPath }/static/css/bootstrap.min.css" rel="stylesheet">	
		<link href="${staticPath }/static/css/jquery.mmenu.css" rel="stylesheet">		
		<link href="${staticPath }/static/css/font-awesome.min.css" rel="stylesheet">
		<link href="${staticPath }/static/css/climacons-font.css" rel="stylesheet">
		<link href="${staticPath }/static/plugins/xcharts/css/xcharts.min.css" rel=" stylesheet">		
		<link href="${staticPath }/static/plugins/fullcalendar/css/fullcalendar.css" rel="stylesheet">
		<link href="${staticPath }/static/plugins/morris/css/morris.css" rel="stylesheet">
		<link href="${staticPath }/static/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
		<link href="${staticPath }/static/plugins/jvectormap/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">	    
	    <link href="${staticPath }/static/css/style.min.css" rel="stylesheet">
		<link href="${staticPath }/static/css/add-ons.min.css" rel="stylesheet">
		<!-- 日期插件 -->
	    <link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">	


	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->

	<!-- start: JavaScript-->
	<!--[if !IE]>-->

			<script src="${staticPath }/static/js/jquery-2.1.1.min.js"></script>
			<script src="${staticPath }/static/script/common.js"></script>
	<!--<![endif]-->

	<!--[if IE]>
	
		<script src="${staticPath }/static/js/jquery-1.11.1.min.js"></script>
	
	<![endif]-->

	<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='${staticPath }/static/js/jquery-2.1.1.min.js'>"+"<"+"/script>");
		</script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script type="text/javascript">
	 	window.jQuery || document.write("<script src='${staticPath }/static/js/jquery-1.11.1.min.js'>"+"<"+"/script>");
		</script>
		
	<![endif]-->
	<script src="${staticPath }/static/js/jquery-migrate-1.2.1.min.js"></script>
	 <script src="${staticPath }/static/js/bootstrap.min.js"></script>
	<script src="${staticPath }/static/js/bootbox.min.js"></script>
	
<!--	<script language="javascript" type="text/javascript" src="${staticPath }/static/plugins/My97DatePicker4.7.2/WdatePicker.js"></script>-->
	<!-- page scripts -->
	<script src="${staticPath }/static/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
	<script src="${staticPath }/static/plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
	<script src="${staticPath }/static/plugins/moment/moment.min.js"></script>
	<script src="${staticPath }/static/plugins/fullcalendar/js/fullcalendar.min.js"></script>
	<!--[if lte IE 8]>
		<script language="javascript" type="text/javascript" src="${staticPath }/static/plugins/excanvas/excanvas.min.js"></script>
	<![endif]-->
	<script src="${staticPath }/static/plugins/flot/jquery.flot.min.js"></script>
	<script src="${staticPath }/static/plugins/flot/jquery.flot.pie.min.js"></script>
	<script src="${staticPath }/static/plugins/flot/jquery.flot.stack.min.js"></script>
	<script src="${staticPath }/static/plugins/flot/jquery.flot.resize.min.js"></script>
	<script src="${staticPath }/static/plugins/flot/jquery.flot.time.min.js"></script>
	<script src="${staticPath }/static/plugins/flot/jquery.flot.spline.min.js"></script>
	<script src="${staticPath }/static/plugins/xcharts/js/xcharts.min.js"></script>
	<script src="${staticPath }/static/plugins/autosize/jquery.autosize.min.js"></script>
	<script src="${staticPath }/static/plugins/placeholder/jquery.placeholder.min.js"></script>
	<script src="${staticPath }/static/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="${staticPath }/static/plugins/datatables/js/dataTables.bootstrap.min.js"></script>
	<script src="${staticPath }/static/plugins/raphael/raphael.min.js"></script>
	<script src="${staticPath }/static/plugins/morris/js/morris.min.js"></script>
	<script src="${staticPath }/static/plugins/jvectormap/js/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="${staticPath }/static/plugins/jvectormap/js/jquery-jvectormap-world-mill-en.js"></script>
	<script src="${staticPath }/static/plugins/jvectormap/js/gdp-data.js"></script>	
	<script src="${staticPath }/static/plugins/gauge/gauge.min.js"></script>
	
	
	
	<!-- theme scripts -->
	<script src="${staticPath }/static/js/SmoothScroll.js"></script>
	<script src="${staticPath }/static/js/jquery.mmenu.min.js"></script>
	<script src="${staticPath }/static/js/core.min.js"></script>
	<script src="${staticPath }/static/plugins/d3/d3.min.js"></script>	
	
	
	<!-- end: JavaScript-->


	<script type="text/javascript">
    var basePath = "${staticPath }";
</script>



 <!--分页
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
-->
<link href="${staticPath }/static/css/bootstrap-combined.min.css" rel="stylesheet">
<script type="text/javascript" src="${staticPath }/static/js/bootstrap-paginator.js"></script>

<!-- 日期插件 -->
<script type="text/javascript" src="${staticPath }/static/js/moment.js"></script>
<script type="text/javascript" src="${staticPath }/static/js/bootstrap-datetimepicker.min.js"></script>
