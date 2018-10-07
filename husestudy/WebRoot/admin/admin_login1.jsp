<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>后台管理员登入界面</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/css/login_admin.css" />
        <!-- 学校Logo -->
        <link rel="icon" href="${pageContext.request.contextPath}/images/logo/HomeLogo.jpg" type="image/x-icon"/>
    </head>

    <body>
    <center><s:actionerror/></center>
        <form method="post" action="${pageContext.request.contextPath }/admin_login.action" id="login_form">
            <table id="login_table">
                <tr>
                    <td id="welcome">WELCOME</td>
                </tr>
                <tr>
                    <td><span>ADMINSTER</span>
                        <span id="span">管理员</span><br/>
                        <input type="text" required="required" name="kname" placeholder="用户名|Adminster" autofocus="autofocus"/></td>
                </tr>
                <tr>
                    <td><span>PASSWORD</span>
                        <span id="span">密&nbsp;&nbsp;码</span><br/>
                        <input type="password" required="required" name="kpassword" placeholder="密码|Password" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="登录|Login..." /></td>
                </tr>
                <tr>
                    <td id="password_forget">
                        <a href="#">忘记密码？|Forget Password</a>
                    </td>
                </tr>
            </table>
        </form>
    </body>

</html>
