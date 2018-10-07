<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<!-- Bootstrap -->
		<link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/admin/assets/styles.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/admin/assets/DT_bootstrap.css" rel="stylesheet" media="screen">

		<script src="${pageContext.request.contextPath}/admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
		
	</HEAD>
	<body>
		<div class="row-fluid">
			<!-- block -->
			<div class="block">
				<div class="navbar navbar-inner block-header">
					<div class="muted pull-left">ContactInfo管理</div>
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
									<th>编号</th>
									<th>粗略地址</th>
									<th>详细地址</th>
									<th>所在校区</th>
									<th>常用邮箱</th>
									<th>邮箱网址</th>
									<th>联系电话</th>
									<th>工作日</th>
									<th>双休日</th>
									<th>编辑</th>
								</tr>
							</thead>
							<tbody>
							<s:iterator var="info" value="contact_Info">
								<tr class="odd gradeA" onmouseover="this.style.backgroundColor='white'">
									<td style="cursor:hand" align="center"><s:property value="#info.infoId"/></td>
									<td style="cursor:hand" align="center"><s:property value="#info.addr"/></td>
									<td style="cursor:hand" align="center"><s:property value="#info.address"/></td>
									<td style="cursor:hand" align="center"><s:property value="#info.school"/></td>
									<td style="cursor:hand" align="center"><s:property value="#info.email"/></td>
									<td style="cursor:hand" align="center"><s:property value="#info.emailwebsite"/></td>
									<td style="cursor:hand" align="center"><s:property value="#info.phone"/></td>
									<td style="cursor:hand" align="center"><s:property value="#info.whour"/></td>
									<td style="cursor:hand" align="center"><s:property value="#info.weekend"/></td>
									
									<td align="center" style="HEIGHT: 22px">
										<a href="${ pageContext.request.contextPath }/contact_InfoAdmin_editContactInfo.action?infoId=<s:property value="#info.infoId"/>">
											<button class="btn btn-info">
												<img src="${pageContext.request.contextPath}/admin/images/i_edit.gif" border="0" style="CURSOR: hand">编辑
											</button>
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

