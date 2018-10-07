 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE HTML>
<html>
  <head> 
    <title></title>
  </head>
  
  <body>
    
    <!-- Header | Logo, Menu
        ================================================== -->
    
        <div class="sixteen columns header">
        
            <div class="logo"></div>
            <div class="mainmenu">
                <div id="mainmenu" class="ddsmoothmenu">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/index.action">首页<br/><span>About Yours</span></a>
                           <ul>
                            <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege1">理学院</a></li>
                            <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege2">马克思主义学院</a></li>
                            <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege3">经济与管理学院</a></li>
                            <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege4">人文与社会科学学院</a></li>
                            <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege5">体育学院</a></li>
                            <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege6">外国语学院</a></li>
                            <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege7">传媒学院</a></li>
                            <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege8">电子与信息工程学院</a></li>
                            <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege9">土木与环境工程学院</a></li>
                            <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege10">化学与生物工程学院</a></li>
                            <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege11">音乐与舞蹈学院</a></li>
                            <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege12">美术与艺术设计学院</a></li>
                            <li><a href="${pageContext.request.contextPath}/college_findAllWorksByCollege13">国学院</a></li>
                           </ul>
                        </li>
                        <li><a href="#">网站特点<br/><span>What can you do</span></a>
                           
                        </li>
                        <li><a href="#">博客<br/><span>Latest News</span></a>
                        </li>    
                           <s:if test="#session.existUser == null">
                           <li><a href="#">登入/注册<br/><span>Sign in</span></a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/FrontPage/user_loginPage.action">登录</a></li>
                                <li><a href="${pageContext.request.contextPath}/FrontPage/user_registPage.action">注册</a></li>
                            </ul>
                           </li>
                           </s:if>
                           <s:else>
                               <li><a href="#"><s:property value="#session.existUser.name"/>|个人首页<br/><span>My Page</span></a>
                                <ul>
                                     <li><a href="${pageContext.request.contextPath}/works_findAllWorksByUsername.action">个人作品</a></li>
                                     <li><a href="${pageContext.request.contextPath}/works_addPage.action">添加作品</a></li>
                                     <li><a href="${pageContext.request.contextPath}/discuss_findByUid.action">个人评论</a></li>
                                     <li><a href="${pageContext.request.contextPath}/git_findByUid.action">个人收藏集</a></li>
                                       <li><a href="${pageContext.request.contextPath}/user_quit.action">退出个人首页</a></li>
                                </ul>
                               </li>
                           </s:else>
                        <li>
                            <a href="javascript:;" onclick="addFavorite(this);">收藏本站<br/><span>Often go around</span></a>
                        </li>
                        
                    </ul>
                    
                    <br style="clear: left" />
                </div>
                
                <!-- Responsive Menu -->
                
                <form id="responsive-menu" action="#" method="post">
                    <select>
                        <option value="">Navigation--导航栏目</option>
                    </select>
                </form>
                
            </div>
        </div>
  </body>
</html>
