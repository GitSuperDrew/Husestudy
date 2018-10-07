<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE html>
<head>
    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>下载中心-湘科院</title>
    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    
    <script src="${pageContext.request.contextPath}/FrontPage/js/jquery-1.7.min.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/admin/assets/styles.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/admin/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
    
    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/skeleton.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/screen.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/mediaelementplayer.css" />

    <!-- Favicons
    ================================================== -->
    <!-- 学校Logo -->
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo/HomeLogo.jpg" type="image/x-icon"/>
    <!-- 模态框：弹框 -->
    <script src="${pageContext.request.contextPath}/FrontPage/js/modal.js" type="text/javascript"></script>
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
        <%@ include file="../Home/HomeTop.jsp" %>
        
        <!-- 下载中心 :每个学院的作品全部展示在下面：文件中心【文件的上传和下载】-->
        <!-- Portfolio Teasers
        ================================================== -->
        <div class="sixteen columns row divide">
            <h3 class="titledivider">文件中心</h3>
            <div class="rightlink"><a href="#" class="titlelink"><span style="font-size:13px;">&rarr;</span> See Whole Portfolio</a></div>
            <div class="dividerline"></div>
        </div>
       <hr/>
       <!-- 分页显示所有的评论数据 -->
        <div class="row-fluid">
            <!-- block -->
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">You can download it at any time</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                            <thead>
                            <s:if test="#session.existUser != null">
                                <tr align="center"><td colspan="5"><button data-toggle="modal" data-target="#myModalFile" style="width:100%;">上传文件<span id="sendError"></span></button></td></tr>
                            </s:if>
                                <tr>
                                    <th>文件名字</th>
                                    <th>上传时间</th>
                                    <th>更新时间</th>
                                    <th>上传用户</th>
                                    <th>下载</th>
                                </tr>
                            </thead>
                             <!-- 模态框（Modal） -->
<div class="modal fade" id="myModalFile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    请选择本地文件
                </h4>
                <span id="successSendMsg"></span>
                <p><strong><s:fielderror/></strong></p>
            </div>
            <form action="${pageContext.request.contextPath}/husefile_save.action" method="post" id="formFile" enctype="multipart/form-data" onsubmit="return isFile();">
               <div class="modal-body">
                  上传文件：<input type="file" name="upload" id="husefile" accept=""/><!-- 没有限定文件的上传类型，只能上传单个文件，后期进行优化上传文件（同时也得注意数据|系统安全问题）。 -->
               <script type="text/javascript">
               function isFile(){
                   var husefile = document.getElementById("husefile").value.length;
                   if(husefile == 0){
                       alert("请选择文件");
                       return false;
                   }
                   return true;
               }
               </script>
               <div class="modal-footer">
                   <button data-dismiss="modal">关闭</button>
                   <input type="reset" value="重置">
                   <button>提交文件</button>
               </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
                            <tbody>
                            <s:iterator var="file" value = "pageBean.list" status="status">
                                <tr class="odd gradeX">
                                       <td><s:property value="#file.file_name"/></td>
                                       <td><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#file.file_date})}"/></td>
                                       <td><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#file.update_time})}"/></td>
                                       <td><s:property value="#file.user.username"/></td>
                                       <td><a href="${pageContext.request.contextPath}/husefile_download.action?docName=<s:property value="#file.file_name"/>">
                                           <img src="${pageContext.request.contextPath}/FrontPage/images/icons/down.png" title="点击立马下载" alt="图片丢失了" />
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
                 <s:if test="#file.file_id != null">
                    第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页
                    <s:if test="pageBean.page != 1">
                        <a href="${ pageContext.request.contextPath }/husefile_fileListCenter.action?file_id=<s:property value="#file.file_id"/>&page=1" class="firstPage">&nbsp;</a>
                        <a href="${ pageContext.request.contextPath }/husefile_fileListCenter.action?file_id=<s:property value="#file.file_id"/>&page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>
                    </s:if>
                    
                    <s:iterator var="i" begin="1" end="pageBean.totalPage">
                        <s:if test="pageBean.page != #i">
                            <a href="${ pageContext.request.contextPath }/husefile_fileListCenter.action?file_id=<s:property value="#file.file_id"/>&page=<s:property value="#i"/>"><s:property value="#i"/></a>
                        </s:if>
                        <s:else>
                            <span class="currentPage"><s:property value="#i"/></span>
                        </s:else>
                    </s:iterator>
                    
                    <s:if test="pageBean.page != pageBean.totalPage">
                        <a class="nextPage" href="${ pageContext.request.contextPath }/husefile_fileListCenter.action?file_id=<s:property value="#file.file_id"/>&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
                        <a class="lastPage" href="${ pageContext.request.contextPath }/husefile_fileListCenter.action?file_id=<s:property value="#file.file_id"/>&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
                    </s:if>
                </s:if>    
            </ul>
            <div class="clear"></div>
          </div>
          <div class="clear"></div>
        </div>
      
        
        <!-- Clients 学院专业
        ================================================== -->
        <%@ include file="../Home/HomeCollege.jsp" %>
        
        <!-- Bottom Padding Adjust
        ================================================== --> 
        <div class="sixteen columns bottomadjust"></div>
    </div>
<!-- container -->

    <!-- Footer
    ================================================== -->
    <%@ include file="../Home/HomeFooter.jsp" %>
    <%@ include file="../Home/HomeBottom.jsp" %>
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


<script src="${ pageContext.request.contextPath }/admin/bootstrap/js/bootstrap.min.js"></script>
<script src="${ pageContext.request.contextPath }/admin/vendors/datatables/js/jquery.dataTables.min.js"></script>

<script src="${ pageContext.request.contextPath }/admin/assets/scripts.js"></script>
<script src="${ pageContext.request.contextPath }/admin/assets/DT_bootstrap.js"></script>
</body>
</html>