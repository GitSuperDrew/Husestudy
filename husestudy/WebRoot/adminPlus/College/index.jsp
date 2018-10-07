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
	<s:debug></s:debug>
		<form class="form-inline definewidth m20" action="${pageContext.request.contextPath}/adminPlus/College/index.jsp" method="get">
			学院名称：
			<input type="text" name="rolename" id="rolename" class="abc input-default" placeholder="" value="">&nbsp;&nbsp;
			<button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增机构</button>
		</form>
		<table class="table table-bordered table-hover definewidth m10">
			<thead>
				<tr>
					<th>学院编号</th>
					<th>学院名称</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator var="c" value="pageBean.list" status ="status">
					<tr class="odd gradeA" onmouseover="this.style.backgroundColor='white'">
						<td style="cursor:hand" align="center"><s:property value="#c.cid"/></td>
						<td style="cursor:hand" align="center"><s:property value="#c.cname"/></td>
						
						<td align="center" style="HEIGHT: 22px">
							<a href="${ pageContext.request.contextPath }/adminCollegePlus_edit.action?cid=<s:property value="#c.cid"/>">
								<img src="${pageContext.request.contextPath}/adminPlus/Images/i_edit.gif" border="0" style="CURSOR: hand">
							</a>
						</td>
						<td align="center" style="HEIGHT: 22px">
							<a href="${ pageContext.request.contextPath }/adminCollegePlus_delete.action?cid=<s:property value="#c.cid"/>" onclick="return confirm('确定要删除吗？')">
								<img src="${pageContext.request.contextPath}/adminPlus/Images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
							</a>
						</td>
					</tr>
				</s:iterator>
				</tbody>
		</table>
		
		<div class="inline pull-right page">
			第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页 
				<s:if test="pageBean.page != 1">
					<a href="${ pageContext.request.contextPath }/adminCollegePlus_findAllByPage.action?page=1">首页</a>|
					<a href="${ pageContext.request.contextPath }/adminCollegePlus_findAllByPage.action?page=<s:property value="pageBean.page-1"/>">上一页</a>|
				</s:if>
				<s:if test="pageBean.page != pageBean.totalPage">
					<a href="${ pageContext.request.contextPath }/adminCollegePlus_findAllByPage.action?page=<s:property value="pageBean.page+1"/>">下一页</a>|
					<a href="${ pageContext.request.contextPath }/adminCollegePlus_findAllByPage.action?page=<s:property value="pageBean.totalPage"/>">尾页</a>|
				</s:if>
		</div>
		
		
	</body>
</html>



<script>
	$(function() {
		$('#addnew').click(function() {
			window.location.href = "${pageContext.request.contextPath}/adminPlus/College/add.jsp";
		});
	});

	function del(id) {
		if(confirm("确定要删除吗？")) {
			var url = "${pageContext.request.contextPath}/adminPlus/College/index.jsp";
			window.location.href = url;
		}
	}
</script>