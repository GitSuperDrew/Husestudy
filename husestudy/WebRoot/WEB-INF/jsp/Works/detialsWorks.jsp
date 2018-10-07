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
    <title>作品详情展示</title>
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
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,400italic,700,700italic,300,300italic' rel='stylesheet' type='text/css'>
    
    <!-- Scripts
    ================================================== -->
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/FrontPage/js/jquery-1.7.min.js" ></script>
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
      
        
        <!-- No Slider Spacer
        ================================================== -->
        
        <div class="sixteen columns nosliderspacer"></div>
        
        <!-- Content Holder -->
        <div class="eleven columns row textblock left blogsingle">
        
            <!-- Blogpost -->
            <div class="blogpost row">
                <div class="blogdate">
                    <div class="month"><s:property value="%{getText('{0,date,MM}',{model.wdate})}" /></div>
                    <div class="day"><s:property value="%{getText('{0,date,dd}',{model.wdate})}" /></div>                    
                    <div class="year"><s:property value="%{getText('{0,date,HH:mm:ss}',{model.wdate})}" /></div>  <!-- 格式：按照年份的CSS样式 -->
                    <div class="year"><s:property value="%{getText('{0,date,yyyy}',{model.wdate})}" /></div>
                    <div class="month"><button onclick="git()" id="git">收藏</button><span id="gitSuccess"></span></div>
                </div>
                <script type="text/javascript">
                
                function git(){
                    //1.创建异步交互的对象：
                    var xhr = createXmlHttp();
                    //2.设置监听：
                    xhr.onreadystatechange = function(){
                        if(xhr.readyState == 4){
                            if(xhr.status == 200){
                                document.getElementById("gitSuccess").innerHTML = "<font style='color:red;'>Git-Success</font>";
                                document.getElementById("git").setAttribute("disabled", true);//注意：bug--刷新又可以收藏，JS文件位置，或者在action中处理hashset
                            }
                        }
                    };
                    //3.打开连接：
                   xhr.open("GET","${pageContext.request.contextPath}/git_save.action?time="+new Date().getTime()+"&wid="+<s:property value="model.wid"/>+"&uid="+<s:property value="#session.detialsWork.user.uid"/>,true);
                    //4.发送：
                    xhr.send(null);
                    //alert("git");
               	}
              //创建异步交互的对象
                function createXmlHttp(){
                    var xmlHttp;
                    try{ // Firefox, Opera 8.0+, Safari
                        xmlHttp = new XMLHttpRequest();
                    }
                    catch(e){
                        try{// Internet Explorer
                            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                        }catch(e){
                            try{
                                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                            }catch(e){}
                        }
                    }
                    return xmlHttp;
                }
                </script>
                <div class="postholder">
                    <div class="blogtitle"><h4><a href="#"><s:property value="model.wname"/></a></h4></div>
                    <div class="postinfo">
                        <span class="dateinfo"></span>in <a href="#">Husestudy News</a>, <a href="#">Presentations</a>
                         · by <s:property value="#session.detialsWork.user.username"/>
                         · <a href="#">
                           <s:if test="countWid != null"><s:property value="countWid"/> Comments</s:if>
                           <s:else>0 Comments</s:else>
                           </a>
                    </div>
                    <div class="blogimage">
                            <a href="${pageContext.request.contextPath}/works_detials.action?wid=<s:property value="model.wid"/>" data-text="" class="hovering">
                                <img style="width:100%;height:100%;" src="${pageContext.request.contextPath}/<s:property value="model.wimage"/>" alt="图片找不到了..." class="scale-with-grid" />
                            </a>
                        
                    </div>
                    <div class="postbody">
                        <div class="postcontent">
                   <!-- 文章的详细介绍页面： -->
                        <p id="contentWorks">
                            <s:property value="model.wcontent"/>
                        </p>
                            <!-- 3 column -->
                     <!--  <div class="one_third">
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.</p> 
                            </div>
                            <div class="one_third">
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.</p>     
                            </div>
                            <div class="one_third lastcolumn">
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.</p>     
                            </div><div class="clear"></div> -->
                            
                            <!-- Quotes -->
                    <!--    <div class="one_half">
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.</p>
                            </div>
                            <div class="one_half lastcolumn">
                                <ul class="square">
                                    <li>Flexible Layout</li>
                                    <li>Compatible with Common Browsers, Smartphones and Tablet Pc's</li>
                                    <li>Background Images / Tiles</li>
                                </ul>
                            </div><div class="clear"></div> -->
                    
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div> 
            <!-- Post Comments -->         
            <%@ include file="../Discuss/discussArea.jsp" %>
            
            
            <!-- Comment Form -->
            <%@ include file="../Discuss/addDiscuss.jsp" %>
            
        </div>
        
        <!-- Sidebar
        ================================================== -->

        <div class="four columns sidebar offset-by-one textblocksidebar">
        
            <div class="widget">
                <h5>BROCHURE DOWNLOAD</h5>
                <div class="pdfdownload">
                    <a href="#" class="link"><img src="${pageContext.request.contextPath}/FrontPage/images/icons/pdf.png" class="left" alt="" />
                        <p>Dowload our 2012 Company Brochure in PDF Format</p>
                    </a>
                </div>
                <div class="clear"></div>
            </div>
            
            <div class="widget">
                <h5>Blog Categories</h5>
                <div class="widget_categories">
                    <ul>
                        <li><a href="#" class="link"><span class="arr">&rarr;</span> Company News</a></li>
                        <li><a href="#" class="link"><span class="arr">&rarr;</span> Presentations</a></li>
                        <li><a href="#" class="link"><span class="arr">&rarr;</span> Announcements</a></li>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            
            <div class="widget">
                <h5><%-- <s:property value="#session.detialsWork.user.username"/> --%>最新作品</h5>
                <div class="widget_portfolio">
                    <ul>
                        <s:iterator var="w" value="sixWorks">
                        <li class="clearfix">
                          <a href="${pageContext.request.contextPath}/works_detials.action?wid=<s:property value='#w.wid'/>" class="borderhover">
                              <img src="${ pageContext.request.contextPath }/<s:property value='#w.wimage'/>" alt="LOSING" title="<s:property value='#w.wname'/>"/>
                          </a>
                        </li>
                        </s:iterator>
                        <%-- <li class="clearfix"><a href="#" class="borderhover"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/pop_folio2.jpg" alt="" /></a></li>
                        <li class="clearfix"><a href="#" class="borderhover"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/pop_folio3.jpg" alt="" /></a></li>
                        <li class="clearfix"><a href="#" class="borderhover"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/pop_folio4.jpg" alt="" /></a></li>
                        <li class="clearfix"><a href="#" class="borderhover"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/pop_folio5.jpg" alt="" /></a></li>
                        <li class="clearfix"><a href="#" class="borderhover"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/pop_folio6.jpg" alt="" /></a></li> 
                        --%>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            
            <div class="four columns widget">
                <h5>Contact Info</h5>
                <s:iterator var="info" value="contact_InfoList">
                <div class="widget_text">
                    <span class="lighti">Coordinate Position</span><br/>
                        <s:property value="#info.addr" /><br />
                        <s:property value="#info.address"/><br/>
                        <s:property value="#info.school"/><br/>
                    <br/>
                    
                    <span class="lighti">How To Contact Us</span><br/>
                    Email: <a href="<s:property value="#info.emailwebsite"/>" target="_blank" class="linkbg"><s:property value="#info.email"/></a><br/>
                    Phone: <s:property value="#info.phone"/><br/><br/>
                    
                    <span class="lighti">Office Hours</span><br/>
                    <s:property value="#info.whour"/><br/>
                    <s:property value="#info.weekend"/>
                </div>
                </s:iterator>
            </div>
            
            <div class="widget">
                <h5>Popular Works</h5>
                <div class="widget_blogposts">
                    <ul>
                    <s:iterator var="wsix" value="worksListHot">
                        <li class="clearfix">
                            <a href="${pageContext.request.contextPath}/works_detials.action?wid=<s:property value='#wsix.wid'/>" class="borderhover">
                                <img style="width:35px;height:35px;" src="${pageContext.request.contextPath}/<s:property value="#wsix.wimage"/>" alt="LOSING" />
                            </a>
                            <div class="postlink" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;display:-webkit-box;-webkit-box-orient:vertical;">
                               <a href="${pageContext.request.contextPath}/works_detials.action?wid=<s:property value='#wsix.wid'/>"><s:property value="#wsix.wname"/></a>
                            </div>
                            <div class="subline"><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#wsix.wdate})}" /></div>
                        </li>
                    </s:iterator>
                        <%-- <li class="clearfix">
                            <a href="#" class="borderhover"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/pop_blog2.jpg" alt="" /></a>
                            <div class="postlink"><a href="#">Convenient Structure</a></div>
                            <div class="subline">January 21, 2012</div>
                        </li>
                        <li class="clearfix">
                            <a href="#" class="borderhover"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/pop_blog3.jpg" alt="" /></a>
                            <div class="postlink"><a href="#">Another Blog Post</a></div>
                            <div class="subline">January 17, 2012</div>
                        </li>
                        <li class="clearfix">
                            <a href="#" class="borderhover"><img src="${pageContext.request.contextPath}/FrontPage/images/thumbs/pop_blog4.jpg" alt="" /></a>
                            <div class="postlink"><a href="#">Responsive Layout</a></div>
                            <div class="subline">January 3, 2012</div>
                        </li> --%>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            
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

