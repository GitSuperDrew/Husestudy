<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>

	<head>
		<title></title>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminPlus/Css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminPlus/Css/bootstrap-responsive.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminPlus/Css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/adminPlus/Js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/adminPlus/Js/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/adminPlus/Js/ckform.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/adminPlus/Js/common.js"></script>

		<style type="text/css">
			body {
				padding-bottom: 40px;
			}
			
			.sidebar-nav {
				padding: 9px 0;
			}
			
			@media (max-width: 980px) {
				/* Enable use of floated navbar text */
				.navbar-text.pull-right {
					float: none;
					padding-left: 5px;
					padding-right: 5px;
				}
			}
		</style>
	</head>

	<body>
		<form class="form-inline definewidth m20" action="${pageContext.request.contextPath}/adminPlus/User/index.jsp" method="get">
			用户名称：
			<input type="text" name="username" id="username" class="abc input-default" placeholder="" value="">&nbsp;&nbsp;
			<button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增用户</button>
		</form>
		<table class="table table-bordered table-hover definewidth m10">
			<thead>
				<tr>
					<th>用户编号</th>
					<th>用户名称</th>
					<th>用户密码</th>
					<th>真实姓名</th>
					<th>担任角色</th>
					<th>电话号码</th>
					<th>电子邮箱</th>
					<th>所在专业</th>
					<th>所在学院</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator var="u" value="pageBean.list" status ="status">
					<tr class="odd gradeA" onmouseover="this.style.backgroundColor='white'">
						<td style="cursor:hand" align="center"><s:property value="#status.count"/></td>
						<td style="cursor:hand" align="center"><s:property value="#u.uid"/></td>
						<td style="cursor:hand" align="center"><s:property value="#u.username"/></td>
						<td style="cursor:hand" align="center"><s:property value="#u.password"/></td>
						<td style="cursor:hand" align="center"><s:property value="#u.name"/></td>
						<td style="cursor:hand" align="center"><s:property value="#u.job"/></td>
						<td style="cursor:hand" align="center"><s:property value="#u.phone"/></td>
						<td style="cursor:hand" align="center"><s:property value="#u.email"/></td>
						<td style="cursor:hand" align="center"><s:property value="#u.major.mname"/></td>
						<td style="cursor:hand" align="center"><s:property value="#u.college.cname"/></td>
						<td align="center" style="HEIGHT: 22px">
							<a href="${ pageContext.request.contextPath }/userAdminPlus_edit.action?uid=<s:property value="#u.uid"/>">
								<img src="${pageContext.request.contextPath}/adminPlus/Images/i_edit.gif" border="0" style="CURSOR: hand">
							</a>
						</td>
						<td align="center" style="HEIGHT: 22px">
							<a href="${ pageContext.request.contextPath }/userAdminPlus_delete.action?uid=<s:property value="#u.uid"/>" onclick="return confirm('确定要删除吗？')">
								<img src="${pageContext.request.contextPath}/adminPlus/Images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
							</a>
						</td>
					</tr>
				</s:iterator>
					<tr align="center">
						<td colspan="7">
							第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页 
							<s:if test="pageBean.page != 1">
								<a href="${ pageContext.request.contextPath }/userAdminPlus_findAllByPage.action?page=1">首页</a>|
								<a href="${ pageContext.request.contextPath }/userAdminPlus_findAllByPage.action?page=<s:property value="pageBean.page-1"/>">上一页</a>|
							</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a href="${ pageContext.request.contextPath }/userAdminPlus_findAllByPage.action?page=<s:property value="pageBean.page+1"/>">下一页</a>|
								<a href="${ pageContext.request.contextPath }/userAdminPlus_findAllByPage.action?page=<s:property value="pageBean.totalPage"/>">尾页</a>|
							</s:if>
						</td>
					</tr>
				</tbody>
			
		</table>
	</body>

</html>
<script>
	$(function() {
		$('#addnew').click(function() {
			window.location.href = "${pageContext.request.contextPath}/adminPlus/User/add.jsp";
		});
	});

	function del(id) {
		if(confirm("确定要删除吗？")) {
			var url = "${pageContext.request.contextPath}/adminPlus/User/index.jsp";
			window.location.href = url;
		}
	}
</script>