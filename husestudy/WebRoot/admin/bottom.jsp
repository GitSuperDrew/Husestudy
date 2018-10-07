<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
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
		<div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand"><span id="timeShow"></sapn>
       <script language="javascript">
       		var t = null;
			t = setTimeout(time, 1000); //开始执行
			function time() {
				clearTimeout(t); //清除定时器
				dt = new Date();
				var h = dt.getHours();
				var m = dt.getMinutes();
				var s = dt.getSeconds();
				document.getElementById("timeShow").innerHTML = "Present Time：" + h + "时" + m + "分" + s + "秒";
				t = setTimeout(time, 1000); //设定定时器，循环执行             
			}
		</script>
                    </a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a class="brand" style="font-size:10px"> 
                                	 &copy;Drew Husestudy Markdown&nbsp;
                                </a>
                            </li>
                        </ul>
                       
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        
        <!--/.fluid-container-->
        <script src="${pageContext.request.contextPath}/admin/vendors/jquery-1.9.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/scripts.js"></script>
	</body>
</html>
