<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
    <style type="text/css">
    form,input[type="submit"],input[type="reset"],input[type="button"]{
		font-family: "微软雅黑";
		font-size:15px;
	}
	#centerContent{
		text-align: center;
	}
    </style>
  </head>
  
  <body>
    <div id="centerContent">
    <form id="userAction_save_do" action="${pageContext.request.contextPath}/discuss_update.action" method="post">
			<input type="hidden" id="userAction_save_do_logonName" name="did" value="<s:property value="model.did"/>"/>
			评论内容：<%-- <input type="text" id="userAction_save_do_logonName" name="dcontent" value="<s:property value="model.dcontent"/>" /> --%>
			<br />
			<textarea id="userAction_save_do_logonName" name="dcontent" cols="30%" rows="10%"><s:property value="model.dcontent"/></textarea>
			<br />
			评论时间：<input type="text"  name="ddate" value="<s:property value="model.ddate"/>" disabled="disabled" /><br />
			点赞数量：<input type="text"  name="good" value="<s:property value="model.good"/>" disabled="disabled" /><br />
			差评数量：<input type="text"  name="bad" value="<s:property value="model.bad"/>" disabled="disabled" /><br />
			作品名称：<input type="text"  name="model.works.wname" value="<s:property value="model.works.wid"/>" disabled="disabled" /><br />
			用户名称：<input type="text"  name="model.user.username" value="<s:property value="model.user.username"/>" disabled="disabled" /><br />
			<input type="submit" id="userAction_save_do_submit" value="提交" />&nbsp;
			<input type="reset" value="重置" />&nbsp;
			<input type="button" value="返回" onclick="history.go(-1)" />
		</form>
	</div>
  </body>
</html>
