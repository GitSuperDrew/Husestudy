<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath}/css/left.css" rel="stylesheet" type="text/css"/>
<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/dtree.css" type="text/css" />
<style type="text/css">
	body{
		margin:0px;padding-left:15px;
	}
	#adminAttention{
		width:130px;
		color:red;
		font-size:15px;
		word-wrap:break-word;
	}
</style>
</head>
<body>
		<table width="100" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td height="12"></td>
		  </tr>
		</table>
		<table width="100%" border="0">
		  <tr>
		    <td>
				<div class="dtree">
				
					<a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>
					
					<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>
					<script type="text/javascript">
					
						d = new dTree('d');
						d.add('01',-1,'系统菜单树');
						d.add('0101','01','用户管理','','','mainFrame');
						d.add('010101','0101','用户管理','${pageContext.request.contextPath}/userAdmin_findAll.action?page=1','','mainFrame');
						d.add('0102','01','作品管理');
						d.add('010201','0102','作品管理','${pageContext.request.contextPath}/adminWorks_findAll.action?page=1','','mainFrame');
						d.add('0103','01','收藏管理');
						d.add('010301','0103','收藏管理','${pageContext.request.contextPath}/adminGit_findAll.action?page=1','','mainFrame');
						d.add('0104','01','评论管理');
						d.add('010401','0104','评论管理','${pageContext.request.contextPath}/discussAdmin_findAll.action?page=1','','mainFrame');
						d.add('0105','01','学院管理','','','mainFrame');
						d.add('010501','0105','学院管理','${pageContext.request.contextPath}/adminCollege_findAll.action','','mainFrame');
						d.add('0106','01','专业管理');
						d.add('010601','0106','专业管理','${pageContext.request.contextPath}/adminMajor_findAll.action?page=1','','mainFrame');
						d.add('0107','01','用户多专业管理');
						d.add('010701','0107','多专业管理','${pageContext.request.contextPath}/major_UserAdmin_findAll.action?page=1','','mainFrame');
						d.add('0108','01','反馈信息管理');
						d.add('010801','0108','反馈信息管理','${pageContext.request.contextPath}/sendMsgAdmin_findAll.action?page=1','','mainFrame');
						d.add('0109','01','ContactInfo管理');
						d.add('010901','0109','ContactInfo管理','${pageContext.request.contextPath}/contact_InfoAdmin_contactInfo.action?page=1','','mainFrame');
						d.add('01010','01','格言管理');
						d.add('0101001','01010','格言管理','${pageContext.request.contextPath}/mottoAdmin_findAll.action?page=1','','mainFrame');
						
						document.write(d);
					</script>
				</div>	
			</td>
		  </tr>
		</table>
		<div id="adminAttention">
		<hr/>
		安全提醒：<br/>
		①&nbsp;&nbsp;创建新的用户账号之前，应该在search中查询一下看看有无已经存在的用户账号！<br/><br/>
	    ②&nbsp;&nbsp;记住登入的地址：http:127.0.0.1:8080/husestudy/admin/admin_login1.jsp<br/><br/>
	    ③&nbsp;&nbsp;退出登入，请关闭浏览器！（防止数据缓存到浏览器中）<br/>
		</div>
</body>
</html>
