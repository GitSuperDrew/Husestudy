<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>管理员登录界面</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminPlus/Css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminPlus/Css/bootstrap-responsive.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminPlus/Css/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/adminPlus/Js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/adminPlus/Js/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/adminPlus/Js/ckform.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/adminPlus/Js/common.js"></script>
	<style type="text/css">
		body {
			padding-top: 40px;
			padding-bottom: 40px;
			background-color: #f5f5f5;
		}
		
		.form-signin {
			max-width: 300px;
			padding: 19px 29px 29px;
			margin: 0 auto 20px;
			background-color: #fff;
			border: 1px solid #e5e5e5;
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
			-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
			box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
		}
		
		.form-signin .form-signin-heading,
		.form-signin .checkbox {
			margin-bottom: 10px;
		}
		
		.form-signin input[type="text"],
		.form-signin input[type="password"] {
			font-size: 16px;
			height: auto;
			margin-bottom: 15px;
			padding: 7px 9px;
		}
		.center-content{
			float:right;
			margin:2px;
			border-size:10px;
		}
		#h6{
			color:red;
		}
	</style>
	<script type="text/javascript">
		var time;
		function change(){
			time = new Date().getTime();
			var img1 = document.getElementById("checkImg");
			img1.src="${pageContext.request.contextPath}/checkImg.action?time="+time;
		}
	
		<%-- function check(){
			var code= "<%=session.getAttribute("checkcode")%>"; 
		   	var checkcodeValue = document.getElementById("checkcode").value;
		   	var ceeckcode = document.getElementById("checkcode");
		   	if(code == checkcodeValue){
		   		checkcode.disabled = false;
		   	}
		   	if(code != checkcodeValue){
		   		checkcode.disabled = true;
		   	}
		} --%>
	</script>
	
  </head>
  
  <body>
  	<div class="container">

			<form id="login_form" class="form-signin" method="post" action="${pageContext.request.contextPath }/adminPlus_login.action" novalidate="novalidate" onsubmit="return checkForm();">
				<h2 class="form-signin-heading">登录系统</h2><h6 id="h6"><s:actionerror /></h6>
				<input type="text" name="kname" id="kname" class="input-block-level" placeholder="账号" required="required">
				<input type="password" name="kpassword" id="kpassword" class="input-block-level" placeholder="密码" required="required">
				<input type="text" name="checkcode" maxlength="4" autocomplete="off" id="checkcode" class="input-medium" placeholder="验证码" required="required" >
				<!-- 动态生成验证码  -->
				<div class="center-content">
					<img id="checkImg" src="${pageContext.request.contextPath}/checkImg.action" onclick="change()"  title="点击更换验证码">
				</div>
				
				<p><button class="btn btn-large btn-primary"  type="submit" >登录</button></p>
			</form>

		</div>
  </body>
</html>
