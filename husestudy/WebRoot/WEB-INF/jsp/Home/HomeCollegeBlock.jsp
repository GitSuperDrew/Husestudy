<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
  </head>
  <body>
  
   <s:iterator var="c" value="cList">
   <!-- 学院的标题 ：首页显示部分学生的作品（最新）的作品-->
       <div class="sixteen columns row divide" ><!-- onclick="showEightWorks<s:property value='#c.cid'/>()" -->
           <h3 class="titledivider"><a name="college<s:property value='#c.cid'/>"><span ><s:property value="#c.cname" /></span></a></h3>
           <div class="rightlink">&rarr;<span><a name="college<s:property value='#c.cid'/>" class="titlelink" href="${pageContext.request.contextPath}/college_findAllWorksByCollege<s:property value="#c.cid" />">More About it</a></span></div>
           <div class="dividerline"></div>
       </div>
   </s:iterator>
   
   <!-- 学院的内容 -->
            <div class="sixteen columns row teasers portfolio" id="worksDIV">
            <s:iterator var="w" value="eightList" status="status">
                <div class="four columns teaser all-group web-group"> 
                   <a href="${ pageContext.request.contextPath }/works_detials.action?wid=<s:property value="#w.wid"/>" data-text="" class="hovering" >
                   <img style="width:100%;height:90px;" alt="" src="${pageContext.request.contextPath}/<s:property value="#w.wimage"/>" class="scale-with-grid">
                   </a>
                   <div class="topline">
                       <a style="padding-left:10px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" href="${ pageContext.request.contextPath }/works_detials.action?wid=<s:property value="#w.wid"/>"><s:property value="#w.wname"/></a>
                   </div>
                   <div style="width:200px;display:block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;padding-left:10px;color:grey;">
                       <s:property value="#w.wcontent"/>
                   </div>
                   <div style="float:right;width:200px;display:block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;padding-left:10px;color:grey;">
                       <s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#w.wdate})}"/>
                   </div>
                </div>
            </s:iterator>
            <div class="clear"></div>
            </div>
  </body>
</html>
