<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<title>left</title>
		<meta charset="utf-8" />
		<!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="${pageContext.request.contextPath}/admin/assets/styles.css" rel="stylesheet" media="screen">
        <link href="${pageContext.request.contextPath}/admin/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="${pageContext.request.contextPath}/admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	</head>

	<body>
		<div class="span3" id="sidebar">
			<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
				<li>
					<a href="index.html"><i class="icon-chevron-right"></i> Dashboard</a>
				</li>
				<li>
					<a href="calendar.html"><i class="icon-chevron-right"></i> Calendar</a>
				</li>
				<li>
					<a href="stats.html"><i class="icon-chevron-right"></i> Statistics (Charts)</a>
				</li>
				<li>
					<a href="form.html"><i class="icon-chevron-right"></i> Forms</a>
				</li>
				<li class="active">
					<a href="tables.html"><i class="icon-chevron-right"></i> Tables</a>
				</li>
				<li>
					<a href="buttons.html"><i class="icon-chevron-right"></i> Buttons & Icons</a>
				</li>
				<li>
					<a href="interface.html"><i class="icon-chevron-right"></i> UI & Interface</a>
				</li>
				<li>
					<a href="#"><span class="badge badge-success pull-right">731</span> Orders</a>
				</li>
				<li>
					<a href="#"><span class="badge badge-success pull-right">812</span> Invoices</a>
				</li>
				<li>
					<a href="#"><span class="badge badge-info pull-right">27</span> Clients</a>
				</li>
				<li>
					<a href="#"><span class="badge badge-info pull-right">1,234</span> Users</a>
				</li>
				<li>
					<a href="#"><span class="badge badge-info pull-right">2,221</span> Messages</a>
				</li>
				<li>
					<a href="#"><span class="badge badge-info pull-right">11</span> Reports</a>
				</li>
				<li>
					<a href="#"><span class="badge badge-important pull-right">83</span> Errors</a>
				</li>
				<li>
					<a href="#"><span class="badge badge-warning pull-right">4,231</span> Logs</a>
				</li>
			</ul>
		</div>


		<script src="${pageContext.request.contextPath}/admin/vendors/jquery-1.9.1.js"></script>
		<script src="${pageContext.request.contextPath}/admin/bootstrap/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/admin/vendors/datatables/js/jquery.dataTables.min.js"></script>

		<script src="${pageContext.request.contextPath}/admin/assets/scripts.js"></script>
		<script src="${pageContext.request.contextPath}/admin/assets/DT_bootstrap.js"></script>
	</body>

</html>
