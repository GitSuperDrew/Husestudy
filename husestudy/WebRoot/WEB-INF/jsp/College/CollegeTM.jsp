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
	<title>土木与环境工程学院|Welcome</title>
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
    <!--[if IE 7]>
        <link rel="stylesheet" href="stylesheets/ie7.css">
    <![endif]-->

	<!-- Favicons
	================================================== -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/FrontPage/images/favicon.ico">
	<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/FrontPage/images/apple-touch-icon.png">
	<link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/FrontPage/images/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/FrontPage/images/apple-touch-icon-114x114.png">
    <!-- 学院的LOGO -->
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo/TM_logo.jpg" type="image/x-icon"/>
    <!-- Fonts
	================================================== -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,400italic,700,700italic,300,300italic' rel='stylesheet' type='text/css'>
    
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

	<div class="container main portfolio4column">
    
        <!-- Header | Logo, Menu
		================================================== -->
		<%@ include file="../Home/HomeTop.jsp" %>
        
        <!-- Slider
		================================================== -->
        <%@ include file="../Home/HomeSlider.jsp" %>
        
        <!-- Text Block
		================================================== -->
        <%@ include file="../Home/HomeTextBlock.jsp" %>
		
        
        
        <!-- Portfolio Teasers
		================================================== -->
        <div class="sixteen columns row divide">
            <h3 class="titledivider">最新作品展示</h3>
            <div class="rightlink"><a href="#" class="titlelink"><span style="font-size:13px;">&rarr;</span> 查看更多</a></div>
            <div class="dividerline"></div>
        </div>

        <div class="sixteen columns row portfolio_filter">
            <ul>
               <s:iterator var="m" value="majors" status="status">
                <li>
                     <a class="portfolio_selector" data-group="all-group">
                      <s:property value="#m.mname"/>
                     </a>
                </li>
               </s:iterator>
            </ul>
        </div>
        <div class="clear"></div>
       
        <div class="sixteen columns row teasers portfolio">
        <s:iterator var="works" value="worksSet" status="status">
            <div class="four columns teaser all-group web-group">
               <a href="${ pageContext.request.contextPath }/works_detials.action?wid=<s:property value="#works.wid"/>" data-text="" class="hovering">
                  <img style="width:100%;height:90px;" src="${pageContext.request.contextPath}/<s:property value="#works.wimage"/>" alt="图片跑丢了" class="scale-with-grid" />
               </a>
               <div class="topline">
                  <a style="padding-left:10px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" href="${ pageContext.request.contextPath }/works_detials.action?wid=<s:property value="#works.wid"/>"><s:property value="#works.wname"/></a>
               </div>
               <!-- <div class="subline"> -->
               <div style="width:200px;display:block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;padding-left:10px;color:grey;">
                   <s:property value="#works.wcontent"/>
               </div>
            </div>
        </s:iterator>
        <div class="clear"></div>
        </div>
        
        <!-- Clients  学院集合
		================================================== -->
        <%@ include file="../Home/HomeCollege.jsp" %>
		
      <!-- Bottom Padding Adjust
       ================================================== --> 
       <div class="sixteen columns bottomadjust"></div>
            
	</div><!-- container -->

	<!-- Footer
	================================================== -->
	<%@ include file="../Home/HomeFooter.jsp" %>
    
    
    <!-- Sub-Footer
	================================================== -->
    <%@ include file="../Home/HomeBottom.jsp" %>
    
<!-- End Document
================================================== -->

</body>
</html>