<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE HTML >
<html>
  <head>
    
    <title></title>
  </head>
  
  <body>
		<div class="homeslider row">        
            <div class="flexslider clearfix">
               <%--  <ul class="slides">
                    <li><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/FrontPage/images/banner/banner1.jpg" alt="" /></a><div class="flex-caption"><strong></strong><a href="#" target="_blank"></a></div></li>
                    <li><img src="${pageContext.request.contextPath}/FrontPage/images/banner/banner2.jpg" alt="" /></li>
                    <li><img src="${pageContext.request.contextPath}/FrontPage/images/banner/banner3.jpg" alt="" /><div class="flex-caption">We hope you enjoy this Template. Make sure to checkout all included pages</div></li>
                </ul> --%>
                
                <ul class="slides">
                    <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege7.action" target="_blank">
                    		<img style="width:1040px;height:400px;" src="${pageContext.request.contextPath}/huse_image/cmxy.png" alt="" title="传媒学院"/>
                    	</a>
                    	<div class="flex-caption"><strong></strong>  
                    	<a href="#" target="_blank"></a>
                    	</div>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege3.action" target="_blank"><img style="width:1040px;height:400px;" src="${pageContext.request.contextPath}/huse_image/jjglxy_02.jpg" alt="" title="经济与管理学院"/></a><div class="flex-caption"><strong></strong><a href="#" target="_blank"></a></div></li>
                    <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege12.action" target="_blank"><img style="width:1040px;height:400px;" src="${pageContext.request.contextPath}/huse_image/msxy.png" alt="" title="美术与艺术设计学院"/></a><div class="flex-caption"><strong></strong><a href="#" target="_blank"></a></div></li>
                    <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege5.action" target="_blank"><img style="width:1040px;height:400px;" src="${pageContext.request.contextPath}/huse_image/practise.gif" alt="" title="体育学院"/></a><div class="flex-caption"><strong></strong><a href="#" target="_blank"></a></div></li>
                    <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege9.action" target="_blank"><img style="width:1040px;height:400px;" src="${pageContext.request.contextPath}/huse_image/tmhj9.jpg" alt="" title="土木与环境工程学院"/></a><div class="flex-caption"><strong></strong><a href="#" target="_blank"></a></div></li>
                    <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege11.action" target="_blank"><img style="width:1040px;height:400px;" src="${pageContext.request.contextPath}/huse_image/ywxy.png" alt="" title="音乐与舞蹈学院"/></a><div class="flex-caption"><strong></strong><a href="#" target="_blank"></a></div></li>
                    <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege8.action" target="_blank"><img style="width:1040px;height:400px;" src="${pageContext.request.contextPath}/huse_image/dzxx8.jpg" alt="" title="电子与信息工程学院"/></a><div class="flex-caption"><strong></strong><a href="#" target="_blank"></a></div></li>
                    <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege10.action" target="_blank"><img style="width:1040px;height:400px;" src="${pageContext.request.contextPath}/huse_image/hs10.jpg" alt="" title="化学与生物工程学院"/></a><div class="flex-caption"><strong></strong><a href="#" target="_blank"></a></div></li>
                    <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege1.action" target="_blank"><img style="width:1040px;height:400px;" src="${pageContext.request.contextPath}/huse_image/lxy_r1_c1.jpg" alt="" title="理学院"/></a><div class="flex-caption"><strong></strong><a href="#" target="_blank"></a></div></li>
                    <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege2.action" target="_blank"><img style="width:1040px;height:400px;" src="${pageContext.request.contextPath}/huse_image/Marxism.jpg" alt="" title="马克思主义学院"/></a><div class="flex-caption"><strong></strong><a href="#" target="_blank"></a></div></li>
                    <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege6.action" target="_blank"><img style="width:1040px;height:400px;" src="${pageContext.request.contextPath}/huse_image/wgyxy.png" alt="" title="外国语学院"/></a><div class="flex-caption"><strong></strong><a href="#" target="_blank"></a></div></li>
                    <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege4.action" target="_blank"><img style="width:1040px;height:400px;" src="${pageContext.request.contextPath}/huse_image/rwsh_kjxy_zwx_10.jpg" alt="" title="人文与社会科学学院"/></a><div class="flex-caption"><strong></strong><a href="#" target="_blank"></a></div></li>
                   
                   <%-- <li>
                   		<img style="width:1040px;height:400px;" src="${pageContext.request.contextPath}/huse_image/dzxx8.jpg" alt="" title="电子与信息工程学院"/>
                   	</li>
	               	<li>
	               		<img style="width:1040px;height:400px;" src="${pageContext.request.contextPath}/huse_image/hs10.jpg" alt="" title="化学与生物工程学院"/>
	               		<div class="flex-caption"></div>
	               	</li> --%>
                </ul>
                
                
            </div>
            <div class="sliderspacefix"></div>
		</div>
  
  </body>
</html>
