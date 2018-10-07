<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML>
<html>

	<head>
		<title>实用后台管理系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="${pageContext.request.contextPath}/adminPlus/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/adminPlus/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/adminPlus/assets/css/main-min.css" rel="stylesheet" type="text/css" />
	</head>

	<body>

		<div class="header">

			<div class="dl-title">
				<!--<img src="/chinapost/Public/assets/img/top.png">-->
			</div>

			<div class="dl-log">欢迎您，<span class="dl-log-user"><s:property value="#session.existAdmin.kname"/>   </span>
				<a href="${pageContext.request.contextPath}/adminPlus/Public/login.jsp" title="退出系统" class="dl-log-quit">[退出]</a>
			</div>
		</div>
		<div class="content">
			<div class="dl-main-nav">
				<div class="dl-inform">
					<div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div>
				</div>
				<ul id="J_Nav" class="nav-list ks-clear">
					<li class="nav-item dl-selected">
						<div class="nav-item-inner nav-home">系统管理</div>
					</li>
					<li class="nav-item dl-selected">
						<div class="nav-item-inner nav-order">业务管理</div>
					</li>

				</ul>
			</div>
			<ul id="J_NavContent" class="dl-tab-conten">

			</ul>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/adminPlus/assets/js/jquery-1.8.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/adminPlus/assets/js/bui-min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/adminPlus/assets/js/common/main-min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/adminPlus/assets/js/config-min.js"></script>
		<script> 
			BUI.use('common/main', function() {
				var config = [{
					id: '1',
					menu: [{
						text: '系统管理',
						items: [{
							id: '12',
							text: '机构管理',
							href: 'Node/index.jsp'
						}, {
							id: '13',
							text: '学院管理',
							href: 'College/index.jsp'
						},{
							id: '14',
							text: '专业管理',
							href: 'Major/index.jsp'
						}, {
							id: '3',
							text: '角色管理',
							href: 'Role/index.jsp'
						}, {
							id: '4',
							text: '用户管理',
							href: 'User/index.jsp'
						}, {
							id: '6',
							text: '菜单管理',
							href: 'Menu/index.jsp'
						}]
					}]
				}, {
					id: '7',
					homePage: '9',
					menu: [{
						text: '业务管理',
						items: [{
							id: '9',
							text: '查询业务',
							href: 'Node/index.jsp'
						}]
					}]
				}];
				new PageUtil.MainPage({
					modulesConfig: config
				});
			});
		</script>
	</body>

</html>
