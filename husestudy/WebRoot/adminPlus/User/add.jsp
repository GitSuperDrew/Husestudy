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
		<form action="${pageContext.request.contextPath}/adminPlus/User/index.jsp" method="post" class="definewidth m20">
			<table class="table table-bordered table-hover definewidth m10">
				<tr>
					<td width="10%" class="tableleft">用户编号</td>
					<td><input type="text" name="uid" disabled="disabled"/></td>
				</tr>
				<tr>
					<td width="10%" class="tableleft">用户姓名</td>
					<td><input type="text" name="username" /></td>
				</tr>
				
				<tr>
					<td class="tableleft">用户密码</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td width="10%" class="tableleft">真实姓名</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td class="tableleft">担任角色</td>
					<td><input type="text" name="job" /></td>
				</tr>
				<tr>
					<td class="tableleft">电话号码</td>
					<td><input type="tel" name="phone" /></td>
				</tr>
				<tr>
					<td width="10%" class="tableleft">电子邮箱</td>
					<td><input type="email" name="email" /></td>
				</tr>
				<tr>
					<td width="10%" class="tableleft">所在专业</td>
					<td><input type="text" name="mname" /></td>
				</tr>
				<tr>
					<td width="10%" class="tableleft">所在学院</td>
					<td><input type="text" name="cname" /></td>
				</tr>
				
				<tr>
					<td class="tableleft"></td>
					<td>
						<button type="submit" class="btn btn-primary" type="button">保存</button> &nbsp;&nbsp;
						<button type="reset" class="btn " type="button">重置</button> &nbsp;&nbsp;
						<button type="button" class="btn btn-success" onclick="history.go(-1)">返回列表</button>
					</td>
				</tr>
			</table>
		</form>
	</body>

</html>
<script>
	$(function() {
		$('#backid').click(function() {
			window.location.href = "${pageContext.request.contextPath}/adminPlus/User.jsp";
		});

	});
</script>