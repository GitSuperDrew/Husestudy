<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
  </head>
  
  <body>
  
  <!-- Change to class="container footerwrap full" for a full-width footer -->
    <div class="container footerwrap">
    
        <div class="footerclose"></div>
    
        <div class="footer">
            <div class="sixteen columns">
                <div class="four columns clearfix widget alpha">
                   <h5>Latest Project</h5>
                    <div class="widget_blogposts">
                        <ul>
                        <s:iterator var="wf" value="fiveWorks" status="status">
                         <li class="clearfix">
                                <a href="${pageContext.request.contextPath}/works_detials.action?wid=<s:property value="#wf.wid"/>" class="borderhover">
                                    <img style="width:30px;height:30px;" src="${ pageContext.request.contextPath }/<s:property value="#wf.wimage"/>" alt="image losing" />
                                </a>
                                <div class="postlink" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;display:-webkit-box;-webkit-box-orient:vertical;">
                                    <a href="${pageContext.request.contextPath}/works_detials.action?wid=<s:property value="#wf.wid"/>"><s:property value="#wf.wname"/></a>
                                </div>
                                <div class="subline"><s:property value="%{getText('{0,date,MM dd,yyyy HH:mm:ss}',{#wf.wdate})}"/></div>
                         </li>
                         </s:iterator>
                        </ul>
                        <div class="clear"></div>
                    </div>
                </div>
                
                <div class="four columns widget">
                    <h5>POPULAR WORKS</h5>
                    <div class="widget_blogposts">
                        <ul>
                        <s:iterator var="wh" value="worksListHot" status="status">
                            <li class="clearfix">
                                <a href="${pageContext.request.contextPath}/works_detials.action?wid=<s:property value="#wh.wid"/>" class="borderhover">
                                    <img style="width:30px;height:30px;" src="${ pageContext.request.contextPath }/<s:property value="#wh.wimage"/>" alt="" />
                                </a>
                                <div class="postlink" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;display:-webkit-box;-webkit-box-orient:vertical;">
                                    <a href="${pageContext.request.contextPath}/works_detials.action?wid=<s:property value="#wh.wid"/>"><s:property value="#wh.wname"/></a>
                                </div>
                                <div class="subline"><s:property value="%{getText('{0,date,MM dd,yyyy HH:mm:ss}',{#wh.wdate})}"/></div>
                         </li>
                        </s:iterator>
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
                            <a href="${pageContext.request.contextPath}/user_map.action" target="_blank"><s:property value="#info.school"/></a><br/>
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

                <div class="four columns widget omega">
                    <a name="point"><h5>QUICK CONTACT</h5></a>
                    <div class="widget_quickcontact">
                        <form id="quickcontact">
                            <input type="text" name="sendmsg_name" id="sendmsg_name" class="requiredfield" placeholder="姓名"/>
                            <input type="text" name="sendmsg_email" id="sendmsg_email"  class="requiredfield" placeholder="请认真填写邮箱"/>
                            <textarea name="sendmsg_message"  id="sendmsg_message"  class="requiredfield" placeholder="感谢你的反馈，我们将认真对待你的建议和批评"></textarea>
                            <input type="button" value="发送" name="send"  onclick="sendMsg()">
                            <span id="sendError"></span>
                            
                        </form>
                    </div>
                </div><div class="clear"></div>
                <script type="text/javascript">
               
                /* 使用AJAX进行提交信息 */
                function sendMsg(){
                    var sendmsg_name = document.getElementById("sendmsg_name").value;
                    var sendmsg_email = document.getElementById("sendmsg_email").value;
                    var sendmsg_message = document.getElementById("sendmsg_message").value;
                    
                    if(sendmsg_name != null && sendmsg_name !=""){
                        
                        if(sendmsg_email != null && sendmsg_email != ""){
                            
                            //验证邮箱格式
                               var regex = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                               if (sendmsg_email.match(regex)) {
                                   document.getElementById("sendError").innerHTML = "<front style='color:green;font-size:10px;'>&nbsp;邮箱输入正确</front>";
                                   if(sendmsg_message != null && sendmsg_message != ""){
                                   
                                    //1.创建异步交互的对象：
                                    var xhr = createXmlHttp();
                                    //2.设置监听：
                                    xhr.onreadystatechange = function(){
                                        if(xhr.readyState == 4){
                                            if(xhr.status == 200){
                                                document.getElementById("sendError").innerHTML = "<front style='color:green;font-size:10px;'>&nbsp;已经提交成功</front>";
                                                document.getElementById("quickcontact").reset();
                                            }
                                        }
                                    };
                                    //3.打开连接：
                                       xhr.open("GET","${pageContext.request.contextPath}/sendMsg_sendMsg.action?time="+new Date().getTime()+"&sendmsg_name="+sendmsg_name+"&sendmsg_email="+sendmsg_email+"&sendmsg_message="+sendmsg_message,true);
                                    //4.发送：
                                       xhr.send(null);
                                    
                                   
                                   }else{
                                       document.getElementById("sendError").innerHTML = "<front style='color:red;font-size:10px;'>&nbsp;请填写完整，方可提交。</front>";
                                   }
                               } else {
                                   document.getElementById("quickcontact").reset();
                                   document.getElementById("sendError").innerHTML = "<front style='color:red;font-size:10px;'>&nbsp;邮箱输入错误</front>"; 
                               }
                        }else{
                            document.getElementById("sendError").innerHTML = "<front style='color:red;font-size:10px;'>&nbsp;请输入邮箱</front>";
                        }
                    }else{
                        document.getElementById("sendError").innerHTML = "<front style='color:red;font-size:10px;'>&nbsp;请输入姓名</front>";
                    }
                    
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
            </div>
        </div>
    </div><!-- container -->
  
  </body>
</html>
