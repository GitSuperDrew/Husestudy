<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/admin/assets/styles.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/admin/assets/DT_bootstrap.css" rel="stylesheet" media="screen">

<script src="${pageContext.request.contextPath}/admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title><s:property value="#session.existUser.name"/>个人首页</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">

    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/skeleton.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/screen.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/mediaelementplayer.css" />
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/bootstrap.min.css" /> --%>

    <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/FrontPage/images/favicon.ico">
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/FrontPage/images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/FrontPage/images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/FrontPage/images/apple-touch-icon-114x114.png">
    <!-- 学校Logo -->
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo/HomeLogo.jpg" type="image/x-icon"/>
    
    <!-- Fonts
    ================================================== -->
<!--     <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,400italic,700,700italic,300,300italic' rel='stylesheet' type='text/css'> -->
    
    <!-- Scripts
    ================================================== -->
    <%-- <script src="${pageContext.request.contextPath}/FrontPage/js/jquery-3.3.1.js" type="text/javascript"></script> --%>
    <script src="${pageContext.request.contextPath}/FrontPage/js/jquery-1.7.min.js" type="text/javascript"></script>
    <%-- <script src="${ pageContext.request.contextPath }/admin/vendors/jquery-1.9.1.js"></script> --%>
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
    <!--div class="tiledbackground"></div-->
    <img src="${pageContext.request.contextPath}/FrontPage/images/bg.jpg" alt="" id="background" />
    <!-- Change to class="poswrapper wide" and class="whitebackground full" for a full-width site background -->
    <div class="poswrapper"><div class="whitebackground"></div></div>

    <div class="container main portfolio4column">
    
        <!-- Header | Logo, Menu
        ================================================== -->
    <%@ include file="../Home/HomeTop.jsp" %>
        <div class="sixteen columns nosliderspacer"></div>
    <!-- 分页显示所有的评论数据 -->
    <hr/>
        <div class="row-fluid">
            <!-- block -->
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">Pagination shows your collection</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                            <thead>
                                <tr>
                                    <th>收藏编号</th>
                                    <th>收藏时间</th>
                                    <th>收藏内容</th>
                                    <th>内容作者</th>
                                    <th>收藏者</th>
                                    <th>删除</th>
                                </tr>
                            </thead>
                            <tbody>
                            <s:iterator var="gitByUid" value = "pageBean.list" status="status">
                                <tr class="odd gradeX">
                                       <td><s:property value="#gitByUid.gid"/></td>
                                       <td><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#gitByUid.gdate})}"/></td>
                                       <td><a href="${pageContext.request.contextPath}/works_detials.action?wid=<s:property value="#gitByUid.works.wid"/>"><s:property value="#gitByUid.works.wname"/></a></td>
                                       <td><a href="${pageContext.request.contextPath}/works_findAllWorksFromGitUid.action?uid=<s:property value="#gitByUid.works.user.uid"/>"><s:property value="#gitByUid.works.user.username"/></a></td>
                                       <td><s:property value="#gitByUid.user.username"/></td>
                                       <td><a href="${ pageContext.request.contextPath }/git_delete.action?gid=<s:property value="#gitByUid.gid"/>" onclick="return confirm('确定要删除吗？')">
                                            <img src="${pageContext.request.contextPath}/admin/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
                                           </a>
                                       </td>
                                </tr>
                            </s:iterator>    
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /block -->
        </div>
        
        <!-- Content Holder --> 
        <div class="sixteen columns row textblock fullblog sideview">
            
            <div class="blogpages">
            <ul>
                 <s:if test="#gitByUid.gid != null">
                    第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页
                    <s:if test="pageBean.page != 1">
                        <a href="${ pageContext.request.contextPath }/git_findByUid.action?gid=<s:property value="#gitByUid.did"/>&page=1" class="firstPage">&nbsp;</a>
                        <a href="${ pageContext.request.contextPath }/git_findByUid.action?gid=<s:property value="#gitByUid.did"/>&page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>
                    </s:if>
                    
                    <s:iterator var="i" begin="1" end="pageBean.totalPage">
                        <s:if test="pageBean.page != #i">
                            <a href="${ pageContext.request.contextPath }/git_findByUid.action?gid=<s:property value="#gitByUid.gid"/>&page=<s:property value="#i"/>"><s:property value="#i"/></a>
                        </s:if>
                        <s:else>
                            <span class="currentPage"><s:property value="#i"/></span>
                        </s:else>
                    </s:iterator>
                    
                    <s:if test="pageBean.page != pageBean.totalPage">    
                        <a class="nextPage" href="${ pageContext.request.contextPath }/git_findByUid.action?gid=<s:property value="#gitByUid.gid"/>&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
                        <a class="lastPage" href="${ pageContext.request.contextPath }/git_findByUid.action?gid=<s:property value="#gitByUid.gid"/>&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
                    </s:if>
                </s:if>    
            </ul>
            
            <div class="clear"></div>
         </div>
            <div class="clear"></div>
            
            <!-- Pagination -->
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

<script src="${ pageContext.request.contextPath }/admin/bootstrap/js/bootstrap.min.js"></script>
<script src="${ pageContext.request.contextPath }/admin/vendors/datatables/js/jquery.dataTables.min.js"></script>

<script src="${ pageContext.request.contextPath }/admin/assets/scripts.js"></script>
<script src="${ pageContext.request.contextPath }/admin/assets/DT_bootstrap.js"></script>
</body>
</html>
