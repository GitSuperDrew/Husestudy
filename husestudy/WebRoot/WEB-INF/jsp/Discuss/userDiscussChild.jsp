<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
    <script src="${ pageContext.request.contextPath }/admin/vendors/jquery-1.9.1.js"></script>
<%-- <script src="${pageContext.request.contextPath}/FrontPage/js/jquery-3.3.1.js" type="text/javascript"></script> --%>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/admin/assets/styles.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/admin/assets/DT_bootstrap.css" rel="stylesheet" media="screen">

<script src="${pageContext.request.contextPath}/admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script> 
    
  </head>
  
  <body>
  <hr/>
            <div class="row-fluid">
            <!-- block -->
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">NEXT---展示所有用户的评论</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                            <thead>
                                <tr>
                                    <th>评论内容</th>
                                    <th>评论时间</th>
                                    <th>好评</th>
                                    <th>差评</th>
                                    <th>作品名称</th>
                                    <th>用户名称</th>
                                </tr>
                            </thead>
                            <tbody>
                            <s:iterator var="DsByUid" value = "discusses">
                                <tr class="odd gradeX">
                                       <td><s:property value="#DsByUid.dcontent"/></td>
                                       <td><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#DsByUid.ddate})}"/></td>
                                       <td><s:property value="#DsByUid.good"/></td>
                                       <td><s:property value="#DsByUid.bad"/></td>
                                       <td><s:property value="#DsByUid.works.wname"/></td>
                                       <td><s:property value="#DsByUid.user.username"/></td>
                                </tr>
                            </s:iterator>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /block -->
        </div>

<script src="${ pageContext.request.contextPath }/admin/bootstrap/js/bootstrap.min.js"></script>
<script src="${ pageContext.request.contextPath }/admin/vendors/datatables/js/jquery.dataTables.min.js"></script>

<script src="${ pageContext.request.contextPath }/admin/assets/scripts.js"></script>
<script src="${ pageContext.request.contextPath }/admin/assets/DT_bootstrap.js"></script>
  </body>
</html>
