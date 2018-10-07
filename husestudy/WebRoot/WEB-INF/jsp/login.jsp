<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
  <head>
    <title>湘科院大学生自学交流平台</title>
    
    <!-- Bootstrap -->
    <link href="${ pageContext.request.contextPath }/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${ pageContext.request.contextPath }/admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="${ pageContext.request.contextPath }/admin/assets/styles.css" rel="stylesheet" media="screen">
     <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="${ pageContext.request.contextPath }/admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <!-- 学校Logo -->
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo/HomeLogo.jpg" type="image/x-icon"/>
    <!-- 模态框：弹框 -->
    <script src="${pageContext.request.contextPath}/FrontPage/js/modal.js" type="text/javascript"></script>
  </head>
  <body id="login">
    <div class="container">
      <form class="form-signin"  id="loginForm" action="${ pageContext.request.contextPath }/user_login.action" method="post"  novalidate="novalidate">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" id="username" name="username" class="input-block-level" placeholder="User name" autofocus="autofocus" required="required">
        <input type="password" id="password" name="password" class="input-block-level" placeholder="Password" required="required">
        <label class="checkbox">
          <!-- <input type="checkbox" value="remember-me" name="rememberUser" id="rememberUser" > 记住用户名 -->
        </label>
            <button class="btn btn-large btn-primary" type="submit" onclick="saveUserInfo()">登录</button>
            <a href="${ pageContext.request.contextPath }/user_registPage.action" id="aleft">注册账号</a>&nbsp;&nbsp;&nbsp;
            <a href="${ pageContext.request.contextPath }/user_quit.action">回到首页</a>&nbsp;&nbsp;&nbsp;
            <!-- 按钮触发模态框 -->
            <a data-toggle="modal" data-target="#myModal">忘记密码？</a>
            <center><span id="sendError"></span></center>
      </form>
      
      <!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改密码
				</h4>
				<span id="successSendMsg"></span>
				<p><strong><s:fielderror/></strong></p>
			</div>
			<form action="" id="formEmail">
			<div class="modal-body">
				用户账号：<input type="text" name="username" id="username2" onkeyup="checkUsernameGood()"/><span id="username2Error"></span>
				<br>
				用户邮箱：<input type="email" name="email" id="email2" onkeyup="checkEmail()"/><span id="email2Error"></span>
			</div>
			<script type="text/javascript">
			function checkForm(){
				var username2 = document.getElementById("username2").value;
				var email2 = document.getElementById("email2").value;
				if(username2 == null || username2 == ''){
					document.getElementById("username2Error").innerHTML = "<font style='color:red;'>用户名不能为空！</font>";
					return false;
				}else{
					if(email2 == null || email2 == ''){
						document.getElementById("email2Error").innerHTML = "<font style='color:red;'>邮件不能为空！</font>";
						return false;
					}else{
						return true;
					}
				}
			}
			function checkUsernameGood(){
                var regex = /^[\u4e00-\u9fa5a-z0-9_-]{2,10}$/;
                var username = document.getElementById("username2").value;
                
                if (username.match(regex)) {
                    document.getElementById("username2Error").innerHTML = "<font style='color:green'>OK,Good</font>";
                    return true;
                } else {
                    document.getElementById("username2Error").innerHTML = "<font style='color:red'>用户名输入错误！</font>";
                    return false;
                }
            }
			function checkEmail(){
                var regex = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                var email2 = document.getElementById("email2").value;
                var email2Error = document.getElementById("email2Error");
                if (email2.match(regex)) {
                    email2Error.innerHTML = "<font style='color: green;'>邮箱输入正确</font>";
                    return true;
                } else {
                    email2Error.innerHTML = "<font style='color: red;'>邮箱格式错误</font>";
                    return false;
                }
            }
			function sendEmail(){
			//使用AJAX进行提交信息：
			var usernametemp = document.getElementById("username2").value;
			var emailtemp = document.getElementById("email2").value;
				//1.创建异步交互的对象：
	             var xhr = createXmlHttp();
	             //2.设置监听：
	             xhr.onreadystatechange = function(){
	                 if(xhr.readyState == 4){
	                    if(xhr.status == 200){
	                         document.getElementById("sendError").innerHTML = "<front style='color:green;font-size:10px;'>&nbsp;已经提交成功,请到提交的邮箱中取修改密码。</front>";
	                         document.getElementById("successSendMsg").innerHTML = xhr.responseText;
	                         document.getElementById("formEmail").reset();
	                         document.getElementById("email2Error").innerHTML = "";
	                         document.getElementById("username2Error").innerHTML = "";
	                     }
	                 }
	             };
                 //3.打开连接：
                xhr.open("GET","${pageContext.request.contextPath}/user_checkUserEmail.action?time="+new Date().getTime()+"&username="+usernametemp+"&email="+emailtemp,true);
                 //4.发送：
                xhr.send(null);
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
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="sendEmail()" onmouseover="checkForm()">
					提交信息
				</button>
			</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
      
      
<center><div style="color:red;font-size:13px;"><s:actionerror /></div></center>
    </div> <!-- /container -->
    <script src="${ pageContext.request.contextPath }/admin/vendors/jquery-1.9.1.js"></script>
    <script src="${ pageContext.request.contextPath }/admin/vendors/jquery-cookie.js"></script>
    <script src="${ pageContext.request.contextPath }/admin/bootstrap/js/bootstrap.min.js"></script>
    
  </body>
</html>