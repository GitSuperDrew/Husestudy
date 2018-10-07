<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
  </head>
  <body>
        <!-- Sub-Footer
	================================================== -->
    
    <!-- Change to class="container subfooterwrap full" for a full-width subfooter -->
    <div class="container subfooterwrap">
    
    	<div class="footeropen"></div>
    
    	<div class="subfooter">
        	<div class="eight columns siteinfo">&copy; Copyright &copy; 2018.Company name All rights reserved.<a target="_blank" href="#">Drew Husestudy Markdown</a></div>  <!--http://777moban.com-->
            <div class="eight columns sitenav">
                <a href="${pageContext.request.contextPath}/index.jsp">首页</a>&nbsp; &nbsp; &nbsp;
                <a href="#">特点</a>&nbsp; &nbsp; &nbsp;
                <a href="#">文件夹</a>&nbsp; &nbsp; &nbsp;
                <a href="#">博客</a>&nbsp; &nbsp; &nbsp;
                <a href="#">联系</a>&nbsp; &nbsp; &nbsp;
                <a href="javascript:;" onclick="addFavorite(this);">收藏本站</a>
            </div>
        </div>
    </div>

<!-- End Document
================================================== -->
    
    
  </body>
</html>
