<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML>
<html>
  <head>
    <title>404</title>
    <!-- 学校LOGO -->
    <link rel="icon" href="${pageContext.request.contextPath}/admin/images/HomeLogo.jpg" type="image/x-icon"/>
	<style type="text/css">
		.head404{ width:580px; height:234px; margin:50px auto 0 auto; background:url(${ pageContext.request.contextPath }/FrontPage/images/error/head404.png) no-repeat; }
		.txtbg404{ width:499px; height:169px; margin:10px auto 0 auto; background:url(${ pageContext.request.contextPath }/FrontPage/images/error/txtbg404.png) no-repeat;}
		.txtbg404 .txtbox{ width:390px; position:relative; top:30px; left:60px;color:#eee; font-size:13px;}
		.txtbg404 .txtbox p {margin:5px 5px; line-height:18px;}
		.txtbg404 .txtbox .paddingbox { padding-top:15px;}
		.txtbg404 .txtbox p a { color:#eee; text-decoration:none;}
		.txtbg404 .txtbox p a:hover { color:#FC9D1D; text-decoration:underline;}
	</style>
  </head>
  
  <body bgcolor="#494949">
	<div class="head404"></div>
		<div class="txtbg404">
		<div class="txtbox">
		<h3>处理方法：</h3>
			<p>① 请确认你输入的地址是正确的。</p>
			<p>② 请联系站长进行处理，或者请通过本站底部的反馈表单填写好地址栏上的地址以用来反馈信息！</p>
			<p class="paddingbox">请点击以下链接继续浏览网页</p>
			<p>》》》<a style="cursor:pointer" onclick="history.back()">返回上一页面</a></p>
			<p>》》》<a href="${ pageContext.request.contextPath }/index.action">返回网站首页</a></p>
		</div>
	</div>
    
  </body>
</html>
