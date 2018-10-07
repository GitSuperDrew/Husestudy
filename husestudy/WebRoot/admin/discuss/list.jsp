<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript">
			function addCollege(){
				window.location.href = "${pageContext.request.contextPath}/admin/college/add.jsp";
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
		<div class="row-fluid">
			<!-- block -->
			<div class="block">
				<div class="navbar navbar-inner block-header">
					<div class="muted pull-left">评论列表</div>
				</div>
				<div class="block-content collapse in">
					<div class="span12">
						<div class="table-toolbar">
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
									<th>评论编号</th>
									<th>评论内容</th>
									<th>评论日期</th>
									<th>好评数量</th>
									<th>差评数量</th>
									<th>作品名称</th>
									<th>用户名称</th>
									<th>删除</th>
								</tr>
							</thead>
							<tbody>
							<s:iterator var="d" value="dList" status ="status">
								<tr class="odd gradeA" onmouseover="this.style.backgroundColor='#fff'">
									<td style="cursor:hand" align="center"><s:property value="#d.did"/></td>
									<td style="cursor:hand" align="center"><s:property value="#d.dcontent"/></td>
									<td style="cursor:hand" align="center"><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#d.ddate})}"/></td>
									<td style="cursor:hand" align="center"><s:property value="#d.good"/></td>
									<td style="cursor:hand" align="center"><s:property value="#d.bad"/></td>
									<td style="cursor:hand" align="center"><s:property value="#d.works.wname"/></td>
									<td style="cursor:hand" align="center"><s:property value="#d.user.username"/></td>
									
									<td align="center" style="HEIGHT: 22px">
										<a href="${ pageContext.request.contextPath }/discussAdmin_delete.action?did=<s:property value="#d.did"/>" onclick="return confirm('确定要删除吗？')">
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

