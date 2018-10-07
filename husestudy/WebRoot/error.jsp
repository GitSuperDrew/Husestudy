<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" import="java.io.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML>
<html>
  <head>
    
    <title>500</title>
    <!-- 学校LOGO -->
    <link rel="icon" href="${pageContext.request.contextPath}/admin/images/HomeLogo.jpg" type="image/x-icon"/>
    <style type="text/css">
    body{color:white;}
        #spanColor{color:red;}
        .head500{ width:580px; height:234px; margin:50px auto 0 auto; }
		.txtbg500{ width:499px; height:169px; margin:10px auto 0 auto; background:url(${ pageContext.request.contextPath }/FrontPage/images/error/txtbg404.png) no-repeat;}
		.txtbg500 .txtbox{ width:390px; position:relative; top:30px; left:60px;color:#eee; font-size:13px;}
		.txtbg500 .txtbox p {margin:5px 0; line-height:18px;text-align:center;}
		.txtbg500 .txtbox .paddingbox { padding-top:0px;}
		.txtbg500 .txtbox p a { color:#eee; text-decoration:none;}
		.txtbg500 .txtbox p a:hover { color:#FC9D1D; text-decoration:underline;}
		center{color:white;font-size:15px;}
		span{color:red;font-weight:bold;}
		span:hover{color:#FC9D1D;text-decoration:underline;font-family:"微软雅黑";}
    </style>
  </head>
  
  <body bgcolor="#494949" ondragstart="return false">
  <div class="head500">
      <img alt="505error" title="Sorry！服务器异常" style="width:100%;height:100%;" src="${ pageContext.request.contextPath }/FrontPage/images/error/error500smart.png">
  </div>
		<div class="txtbg500">
		<div class="txtbox">
		<center><marquee><span>很抱歉！服务器出差错了！</span>请在首页底部联系管理员，Thanks!</marquee></center>
		<center><p class="paddingbox"><h3>请点击以下链接继续浏览网页</h3></p></center>
		<p>》》》<a style="cursor:pointer" onclick="history.back()">返回上一页面</a>《《《</p>
		<p>》》》<a href="${ pageContext.request.contextPath }/index.action">返回网站首页</a>《《《</p>
		</div>
	</div>
  <div id="msgDiv">
  <center>
     <span id="spanColor">Message[错误信息]:</span><%=exception.getMessage() %><br/>
     <%-- <span id="spanColor">StackTrace[具体位置]:</span><br/>
     <%
       StringWriter stringWriter = new StringWriter();
       PrintWriter printWriter = new PrintWriter(stringWriter);
       exception.printStackTrace(printWriter);
       out.print(stringWriter);
       printWriter.close();
       stringWriter.close();
     %> --%>
  </center>
  </div>
    
  </body>
</html>
