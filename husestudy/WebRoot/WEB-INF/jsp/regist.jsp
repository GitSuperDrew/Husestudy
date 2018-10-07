<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		 <title>用户注册页面</title>
        <script type="text/javascript" src="${pageContext.request.contextPath}/FrontPage/js/jquery-3.3.1.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/FrontPage/js/bootstrap.min.js" ></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/FrontPage/css/bootstrap.min.css" />
    <!-- 学校Logo -->
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo/HomeLogo.jpg" type="image/x-icon"/>
        
		<style>
        	body{margin-top: 10%;margin-left:10%;color:white; font-size: 15px;font-family: "微软雅黑";background-image:url("${pageContext.request.contextPath}/FrontPage/images/bg.jpg");background-repeat:y-repeat;background-size:cover;}
        	input,#selectJob{width:300px;}
        	input[placeholder]{font-family: "微软雅黑";padding-left: 5%;color:buttonshadow;}
        	option{font-family: "幼圆";background-color: papayawhip;color:buttonshadow;context-align:center;}
        	td{width: 70px;}
        	#reset{width: 26%;float: left;border:0px;margin: 2px;background-color: cornflowerblue;}
        	#reset:hover{background-color: burlywood;}
        	#login , #submit{width: 72%;float: right;border:0; margin: 2px;background-color: cornflowerblue;}
        	#submit:hover{background-color: springgreen;}
        	#login:hover{background-color: mediumspringgreen;}
        	.gly{width: 20px;text-align: right;padding-right: 6px;}
        	.error{color: red;width: 200px;}
        	#spanTd{width: 150px;}
        	#th{text-align: center;font-size: 20px;background-color: dodgerblue;}
        	#agreement{width: 400px; height: 200px;text-align: left;word-wrap:break-word;color:black;
        	overFlow-x:hidden;overFlow-y:scroll;scrollBar-face-color:green;
        	}
        	#showMsg{width: 26%;float: left;border:0px;margin: 2px;background-color: mediumspringgreen;}
        	#showMsg:hover,#nowLogin:hover,#returnHome:hover{color:blue;font-family:"幼圆";}
        	#checkcode{width: 45%;}
        	#checkImg{width:53%;height:30px;}
        	#returnHome{color:white;float:right;}
        	#nowLogin{color:white;}
        </style>
        <script>
        	function checkUsernameGood(){
        		var regex = /^[\u4e00-\u9fa5a-z0-9_-]{2,10}$/;
        		var username = document.getElementById("username").value;
        		
        		if (username.match(regex)) {
        			document.getElementById("usernameError").innerHTML = "<font style='color:green'>OK,Good</font>";
        			return true;
        		} else {
        			document.getElementById("usernameError").innerHTML = "No";
        			return false;
        		}
        	}
        	
        	function checkForm(){
        		// 校验用户名:
        		// 获得用户名文本框的值:
        		var username = document.getElementById("username").value;
        		if(username == null || username == ''){
        			alert("用户名不能为空!");
        			return false;
        		}
        		// 校验密码:
        		// 获得密码框的值:
        		var password = document.getElementById("password").value;
        		if(password == null || password == ''){
        			alert("密码不能为空!");
        			return false;
        		}
        		// 校验确认密码:
        		var repassword = document.getElementById("repassword").value;
        		if(repassword != password){
        			alert("两次密码输入不一致!");
        			return false;
        		}
        		
        		//验证码不能为空判断
        		var checkcode = document.getElementById("checkcode").value;
        		if(checkcode == nul || checkcode == ''){
        			alert("验证码不能为空！");
        			return false;
        		}
        	}
        	
        	function checkUsername(){
        		// 获得文件框值:
        		var username = document.getElementById("username").value;
        		// 1.创建异步交互对象
        		var xhr = createXmlHttp();
        		// 2.设置监听
        		xhr.onreadystatechange = function(){
        			if(xhr.readyState == 4){
        				if(xhr.status == 200){
        					document.getElementById("usernameError").innerHTML = xhr.responseText;
        				}
        			}
        		};
        		// 3.打开连接
        		xhr.open("GET","${pageContext.request.contextPath}/user_findByName.action?time="+new Date().getTime()+"&username="+username,true);
        		// 4.发送
        		xhr.send(null);
        	}
        	
        	function createXmlHttp(){
     		   var xmlHttp;
     		   try{ // Firefox, Opera 8.0+, Safari
     		        xmlHttp=new XMLHttpRequest();
     		    }
     		    catch (e){
     			   try{// Internet Explorer
     			         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
     			      }
     			    catch (e){
     			      try{
     			         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
     			      }
     			      catch (e){}
     			      }
     		    }

     			return xmlHttp;
     		 }
        	
        	
        	function change(){
        		var img1 = document.getElementById("checkImg");
        		img1.src="${pageContext.request.contextPath}/checkImg.action?time="+new Date().getTime();  //如果点击一下产生一个WARN OgnlValueStack:64 - Error setting value 错误，请在问号后面加上“time=”
        	}
        	
	        
        	function checkPassword(){
        		var password = document.getElementById("password").value;
	        	var repassword = document.getElementById("repassword").value;
	        	var passwordError = document.getElementById("passwordError");
	        	if (password != repassword) {
	        		passwordError.innerHTML = "密码不一致";
	        		repassword.length = 0;
					return false;
				}else{
					passwordError.innerHTML = "<font style='color: green;'>密码匹配正确</font>";
					return true;
				}
			}
        	
        	
        	function checkPhone(){
        		var regex = /^1[3|4|5|8][0-9]\d{4,8}$/;
        		var phone = document.getElementById("phone").value;
        		if (phone.match(regex)) {
        			document.getElementById("phoneError").innerHTML = "<font style='color: green;'>手机号码格式正确</font>";
        			return true;
        		} else {
        			document.getElementById("phoneError").innerHTML = "手机号码输入错误";
        			return false;
        		}
        	}
				
			function checkEmail(){
				var regex = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
				var email = document.getElementById("email").value;
				var emailError = document.getElementById("emailError");
				if (email.match(regex)) {
					emailError.innerHTML = "<font style='color: green;'>邮箱输入正确</font>";
					return true;
				} else {
					emailError.innerHTML = "邮箱格式错误";
					return false;
				}
			}
			
        </script>
		
	</head>
	<body>
		<center>
		<strong><s:fielderror/></strong>
    		<form id="registerForm" method="post" action="${ pageContext.request.contextPath }/user_regist.action" novalidate="novalidate" onsubmit="return checkForm();">
    			<table>
    				<tr id="th">
    					<td colspan="3">
    						用户表单注册
    					</td>
    				</tr>
    				<tr>
    					<td class="gly">
    						<button type="button" class="btn btn-default btn-sm" disabled="disabled">
								<span class="glyphicon glyphicon-user"></span> 
							</button>
    					</td>
    					<td >用户账号</td>
    					<td>
    						<input type="text" id="username" name="username" onkeyup="checkUsernameGood()" onblur="checkUsername()" placeholder="username" required="required" autofocus="autofocus"/>
    					</td>
    					<td id="spanTd">
    						<span class="error" id="usernameError"></span>
    					</td>
    				</tr>
    				<tr>
    					<td class="gly">
    						<button type="button" class="btn btn-default btn-sm" disabled="disabled">
								<span class="glyphicon glyphicon-lock"></span> 
							</button>
    					</td>
    					<td>用户密码</td>
    					<td>
    						<input type="password" id="password" name="password" placeholder="password" required="required"/>
    					</td>
    					<td id="spanTd">
    						<span class="error"></span>
    					</td>
    				</tr>
    				<tr>
    					<td class="gly">
    						<button type="button" class="btn btn-default btn-sm" disabled="disabled">
								<span class="glyphicon glyphicon-lock"></span> 
							</button>
    					</td>
    					<td>验证密码</td>
    					<td>
    						<input type="password" id="repassword" onkeyup="checkPassword()" name="repassword" placeholder="repassword" required="required"/>
    					</td>
    					<td id="spanTd">
    						<span class="error" id="passwordError"></span>
    					</td>
    				</tr>
    				<tr>
    					<td class="gly">
    						<button type="button" class="btn btn-default btn-sm" disabled="disabled">
								<span class="glyphicon glyphicon-user"></span> 
							</button>
    					</td>
    					<td>真实姓名</td>
    					<td>
    						<input type="text" id="name" name="name" placeholder="real name" required="required"/>
    					</td>
    				</tr>
    				<tr>
    					<td class="gly">
    						<button type="button" class="btn btn-default btn-sm" disabled="disabled">
								<span class="glyphicon glyphicon-user"></span> 
							</button>
    					</td>
    					<td>用户身份</td>   <!-- ????????如何传递一个选择值到数据库中持久化？？？？？ -->
    					<td>
    						<select name="job" id="selectJob">
    							<option style="text-align:center;" value="0" <s:if test="job==0">selected</s:if>>外部人员</option>
    							<option style="text-align:center;" value="1" <s:if test="job==1">selected</s:if>>学生</option>
    							<option style="text-align:center;" value="2" <s:if test="job==2">selected</s:if>>老师</option>
    						</select>
    					</td>
    					<td>
    						<span></span>
    					</td>
    				</tr>
    				<tr>
    					<td class="gly">
    						<button type="button" class="btn btn-default btn-sm" disabled="disabled">
								<span class="glyphicon glyphicon-phone-alt"></span> 
							</button>
    					</td>
    					<td>联系电话</td>
    					<td>
    						<input type="tel" id="phone" onblur="checkPhone()" name="phone" placeholder="phone number" required="required"/>
    					</td>
    					<td id="spanTd">
    						<span class="error" id="phoneError"></span>
    					</td>
    				</tr>
    				<tr>
    					<td class="gly">
    						<button type="button" class="btn btn-default btn-sm" disabled="disabled">
								<span class="glyphicon glyphicon-paperclip"></span> 
							</button>
    					</td>
    					<td>常用邮箱</td>
    					<td>
    						<input type="email" id="email" onblur="checkEmail()" name="email" placeholder="normal email" required="required"/>
    					</td>
    					<td id="spanTd">
    						<span class="error" id="emailError"></span>
    					</td>
    				</tr>
    				

					<tr>
    					<td class="gly">
    						<button type="button" class="btn btn-default btn-sm" disabled="disabled">
								<span class="glyphicon glyphicon-bell"></span> 
							</button>
    					</td>
    					<td>验证注册</td>
    					<td>
    						<input type="text" id="checkcode"  name="checkcode" placeholder="请输入验证码" required="required"  maxlength="4" autocomplete="off"/>
    						<img id="checkImg" src="${pageContext.request.contextPath}/checkImg.action" onclick="change()" title="点击更换验证码">
    					</td>
    					<td id="spanTd">
    						<span class="error" id="emailError"></span>
    					</td>
    				</tr>


    				<tr>
    					<td colspan="3">
    						<input type="reset" name="reset" id="reset" value="重置" />
    						<input type="submit" name="submit" id="submit" value="同意以下协议并注册"/>
    					</td>
    				</tr>
    				
    				
    				
    				
    				<tr style="background-color:cornflowerblue;">
    					<td colspan="3">
    						<button id="showMsg">查看协议</button>
    						<a href="${pageContext.request.contextPath}/user_loginPage.action" id="nowLogin">立即登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						<a href="${pageContext.request.contextPath}/user_quit.action" id="returnHome">回到首页</a>
    						<%-- <a href="${pageContext.request.contextPath}/user_loginPage.action">
    							<button id="login">去登录</button>
    						</a> --%>
    					</td>
    				</tr>
    				
    				<tr style="color:black;background-color:buttonshadow;">
    					<td colspan="3">
    						<div id="agreement" class="agreement" hidden="hidden">
					<p>尊敬的用户欢迎您注册成为本网站会员。请用户仔细阅读以下全部内容。
					如用户不同意本服务条款任意内容，请不要注册或使用本网站服务。如用户通过本网站注册程序，即表示用户与本网站已达成协议，自愿接受本服务条款的所有内容。
					此后，用户不得以未阅读本服务条款内容作任何形式的抗辩。</p> 
					<p>一、本站服务条款的确认和接纳<br>本网站涉及的各项服务的所有权和运作权归本网站所有。本网站所提供的服务必须按照其发布的服务条款和操作规则严格执行。
					本服务条款的效力范围及于本网站的一切产品和服务，用户在享受本网站的任何服务时，应当受本服务条款的约束。</p>
					 <p>二、服务简介<br>本网站运用自己的操作系统通过国际互联网络为用户提供各项服务。用户必须: 
					  1. 提供设备，如个人电脑、手机或其他上网设备。 2. 个人上网和支付与此服务有关的费用。</p> 
					  <p>三、用户在不得在本网站上发布下列违法信息<br>
					  1. 反对宪法所确定的基本原则的； 2. 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 
					  3. 损害国家荣誉和利益的； 4. 煽动民族仇恨、民族歧视，破坏民族团结的； 5. 破坏国家宗教政策，宣扬邪教和封建迷信的；
					   6. 散布谣言，扰乱社会秩序，破坏社会稳定的； 7. 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 
					   8. 侮辱或者诽谤他人，侵害他人合法权益的； 9. 含有法律、行政法规禁止的其他内容的。</p> 
					   <p>四、有关个人资料<br>
					   用户同意:  
					   1. 提供及时、详尽及准确的个人资料。 2. 同意接收来自本网站的信息。 
					   3. 不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。 
					   4. 本网站不公开用户的姓名、地址、电子邮箱和笔名。除以下情况外:  
					   a) 用户授权本站透露这些信息。 b) 相应的法律及程序要求本站提供用户的个人资料。</p> 
					   <p>五、服务条款的修改<br>
					   本网站有权在必要时修改服务条款，一旦条款及服务内容产生变动，本网站将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以主动取消获得的本网站信息服务。如果用户继续享用本网站信息服务，则视为接受服务条款的变动。</p> 
					   <p>六、用户隐私制度<br>
					   尊重用户个人隐私是本网站的一项基本政策。所以，本网站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本网站中的非公开内容，除非有法律许可要求或本网站在诚信的基础上认为透露这些信息在以下四种情况是必要的:  1. 遵守有关法律规定，遵从本网站合法服务程序。 2. 保持维护本网站的商标所有权。 3. 在紧急情况下竭力维护用户个人和社会大众的隐私安全。 4. 符合其他相关的要求。</p> 
					   <p>七、用户的帐号、密码和安全性
					   <br>用户一旦注册成功，将获得一个密码和用户名。用户需谨慎合理的保存、使用用户名和密码。如果你不保管好自己的帐号和密码安全，将负全部责任。
					   另外，每个用户都要对其帐户中的所有活动和事件负全责。你可随时根据指示改变你的密码。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通告本网站。  
					   	      八、 拒绝提供担保 用户明确同意信息服务的使用由用户个人承担风险。本网站不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保，但会在能力范围内，避免出错。</p>
					    <p>九、有限责任<br>
					    如因不可抗力或其它本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等本站会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失，同时会尽量避免这种损害的发生。</p> 
					    <p>十、用户信息的储存和限制<br>
					    本站有判定用户的行为是否符合国家法律法规规定及本站服务条款权利，如果用户违背本网站服务条款的规定，本网站有权中断对其提供服务的权利。</p> 
					    <p>十一、用户管理<br>
					    用户单独承担发布内容的责任。用户对服务的使用是根据所有适用于本站的国家法律、地方法律和国际法律标准的。用户必须遵循: 
					    1. 使用网络服务不作非法用途。 2. 不干扰或混乱网络服务。 3. 遵守所有使用网络服务的网络协议、规定、程序和惯例。 用户须承诺不传输任何非法的、骚扰性的、中伤他人的、辱骂性的、恐性的、伤害性的、庸俗的，淫秽等信息资料。另外，用户也不能传输何教唆他人构成犯罪行为的资料；
					    不能传输助长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。未经许可而非法进入其它电脑系统是禁止的。 若用户的行为不符合以上提到的服务条款，本站将作出独立判断立即取消用户服务帐号。用户需对自己在网上的行为承担法律责任。用户若在本站上散布和传播反动、色情或其它违反国家法律的信息，本站的系统记录有可能作为用户违反法律的证据。</p> 
					    <p>十二、通告<br>
					    所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。</p> 
					    <p>十三、信息内容的所有权<br>
					    本网站定义的信息内容包括: 文字、软件、声音、相片、录象、图表；在广告中全部内容；本网站为用户提供的其它信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本网站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本站所有的文章版权归原文作者和本站共同所有，
					    任何人需要转载本站的文章，必须征得原文作者或本站授权。</p> 
					    <p>十四、法律<br>
					    本协议的订立、执行和解释及争议的解决均应适用中华人民共和国的法律。用户和本网站一致同意服从本网站所在地有管辖权的法院管辖。
					如发生本网站服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它条款则依旧保持对用户的约束力。</p>
				</div>
    					</td>
    				</tr>
    				
    				
    				<script> 
						$(document).ready(function(){
						  $("#showMsg").click(function(){
						    $("#agreement").slideToggle("slow");
						  });
						});
					</script>
    			</table>
    		</form>
    		<!-- 表单验证 -->
    	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
		<script src="${pageContext.request.contextPath }/admin/assets/form-validation.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery_Validation_messages_zh.js" ></script>
    		
    	</center>
	</body>
</html>
