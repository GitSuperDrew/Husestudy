<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->

<head>
<!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="${pageContext.request.contextPath}/admin/assets/styles.css" rel="stylesheet" media="screen">
        <link href="${pageContext.request.contextPath}/admin/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/vendors/flot/excanvas.min.js"></script><![endif]-->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="${pageContext.request.contextPath}/admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title><s:property value="#session.existUser.name"/>个人首页</title>
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
    <%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/FrontPage/images/favicon.ico">
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/FrontPage/images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/FrontPage/images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/FrontPage/images/apple-touch-icon-114x114.png">
     --%>
    <!-- 学校Logo -->
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo/HomeLogo.jpg" type="image/x-icon"/>
    
    <!-- Fonts
    ================================================== -->
<!--     <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,400italic,700,700italic,300,300italic' rel='stylesheet' type='text/css'> -->
    
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
    <!-- 模态框：弹框 -->
    <script src="${pageContext.request.contextPath}/FrontPage/js/modal.js" type="text/javascript"></script>
    
    <!-- video.js -->
    <%-- <script src="${pageContext.request.contextPath}/FrontPage/js/modernizr.min.js" type="text/javascript"></script> --%>
	<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/FrontPage/css/normalize.css" /> --%><!--CSS RESET-->
	<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/FrontPage/css/htmleaf-demo.css"> --%><!--演示页面样式，使用时可以不引用-->
	<!-- <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> -->
	<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/style.css">  --%>
</head>

<body>

    <!-- Site Backgrounds
    ================================================== -->
    
    <!-- Change to class="poswrapheaderline wide" and class="headerline full" for a full-width header line -->
    <div class="poswrapheaderline"><div class="headerline"></div></div>  
    <!-- Remove or uncomment depending on if you want a background image or tile -->
    <!--div class="tiledbackground"></div-->
    <img src="${pageContext.request.contextPath}/FrontPage/images/bg.jpg" alt="" id="background" />
    <!-- Change to class="poswrapper wide" and class="whitebackground full" for a full-width site background -->
    <div class="poswrapper"><div class="whitebackground"></div></div>

    <div class="container main portfolio4column">
    
        <!-- Header | Logo, Menu
        ================================================== -->
    <%@ include file="../Home/HomeTop.jsp" %>
        
        <!-- Page Title And Social
        ================================================== -->
        
        <!-- No Slider Spacer
        ================================================== -->
        <div class="sixteen columns nosliderspacer"></div>
        
        <!-- Content Holder --> 
        <div class="sixteen columns row textblock fullblog sideview">
        
        <!-- <s:property value="#wu.wdate"/> -->
        
            <!-- Blogpost -->
           <s:iterator var="wu" value = "pageBean.list">
            <div class="blogpost row">
                <div class="blogdate">
                    <div class="month"><s:property value="%{getText('{0,date,MM}',{#wu.wdate})}" /></div>
                    <div class="day"> <s:property value="%{getText('{0,date,dd}',{#wu.wdate})}" /> </div>
                    <div class="year"><s:property value="%{getText('{0,date,yyyy}',{#wu.wdate})}" /></div>
                    <div class="year"><s:property value="%{getText('{0,date,HH:mm:ss}',{#wu.wdate})}" /></div>  <!-- 格式：按照年份的CSS样式 -->
                </div>
                <div class="blogimage">
                
                <!-- 对（图片）进行判断有无 -->
                <s:if test="#wu.wimage == null">
                    <a href="${pageContext.request.contextPath}/works_detials.action?wid=<s:property value="#wu.wid"/>" data-text="" class="hovering">
                        <img src="${pageContext.request.contextPath}/works/blogpost1.jpg" alt="" class="scale-with-grid" />
                    </a>
                </s:if>
                <s:else>
                    <a href="${pageContext.request.contextPath}/works_detials.action?wid=<s:property value="#wu.wid"/>" data-text="" class="hovering">
                        <img style="width:100%;height:200px;" src="${ pageContext.request.contextPath }/<s:property value="#wu.wimage"/>" alt="" class="scale-with-grid" />
                    </a>
                </s:else>
                <!-- 对（视频）判断有无 ^^^单点视频上传！-->
               </div>
                
                <div class="blogtitle"><h4><a href="#"><s:property value="#wu.wname"/></a></h4></div>
                <div class="postinfo">
                    <span class="dateinfo"> </span>in <a href="#">Husestudy News</a>, <a href="#">Presentations</a>
                     · by <s:property value="#wu.user.username"/>
                     <%-- <s:property value="#session.existUser.name"/> --%>
                </div> 
                <div class="postbody">
                    <div class="postcontent">
                        <div id="contentdiv<s:property value="#wu.wid"/>" style="width: 300px; height:80px;overflow:hidden;display: -webkit-box; -webkit-box-orient: vertical;-webkit-line-clamp: 3;">
                              <s:property value="#wu.wcontent"/>
                        </div>
                        <script type="text/javascript">
                        function testContentdiv<s:property value="#wu.wid"/>(){
                        	document.getElementById("contentdiv<s:property value="#wu.wid"/>").innerHTML = "<s:property value='#wu.wcontent'/>";
                        }
                        testContentdiv<s:property value="#wu.wid"/>();
                        </script>
                        <br/>
                        <a href="${ pageContext.request.contextPath }/works_detials.action?wid=<s:property value="#wu.wid"/>" class="button">详情</a>
                        <s:if test="#session.existUser.uid != null">
                        <s:if test="#session.existUser.uid == #wu.user.uid">
                            <a href="${ pageContext.request.contextPath }/works_edit.action?wid=<s:property value="#wu.wid"/>" class="button">编辑</a>
                            <a href="${ pageContext.request.contextPath }/works_delete.action?wid=<s:property value="#wu.wid"/>" class="button" onclick="return confirm('确定要删除吗？')">删除</a>
                            <a href="${ pageContext.request.contextPath }/works_addPage.action" class="button">作品添加</a>
                        </s:if>
                        </s:if>
                        <%-- <a href="${ pageContext.request.contextPath }/works_countWorks.action" class="button">显示作品总数量</a>
                       num:<s:property value="#session.countWorks"/> --%>

                    </div>
                    
                </div><div class="clear"></div>
            </div> 
            </s:iterator>
            
            <div class="blogpages">
            <ul>
                 <s:if test="#wu.wid != null">
                    第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页
                    <s:if test="pageBean.page != 1">
                        <a href="${ pageContext.request.contextPath }/works_findAllWorksByUsername.action?wid=<s:property value="#wu.wid"/>&page=1" class="firstPage">&nbsp;</a>
                        <a href="${ pageContext.request.contextPath }/works_findAllWorksByUsername.action?wid=<s:property value="#wu.wid"/>&page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>
                    </s:if>
                    
                    <s:iterator var="i" begin="1" end="pageBean.totalPage">
                        <s:if test="pageBean.page != #i">
                            <a href="${ pageContext.request.contextPath }/works_findAllWorksByUsername.action?wid=<s:property value="#wu.wid"/>&page=<s:property value="#i"/>"><s:property value="#i"/></a>
                        </s:if>
                        <s:else>
                            <span class="currentPage"><s:property value="#i"/></span>
                        </s:else>
                    </s:iterator>
                    
                    <s:if test="pageBean.page != pageBean.totalPage">    
                        <a class="nextPage" href="${ pageContext.request.contextPath }/works_findAllWorksByUsername.action?wid=<s:property value="#wu.wid"/>&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
                        <a class="lastPage" href="${ pageContext.request.contextPath }/works_findAllWorksByUsername.action?wid=<s:property value="#wu.wid"/>&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
                    </s:if>
                </s:if>    
            </ul>
            
            
            <div class="clear"></div>
         </div>
            
            
            <!-- Pagination -->
                    
            <!-- <div class="blogpages">
                <ul>
                    <li><a href="#" class="selected">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                </ul>
                <div class="clear"></div>
            </div> -->
            
            <div class="clear"></div>
        </div>
        
        <!-- Space Adjuster
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
