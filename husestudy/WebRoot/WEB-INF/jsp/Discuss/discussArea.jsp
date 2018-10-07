<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE >
<html>
  <head>
    <title></title>
  </head>
  
  <body>
    
    <!-- Post Comments -->
            <div id="comments" class="eleven columns row alpha">
                <h5 class="teaserheadline" style="margin-bottom:18px;">评论区域</h5>
                
                <!-- Comment -->
                <ul>
                
                    <!-- Reply -->
                    <s:iterator var="d" value="pageBean.list">
                    <li class="depth-1" id="discuss<s:property value="#d.did"/>">
                        <div class="commentwrap">
                            <div class="replylink"><a href="#" class="link"><span>&rarr;</span> 回复</a></div>
                            <div class="author">
                            <s:if test="#session.existUser.uid != null">
                              <a href="${pageContext.request.contextPath}/works_findByUsername.action?uid=<s:property value="#d.user.uid"/>">
                                  <s:if test="#session.detialsWork.user.uid == #d.user.uid"><s:property value="#d.user.username"/>【作者】</s:if>
                                  <s:else><s:property value="#d.user.username"/></s:else>
                              </a>
                            </s:if>
                            <s:else>
                              <span onclick="pleaseLogin()">
                                  <s:if test="#session.detialsWork.user.uid == #d.user.uid"><s:property value="#d.user.username"/>【作者】</s:if>
                                  <s:else><s:property value="#d.user.username"/></s:else>
                              </span>
                            </s:else>
                            <script type="text/javascript">
                            function pleaseLogin(){
                                alert("请到网页【顶部】登录！");
                            }
                            </script>
                            </div>
                             <%-- <div class="author"><a href="#">评论ID：<s:property value="#d.did"/>---作品ID：<s:property value="#d.works.wid"/></a></div> --%>
                            <div class="timestamp"><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#d.ddate})}" /></div>
                            <div class="clear"></div>
                            <div class="postertext">
                                <p><s:property value="#d.dcontent"/></p><!-- 评论内容 -->
                                <%-- <s:if test="#session.countReplyByWid != 0">  <!-- 判断是否有回复选项:通过计算对应的回复项的 -->
                                  <s:iterator var="reply" value="pageBean.list">
                                    <hr />
                                    <p><s:property value="#reply.user.username">:<s:property value="#reply.reply_content">&nbsp;于<s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm}',{#reply.reply_time})}"></p>
                                  </s:iterator>
                                
                                <div class="blogpages">
            <ul>
                 <s:if test="#reply.reply_id != null">
                    第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页
                    <s:if test="pageBean.page != 1">
                        <a href="${ pageContext.request.contextPath }/reply_findRepliesPage.action?reply_id=<s:property value="#reply.reply_id"/>&page=1" class="firstPage">&nbsp;</a>
                        <a href="${ pageContext.request.contextPath }/reply_findRepliesPage.action?reply_id=<s:property value="#reply.reply_id"/>&page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>
                    </s:if>
                    <s:iterator var="i" begin="1" end="pageBean.totalPage">
                        <s:if test="pageBean.page != #i">
                            <a href="${ pageContext.request.contextPath }/reply_findRepliesPage.action?reply_id=<s:property value="#reply.reply_id"/>&page=<s:property value="#i"/>"><s:property value="#i"/></a>
                        </s:if>
                        <s:else>
                            <span class="currentPage"><s:property value="#i"/></span>
                        </s:else>
                    </s:iterator>
                    <s:if test="pageBean.page != pageBean.totalPage">    
                        <a class="nextPage" href="${ pageContext.request.contextPath }/reply_findRepliesPage.action?reply_id=<s:property value="#reply.reply_id"/>&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
                        <a class="lastPage" href="${ pageContext.request.contextPath }/reply_findRepliesPage.action?reply_id=<s:property value="#reply.reply_id"/>&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
                    </s:if>
                </s:if>
            </ul>
            <div class="clear"></div>
         </div>
                            </s:if> --%>
                            </div>
                            <div class="clear"></div>
                            <div style="float:right;">  <!-- bootstrap.min.css的图库冲突 -->
                                
                                <span id="goodSpan<s:property value='#d.did'/>" >
                                    <a onclick="sendGood<s:property value='#d.did'/>()">
                                        <img alt="" src="${ pageContext.request.contextPath }/FrontPage/images/good.jpg" style="width:15px;height:15px;" ondragstart="return false;">&nbsp;
                                    </a>
                                </span>
                                [<span id="good<s:property value='#d.did'/>"></span>]
                                &nbsp;&nbsp;
                                <span id="badSpan<s:property value='#d.did'/>" >
                                    <a onclick="sendBad<s:property value='#d.did'/>()">
                                        <img alt="IMG" src="${ pageContext.request.contextPath }/FrontPage/images/good.jpg" style="width:15px;height:15px;transform: rotate(180deg);" ondragstart="return false;">&nbsp;
                                    </a>
                                </span>
                                [<span id="bad<s:property value='#d.did'/>"></span>]
                                
                                <script type="text/javascript">
                                //数据库的数据取出来初始化：
                                document.getElementById("good<s:property value='#d.did'/>").innerText = <s:property value="#d.good"/>;
                                document.getElementById("bad<s:property value='#d.did'/>").innerText = <s:property value="#d.bad"/>;
                                
                                var goodcount<s:property value="#d.did"/>;
                                //使用AJAX进行处理：Good
                                function sendGood<s:property value="#d.did"/>(){
                                    var goodText = document.getElementById("good<s:property value='#d.did'/>").textContent;
                                    if(goodcount<s:property value="#d.did"/> != 1){
                                        //1.创建异步交互的对象：
                                        var xhr = createXmlHttp();
                                        //2.设置监听：
                                        xhr.onreadystatechange = function(){
                                            if(xhr.readyState == 4){
                                                if(xhr.status == 200){
                                                    goodText = parseInt(goodText)+1;
                                                    //alert("come to good!");
                                                    document.getElementById("good<s:property value='#d.did'/>").innerText = goodText;
                                                    goodcount<s:property value="#d.did"/> = 1;
                                                }
                                            }
                                        };
                                       //3.打开连接：
                                        xhr.open("GET","${pageContext.request.contextPath}/discuss_goodAdd.action?time="+new Date().getTime()
                                                +"&did="+<s:property value="#d.did"/>+"&good="+ (parseInt(goodText)+1),true);
                                       //4.发送：
                                       xhr.send(null);
                                    }else{
                                        alert("你已经点赞成功！");
                                    }
                                }
                                
                                var badcount<s:property value="#d.did"/>;
                                //使用AJAX进行异步的校验：BAD
                                function sendBad<s:property value="#d.did"/>(){
                                    var badText = document.getElementById("bad<s:property value='#d.did'/>").textContent;
                                    if(badcount<s:property value="#d.did"/> != 1){
                                        //1.创建异步交互的对象：
                                        var xhr = createXmlHttp();
                                        //2.设置监听：
                                        xhr.onreadystatechange = function(){
                                            if(xhr.readyState == 4){
                                                if(xhr.status == 200){
                                                    badText = parseInt(badText)+1;
                                                    //alert("come to bad!");
                                                    document.getElementById("bad<s:property value='#d.did'/>").innerText = badText;
                                                    badcount<s:property value="#d.did"/> = 1;
                                                    /* document.getElementById("badSpan<s:property value='#d.did'/>").onclick = function(e){
                                                        e.preventDefault();
                                                        e.stopImmediatePropagation();
                                                    }; */
                                                }
                                            }
                                        };
                                      //3.打开连接：
                                        xhr.open("GET","${pageContext.request.contextPath}/discuss_badAdd.action?time="+new Date().getTime()
                                                +"&did="+<s:property value="#d.did"/>+"&bad="+ (parseInt(badText)+1),true);
                                        //4.发送：
                                        xhr.send(null);
                                    }else{
                                        alert("已经丢了个板砖，大侠，请高抬贵手~");
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
                    </li>
                    </s:iterator>
                   
                    
                    
                    
                  <br style="clear: left;"/>
                </ul>   
                
                    <div>
                        <s:if test="wid != null">
                            第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页 
                            <s:if test="pageBean.page != 1">
                                <a href="${ pageContext.request.contextPath }/works_detials.action?wid=<s:property value="wid"/>&page=1" class="firstPage">&nbsp;</a>
                                <a href="${ pageContext.request.contextPath }/works_detials.action?wid=<s:property value="wid"/>&page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>
                            </s:if>
                            
                            <s:iterator var="i" begin="1" end="pageBean.totalPage">
                                <s:if test="pageBean.page != #i">
                                    <a href="${ pageContext.request.contextPath }/works_detials.action?wid=<s:property value="wid"/>&page=<s:property value="#i"/>"><s:property value="#i"/></a>
                                </s:if>
                                <s:else>
                                    <span class="currentPage"><s:property value="#i"/></span>
                                </s:else>
                            </s:iterator>
                            
                            <s:if test="pageBean.page != pageBean.totalPage">    
                                <a class="nextPage" href="${ pageContext.request.contextPath }/works_detials.action?wid=<s:property value="wid"/>&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
                                <a class="lastPage" href="${ pageContext.request.contextPath }/works_detials.action?wid=<s:property value="wid"/>&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
                            </s:if>
                        </s:if>
                    </div>
                    
                    
                    
                    
                    <!-- Reply -->
                    <%-- <li class="depth-2">
                        <div class="commentwrap">
                            <div class="replylink"><a href="#" class="link"><span>&rarr;</span> Reply</a></div>
                            <div class="author"><a href="#">John Doe</a></div>
                            <div class="timestamp">April 20th, 2011</div><div class="clear"></div>
                            <div class="postertext">
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.</p>            
                            </div><div class="clear"></div>
                        </div>
                    </li> --%>
                    
                    <!-- Reply -->
                    <%-- <li class="depth-3">
                        <div class="commentwrap">
                            <div class="replylink"><a href="#" class="link"><span>&rarr;</span> Reply</a></div>
                            <div class="author"><a href="#">John Doe</a></div>
                            <div class="timestamp">April 20th, 2011</div><div class="clear"></div>
                            <div class="postertext">
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.</p>            
                            </div><div class="clear"></div>
                        </div>
                    </li> --%>
                    
                    <!-- Reply -->
                   <%--  <li class="depth-4">
                        <div class="commentwrap">
                            <div class="replylink"><a href="#" class="link"><span>&rarr;</span> Reply</a></div>
                            <div class="author"><a href="#">John Doe</a></div>
                            <div class="timestamp">April 20th, 2011</div><div class="clear"></div>
                            <div class="postertext">
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.</p>            
                            </div><div class="clear"></div>
                        </div>
                    </li> --%>
                    
                    <!-- Reply -->
                    <%-- <li class="depth-5">
                        <div class="commentwrap">
                            <div class="replylink"><a href="#" class="link"><span>&rarr;</span> Reply</a></div>
                            <div class="author"><a href="#">John Doe</a></div>
                            <div class="timestamp">April 20th, 2011</div><div class="clear"></div>
                            <div class="postertext">
                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.</p>            
                            </div><div class="clear"></div>
                        </div>
                    </li> --%>
                    
                    
                    
                    
                    
                   
                
                <div class="clear"></div>
            </div>
    
  </body>
</html>
