<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript">
			function addMajor(){
				window.location.href = "${pageContext.request.contextPath}/adminMajor_addPage.action";
			}
		</script>
		
		<!-- Bootstrap -->
		<link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/admin/assets/styles.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/admin/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
		<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/vendors/flot/excanvas.min.js"></script><![endif]-->
		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
		<script src="${pageContext.request.contextPath}/admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
		
	</HEAD>
	<body>
	<%-- <s:debug/> --%>
	
		<div class="row-fluid">
			<!-- block -->
			<div class="block">
				<div class="navbar navbar-inner block-header">
					<div class="muted pull-left">专业列表</div>
				</div>
				<div class="block-content collapse in">
					<div class="span12">
						<div class="table-toolbar">
							<div class="btn-group">
								<a href="#"><button onclick="addMajor()" class="btn btn-success">添加专业<i class="icon-plus icon-white"></i></button></a>
							</div>
							<div class="btn-group pull-right">
								<button data-toggle="dropdown" class="btn dropdown-toggle">Tools <span class="caret"></span></button>
								<ul class="dropdown-menu">
									<li><a href="#">Print</a></li>
									<li><a href="#">Save as PDF</a></li>
									<li><a href="#">Export to Excel</a></li>
								</ul>
							</div>
						</div>
	
						<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example2">
							<thead>
								<tr>
									<th>专业编号</th>
									<th>专业名称</th>
									<th>所属学院</th>
									<th>编辑</th>
									<th>删除</th>
								</tr>
							</thead>
							<tbody>
								
								<s:iterator var="m" value="cList" status="status">
									<tr class="odd gradeX" onmouseover = "this.style.background='white'">
									
										<td style="cursor:hand" align="center"><s:property value="#m.mid"/></td>
										<td style="cursor:hand" align="center"><s:property value="#m.mname"/></td>
										<td style="cursor:hand" align="center"><s:property value="#m.college.cname"/></td>
										<td align="center" style="HEIGHT: 22px">
											<a href="${ pageContext.request.contextPath }/adminMajor_edit.action?mid=<s:property value="#m.mid"/>">
												<img src="${pageContext.request.contextPath}/admin/images/i_edit.gif" border="0" style="CURSOR: hand">
											</a>
										</td>
										<td align="center" style="HEIGHT: 22px">
											<a href="${ pageContext.request.contextPath }/adminMajor_delete.action?mid=<s:property value="#m.mid"/>" onclick="return confirm('确定要删除吗？')">
												<img src="${pageContext.request.contextPath}/admin/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
											</a>
										</td>
									</tr>
								</s:iterator>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- /block -->
		</div>
		
		
		<script src="${pageContext.request.contextPath}/admin/vendors/jquery-1.9.1.js"></script>
		<script src="${pageContext.request.contextPath}/admin/bootstrap/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/admin/vendors/datatables/js/jquery.dataTables.min.js"></script>

		<script src="${pageContext.request.contextPath}/admin/assets/scripts.js"></script>
		<script src="${pageContext.request.contextPath}/admin/assets/DT_bootstrap.js"></script>
	</body>
</HTML>

