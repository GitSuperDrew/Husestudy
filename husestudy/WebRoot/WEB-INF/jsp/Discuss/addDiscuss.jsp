<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
  </head>
  <body>
  <!-- Comment Form -->
            <div id="respond">
                <h5 class="teaserheadline" style="margin-bottom:18px;">
                    <span style="float:left;margin:2px">发表我的看法</span><span style="float:right;margin:2px;">Leave A Reply</span>
                </h5>
                <form id="replyform">
                    <input type="text" name="username" id="username"  class="requiredfield" disabled="disabled" value="<s:property value="#session.existUser.name"/>" placeholder="登录后才能发表评论哦..."/>
                    <input type="text" name="wname" id="wname" class="requiredfield" disabled="disabled" value="<s:property value="model.wname"/>"/>
                    <textarea name="dcontent" id="dcontent" class="requiredfield"></textarea>
                    <input type="button" value="提交评论" name="send" onclick="sendDiscuss()"/> 
                    <span id="sendDiscussError"></span>
                </form>
            </div>
            <div class="clear"></div>
        <script type="text/javascript">
            
        //使用ajax进行提交信息
        function sendDiscuss(){
            var username = document.getElementById("username").value;
            var wname = document.getElementById("wname").value;
            var dcontent = document.getElementById("dcontent").value;
            
            if(username != null && username != ""){
                if(wname != null && wname != ""){
                    if(dcontent != null && dcontent != ""){
                        //1.创建异步交互的对象：
                        var xhr = createXmlHttp();
                        //2.设置监听：
                        xhr.onreadystatechange = function(){
                            if(xhr.readyState == 4){
                                if(xhr.status == 200){
                                    document.getElementById("sendDiscussError").innerHTML = "<front style='color:green;font-size:10px;'>&nbsp;已经提交成功</front>";
                                    document.getElementById("replyform").reset();
                                    /* window.localtion.reload("${pageContext.request.contextPath}/discuss_findByWid.action"); */
                                    
                                }
                            }
                        }
                       //3.打开连接：
                       xhr.open("GET","${pageContext.request.contextPath}/discuss_sendMessage.action?time="+new Date().getTime()+"&uid="+<s:property value="#session.existUser.uid"/>+"&wid="+<s:property value="model.wid"/>+"&dcontent="+dcontent,true);
                       //4.发送：
                       xhr.send(null); 
                        
                        
                    }else{
                        document.getElementById("sendDiscussError").innerHTML = "<front style='color:red;font-size:10px;'>&nbsp;请输入评论</front>";//这是一个冗余代码,name实在session中加载的。用于开发测试。
                    }
                }else{
                    document.getElementById("sendDiscussError").innerHTML = "<front style='color:red;font-size:10px;'>&nbsp;请检查作品名字得获取</front>";//这是一个冗余代码,name实在session中加载的。用于开发测试。
                }
            }else{
                document.getElementById("sendDiscussError").innerHTML = "<front style='color:red;font-size:10px;'>&nbsp;请检查姓名的获取</front>";  //这是一个冗余代码,name实在session中加载的。用于开发测试。
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
  </body>
</html>
