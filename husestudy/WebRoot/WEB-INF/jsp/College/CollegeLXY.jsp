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
    <title>理学院|Welcome</title>
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
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo/LXY_logo.jpg" type="image/x-icon"/>
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

       <%--  <div class="four columns sidebar offset-by-one textblocksidebar">
            
            <div class="widget">
                <h5>BROCHURE DOWNLOAD</h5>
                <div class="pdfdownload">   
                    <a href="#" class="link"><img src="${pageContext.request.contextPath}/FrontPage/images/icons/pdf.png" class="left" alt="" />
                    <p>Dowload our 2012 Company Brochure in PDF Format</p></a>
                </div>
                <div class="clear"></div>
            </div>

            <div class="clear"></div>
        </div> --%>

        <!-- Portfolio Teasers
        ================================================== -->
        
        <div class="sixteen columns row divide">
            <h3 class="titledivider">最新作品展示</h3>
            <div class="rightlink"><a href="#" class="titlelink"><span style="font-size:13px;">&rarr;</span> 查看更多</a></div>
            <div class="dividerline"></div>
        </div>
<!-- AJAX请求POST：根据专业的编号进行请求响应的所属学生的作品数据 -->
        <div class="sixteen columns row portfolio_filter">
            <ul>
              <s:iterator var="m" value="majors" status="status">
                <li>
                    <%--  <input type="text" id="mid<s:property value="#m.mid"/>" name="mid" value="<s:property value="#m.mid"/>"/> --%>
                     <%-- <button onclick="one_mid<s:property value="#m.mid"/>()"> --%>
                         <a class="portfolio_selector" data-group="all-group"><s:property value="#m.mname"/></a>
                     <!-- </button> -->
                     <script type="text/javascript">
                /* 此时的JS代码不能放在外面，只能放在s:iterator标签里面 */
                        /* var one_mid;
                        function one_mid<s:property value="#m.mid"/>(){
                            one_mid = document.getElementById("mid<s:property value="#m.mid"/>");
                            alert(one_mid.value);
                        } */
                        //JavaScript-ajax进行
                        function one_mid<s:property value="#m.mid"/>(){
                            //1.创建异步交互的对象：
                            var xhr = createXmlHttp();
                            //2.设置监听：
                            xhr.onreadystatechange = function(){
                                if(xhr.readyState == 4){
                                    if(xhr.status == 200){
                                        alert("success<s:property value='worksSetMid.size'/>");
                                        //如何成功了，将拼接div，再接着将数据格式转换为HTML    "<div ><h2>"+<s:property value="#m.mid"/>+"</h2></div>";
                                        
                                        document.getElementById("worksShowBlock").innerHTML = 
                                            "<s:iterator var='works' value='worksSetMid' status='status'>"+
                                            "<div id='mid_ID' class='four columns teaser all-group web-group'>"+
                                               "<a href='${ pageContext.request.contextPath }/works_detials.action?wid=<s:property value='#works.wid'/>' data-text="" class='hovering'>"+
                                                   "<img style='width:100%;height:90px;' src='${pageContext.request.contextPath}/<s:property value='#works.wimage'/>' alt='图片跑丢了' class='scale-with-grid' />"+
                                               "</a>"+
                                               "<div class='topline'>"+
                                                 "<a style='padding-left:10px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;' href='${ pageContext.request.contextPath }/works_detials.action?wid=<s:property value='#works.wid'/>'><s:property value='#works.wname'/></a>"+
                                               "</div>"+
                                                "<div style='width:200px;display:block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;padding-left:10px;color:grey;'><s:property value='#works.wcontent'/>" +
                                                  "</div>" +
                                              "</div>" +
                                              "</s:iterator>" + 
                                            "<div class='clear'></div>";
                                     
                                 /* "<s:iterator var='works' value='worksSetmid' status='status'>"+
                                        "<div id='mid_ID' class='four columns teaser all-group web-group'>"+
                                           "<a href='${ pageContext.request.contextPath }/works_detials.action?wid=<s:property value='#works.wid'/>' data-text="" class='hovering'>"+
                                              "<img style='width:100%;height:90px;' src='${pageContext.request.contextPath}/<s:property value='#works.wimage'/>' alt='图片跑丢了' class='scale-with-grid' />"+
                                           "</a>"+
                                           "<div class='topline'>"+
                                              "<a style='padding-left:10px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;' href='${ pageContext.request.contextPath }/works_detials.action?wid=<s:property value='#works.wid'/>'><s:property value='#works.wname'/></a>"+
                                           "</div>"+
                                           "<div style='width:200px;display:block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;padding-left:10px;color:grey;'><s:property value='#works.wcontent'/>" +
                                           "</div>" +
                                        "</div>" +
                                    "</s:iterator>" + 
                                    "<div class='clear'></div>"; */
                                    }
                                }
                            }
                            //3.打开连接：
                            xhr.open("POST","${pageContext.request.contextPath}/college_findWorksByMid.action?mid="+<s:property value="#m.mid"/>,true);
                            //4.发送：
                            xhr.send(<s:property value="#m.mid"/>);
                        }
                        //创建异步交互的对象：
                        function createXmlHttp(){
                            var xmlHttp;
                            try{ // Firefox, Opera 8.0+, Safari
                                xmlHttp = new XMLHttpRequest();
                            }catch(e){
                                try{// Internet Explorer
                                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                                }catch(e){
                                    try{
                                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                                    }catch(e){}
                                };
                            }
                            return xmlHttp;
                        };
                     </script>
                </li>
              </s:iterator>
            </ul>
        </div>
        <div class="clear"></div>
       
        <!-- 作品信息展示： 使用AJAX进行HTML的拼接-->
        <div id="worksShowBlock" class="sixteen columns row teasers portfolio">
        <s:iterator var="works" value="worksSet" status="status">
            <div id="mid_ID" class="four columns teaser all-group web-group">
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

        
       <%-- <table style="text-align:center;">
            <tr>
                <th>作品编码</th><th>作品内容</th><th>提交时间</th><th>提交用户</th>
            </tr>
            <s:iterator var="w" value="worksList" status ="status">
            <tr>
                <td style="width:20%;"><s:property value="#w.wid"/></td>
                <td style="width:20%; text-align:left;">
                <p style=" overflow:hidden;white-space:nowrap; text-overflow:ellipsis;">
                    <s:property value="#w.wcontent"/></p>
                </td>
                <td style="width:20%;"><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#w.wdate})}"/></td>
                <td style="width:20%;"><s:property value="#w.user.username"/></td>
            </tr>
            </s:iterator>
        </table>
        <div class="clear"></div> --%> 
        
        
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