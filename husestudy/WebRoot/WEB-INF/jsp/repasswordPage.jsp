<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
         <title>用户修改密码</title>
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
        <strong><s:fielderror/></strong>
            <form id="registerForm" method="post" action="${ pageContext.request.contextPath }/user_repasswordEenter.action?username=<s:property value='user.username'/>" novalidate="novalidate" onsubmit="return checkForm();">
                <table style="color:black;">
                    <tr id="th">
                        <td colspan="3">用户修改密码</td>
                    </tr>
                    <tr>
                        <td class="gly">
                            <button type="button" class="btn btn-default btn-sm" disabled="disabled">
                                <span class="glyphicon glyphicon-user"></span> 
                            </button>
                        </td>
                        <td >用户账号</td>
                        <td>
                            <input disabled="disabled" type="text" id="username" name="username" value="<s:property value='user.username'/>"/>
                        </td>
                        <td id="spanTd">
                            <span class="error" id="usernameError"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="gly">
                            <button type="button" class="btn btn-default btn-sm" disabled="disabled">
                                <span class="glyphicon glyphicon-user"></span> 
                            </button>
                        </td>
                        <td >用户邮箱</td>
                        <td>
                            <input disabled="disabled" value="<s:property value='user.email'/>" type="email" id="email" name="email" />
                        </td>
                        <td id="spanTd">
                            <span class="error" id="emailError"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="gly">
                            <button type="button" class="btn btn-default btn-sm" disabled="disabled">
                                <span class="glyphicon glyphicon-lock"></span> 
                            </button>
                        </td>
                        <td>新的密码</td>
                        <td>
                            <input type="password" id="password" name="password" required="required"/>
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
                        <td>确认密码</td>
                        <td>
                            <input type="password" id="repassword" onkeyup="checkPassword()" name="repassword" required="required"/>
                        </td>
                        <td id="spanTd">
                            <span class="error" id="passwordError"></span>
                        </td>
                    </tr>
                    <tr style="background-color:cornflowerblue;">
                        <td colspan="2">
                            <button style="width:100%;">确认提交</button>
                        </td>
                        <td colspan="1">
                            <input type="reset" value="重置密码"/>
                        </td>
                    </tr>
                    <tr style="background-color:cornflowerblue;">
                        <td colspan="3">
                            <a href="${pageContext.request.contextPath}/user_login.action" id="nowLogin">立即登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/index.action" id="returnHome">回到首页</a>
                        </td>
                    </tr>
                </table>
            </form>
            <!-- 表单验证 -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/admin/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath }/admin/assets/form-validation.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery_Validation_messages_zh.js" ></script>
        
    </body>
</html>
