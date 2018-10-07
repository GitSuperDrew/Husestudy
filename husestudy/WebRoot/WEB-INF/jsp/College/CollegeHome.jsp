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
	<title>|学院首页</title>
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
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo/HomeLogo.jpg" type="image/x-icon"/>
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
        
        <!-- Page Title And Social
		================================================== -->
        
		
        <!-- Slider
		================================================== -->
        <%@ include file="../Home/HomeSlider.jsp" %>
        
        <!-- Text Block
		================================================== -->
        <%@ include file="../Home/HomeTextBlock.jsp" %>
		
        
        <!-- Sidebar
        ================================================== -->

        <div class="four columns sidebar offset-by-one textblocksidebar">
            
            <div class="widget">
                <h5>BROCHURE DOWNLOAD</h5>
                <div class="pdfdownload">   
                    <a href="#" class="link"><img src="${pageContext.request.contextPath}/FrontPage/images/icons/pdf.png" class="left" alt="" />
                    <p>Dowload our 2012 Company Brochure in PDF Format</p></a>
                </div>
                <div class="clear"></div>
            </div>

            <div class="clear"></div>
        </div>
        
        <!-- Portfolio Teasers
		================================================== -->
        
        <div class="sixteen columns row divide">
        	<h3 class="titledivider">Latest Projects</h3>
            <div class="rightlink"><a href="#" class="titlelink"><span style="font-size:13px;">&rarr;</span> See Whole Portfolio</a></div>
            <div class="dividerline"></div>
        </div>
        
        <div class="sixteen columns row portfolio_filter">
        	<ul>
                <li><a class="portfolio_selector" data-group="all-group" href="#">All Projects</a></li>
                <li><a class="portfolio_selector" data-group="web-group" href="#">Web Design</a></li>
                <li><a class="portfolio_selector" data-group="photoshop-group" href="#">Photoshop</a></li>
                <li><a class="portfolio_selector" data-group="concepts-group" href="#">Concepts</a></li>
                <li><a class="portfolio_selector" data-group="print-group" href="#">Print Design</a></li>
            </ul>
        </div><div class="clear"></div>
        
		<div class="sixteen columns row teasers portfolio">
        
        	<div class="four columns teaser all-group web-group">
               <a href="#" data-text="" class="hovering"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/home_teaser1.jpg" alt="" class="scale-with-grid" /></a>
			   <div class="topline"><a href="#">Element</a></div>
			   <div class="subline"><a href="#">Web Design</a></div>
            </div>
			<div class="four columns teaser all-group photoshop-group">
                <a href="#" data-text="" class="hovering"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/home_teaser2.jpg" alt="" class="scale-with-grid" /></a>
				<div class="topline"><a href="#">Colors</a></div>
				<div class="subline"><a href="#">Photoshop</a></div>
            </div>
			<div class="four columns teaser all-group concepts-group">
                <a href="#" data-text="" class="hovering"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/home_teaser3.jpg" alt="" class="scale-with-grid" /></a>
				<div class="topline"><a href="#">Vision</a></div>
				<div class="subline"><a href="#">Conception</a></div>
            </div>
            <div class="four columns teaser all-group print-group">
            	<a href="#" data-text="" class="hovering"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/home_teaser4.jpg" alt="" class="scale-with-grid" /></a>
				<div class="topline"><a href="#">Wolf</a></div>
				<div class="subline"><a href="#">Miscellaneous</a></div>
            </div>
            <div class="four columns teaser all-group web-group">
               <a href="#" data-text="" class="hovering"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/home_teaser5.jpg" alt="" class="scale-with-grid" /></a>
			   <div class="topline"><a href="#">Zebra</a></div>
			   <div class="subline"><a href="#">Web Design</a></div>
            </div>
			<div class="four columns teaser all-group photoshop-group">
                <a href="#" data-text="" class="hovering"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/home_teaser6.jpg" alt="" class="scale-with-grid" /></a>
				<div class="topline"><a href="#">Rainy</a></div>
				<div class="subline"><a href="#">Photoshop</a></div>
            </div>
			<div class="four columns teaser all-group concepts-group">
                <a href="#" data-text="" class="hovering"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/home_teaser7.jpg" alt="" class="scale-with-grid" /></a>
				<div class="topline"><a href="#">Andaur Studios</a></div>
				<div class="subline"><a href="#">Conception</a></div>
            </div>
            <div class="four columns teaser all-group print-group">
            	<a href="#" data-text="" class="hovering"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/home_teaser8.jpg" alt="" class="scale-with-grid" /></a>
				<div class="topline"><a href="#">Purple Dreams</a></div>
				<div class="subline"><a href="#">Miscellaneous</a></div>
            </div>

			<div class="clear"></div>
		</div><div class="clear"></div> 
        
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