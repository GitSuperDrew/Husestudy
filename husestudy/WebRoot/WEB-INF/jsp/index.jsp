<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>湘科院大学生自学交流平台</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">

    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/skeleton.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/screen.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/mediaelementplayer.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/updown.css" />
    
    <!--[if IE 7]>
        <link rel="stylesheet" href="stylesheets/ie7.css">
    <![endif]-->

    <!-- Favicons
    ================================================== -->
    <%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/FrontPage/images/favicon.ico">
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/FrontPage/images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/FrontPage/images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/FrontPage/images/apple-touch-icon-114x114.png">
     --%>
    <!-- 学校Logo -->
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo/HomeLogo.jpg" type="image/x-icon"/>
    
    <!-- Fonts
    ================================================== -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,400italic,700,700italic,300,300italic' rel='stylesheet' type='text/css'>
   
</head>
<body>

    <!-- Site Backgrounds
    ================================================== -->
    
    <!-- Change to class="poswrapheaderline wide" and class="headerline full" for a full-width header line -->
    <div class="poswrapheaderline"><div class="headerline"></div></div>  
    <!-- Remove or uncomment depending on if you want a background image or tile -->
    <div class="tiledbackground"></div>
    <!--img src="images/bg.jpg" alt="" id="background" /-->
    <!-- Change to class="poswrapper wide" and class="whitebackground full" for a full-width site background -->
    <div class="poswrapper"><div class="whitebackground"></div></div>





<!-- container -->
    <div class="container main portfolio4column">
    
         <!-- Page Top
        ================================================== -->
        <%@ include file="Home/HomeTop.jsp" %>
        
        <!-- Page Title And Social
        ================================================== -->
        <div class="pagetitle">
            <div class="pagetitleholder">
               <s:iterator var="mottoMessage" value="mottoMessageList">
                  <h1><s:property value="#mottoMessage.motto_message"/></h1>
               </s:iterator>
            </div>
           <%-- <%@ include file="HomeSocialicons.jsp" %> --%>
        </div>
        
        
        <!-- Slider  滑块    
        ================================================== -->
        <%@ include file="Home/HomeSlider.jsp" %>

        <!-- Text Block 4个文本框
        ================================================== -->
        <%@ include file="Home/HomeTextBlock.jsp" %>
        
        
        <!-- Portfolio Teasers   全部学院---部分学生作品展示栏目=====出现加载延迟（用户体验不好）=================
        ================================================== -->
       <%@ include file="Home/HomeCollegeBlock.jsp" %>
        
        <!-- Clients 学院专业
        ================================================== -->
        <%@ include file="Home/HomeCollege.jsp" %>
        
        <!-- Bottom Padding Adjust
        ================================================== --> 
        <div class="sixteen columns bottomadjust"></div>
    </div>
<!-- container -->


    <!-- Footer
    ================================================== -->    
    <%@ include file="Home/HomeFooter.jsp" %>
    <%@ include file="Home/HomeBottom.jsp" %>
    <!-- 置顶置底 -->
<div id="updown"><span class="up"></span><span class="down"></span></div>

<!-- Scripts
    ================================================== -->
    <script src="${pageContext.request.contextPath}/FrontPage/js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/FrontPage/js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/FrontPage/js/jquery.animate-colors-min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/FrontPage/js/ddsmoothmenu.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/FrontPage/js/jquery.cssAnimate.mini.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/FrontPage/js/jquery.fitvids.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/FrontPage/js/jquery.flexslider-min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/FrontPage/js/jquery.prettyPhoto.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/FrontPage/js/mediaelement-and-player.min.js"></script>
    <script src="${pageContext.request.contextPath}/FrontPage/js/screen.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/FrontPage/js/GitWebsite.js" type="text/javascript"></script>

</body>
</html>