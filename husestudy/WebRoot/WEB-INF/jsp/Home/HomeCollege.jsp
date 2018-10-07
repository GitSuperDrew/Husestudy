<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE HTML >
<html>
  <head>  
    <title></title>
  </head>
  <body>
    <div class="sixteen columns row divide">
            <h3 class="titledivider">学院专业</h3>
            <div class="rightlink"><a class="titlelink"><span style="font-size:13px;">&rarr;</span>Welcome To Often</a></div>
            <div class="dividerline"></div>
        </div>
        <div class="sixteen columns row">
            <p>Interest in learning with us? &nbsp; &nbsp; <a href="#point" class="linkbg">Get In Touch</a></p><!-- 此处使用了锚点 -->
            <ul class="clients">
                <li ondragstart="return false;"><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege1.action" target="_blank"><img src="${pageContext.request.contextPath}/FrontPage/images/huse_image/lxy_r1_c1.jpg" title="理学院" /></a></li>
                <li ondragstart="return false;"><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege2.action" target="_blank"><img src="${pageContext.request.contextPath}/FrontPage/images/huse_image/Marxism.jpg" title="马克思主义学院" /></a></li>
                <li ondragstart="return false;"><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege3.action" target="_blank"><img src="${pageContext.request.contextPath}/FrontPage/images/huse_image/jjglxy_02.jpg" title="经济与管理学院" /></a></li>
                <li ondragstart="return false;"><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege4.action" target="_blank"><img src="${pageContext.request.contextPath}/FrontPage/images/huse_image/rwsh_kjxy_zwx_10.jpg" title="人文与社会科学学院" /></a></li>
                <li ondragstart="return false;"><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege5.action" target="_blank"><img src="${pageContext.request.contextPath}/FrontPage/images/huse_image/practise.gif" title="体育学院" /></a></li>
                <li ondragstart="return false;"><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege6.action" target="_blank"><img src="${pageContext.request.contextPath}/FrontPage/images/huse_image/wgyxy.png" title="外国语学院" /></a></li>
                <li ondragstart="return false;"><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege7.action" target="_blank"><img src="${pageContext.request.contextPath}/FrontPage/images/huse_image/cmxy.png" title="传媒学院"  /></a></li>
                <li ondragstart="return false;"><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege8.action" target="_blank"><img src="${pageContext.request.contextPath}/FrontPage/images/huse_image/dzxx8.jpg" title="电子与信息工程学院"  /></a></li>
                <li ondragstart="return false;"><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege9.action" target="_blank"><img src="${pageContext.request.contextPath}/FrontPage/images/huse_image/tmhj9.jpg" title="土木与环境工程学院"/></a></li>
                <li ondragstart="return false;"><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege10.action" target="_blank"><img src="${pageContext.request.contextPath}/FrontPage/images/huse_image/hs10.jpg" title="化学与生物工程学院"  /></a></li>
                <li ondragstart="return false;"><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege11.action" target="_blank"><img src="${pageContext.request.contextPath}/FrontPage/images/huse_image/ywxy.png" title="音乐与舞蹈学院"  /></a></li>
                <li ondragstart="return false;"><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege12.action" target="_blank"><img src="${pageContext.request.contextPath}/FrontPage/images/huse_image/msxy.png" title="美术与艺术设计学院" /></a></li>
                
            </ul>
               
            <div class="clear"></div>
        </div><div class="clear"></div>
  </body>
</html>
