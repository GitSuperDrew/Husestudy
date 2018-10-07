<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
    <script src="${pageContext.request.contextPath}/FrontPage/js/jquery-1.7.min.js"></script>
  </head>
  
  <body>

    <div class="sixteen columns row textblock" >

            <div class="one_fourth">
                <h5 class="teaserheadline"><img src="${pageContext.request.contextPath}/FrontPage/images/icons/down.png" alt="" />下载中心</h5>
                <p>你可以上传/下载文件<br/><br/>
                    <a target="_blank" href="${pageContext.request.contextPath}/husefile_fileListCenter.action" class="button">进入下载中心</a>
                </p>
            </div>
            <div class="one_fourth">
                <h5 class="teaserheadline"><img src="${pageContext.request.contextPath}/FrontPage/images/icons/cog.png" alt="" />书本查找</h5>
                <p>书记如酒，久酿沉香<br/><br/><a href="http://book.chaoxing.com/" target="_blank" class="button" onclick="return confirm('同意进入超星图书馆？')">畅游书籍海洋</a></p>
            </div>
            <div class="one_fourth">
                <h5 class="teaserheadline"><img src="${pageContext.request.contextPath}/FrontPage/images/icons/help.png" alt="" />帮助中心</h5>
                <p> 常见问题及时解决<br/><br/><a href="#point" id="help" class="button">马上请求帮助</a></p>
            </div>
            <div class="one_fourth lastcolumn">
                 <h5 class="teaserheadline"><img src="${pageContext.request.contextPath}/FrontPage/images/icons/planet.png" alt="" />发现创造</h5>
                <p> 有趣好玩尽在其中 <br/><br/><a href="#" class="button">进入全新视界</a></p>
            </div>
            
            <div class="clear"></div>
        </div>
    <script type="text/javascript">
    $(document).ready(function(){
        $("#help").click(function(){
            alert("请到网页底部反馈，我们将总结对常见问题归总");
        });
    });
    </script>
  </body>
</html>
