 <%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>专业增加</title>
		<!-- Bootstrap -->
		<link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/admin/assets/styles.css" rel="stylesheet" media="screen">
		<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
		<script src="${pageContext.request.contextPath}/admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
		<style type="text/css">
			#attention{
				color:red;
				font-size:15px;
				font-family:"微软雅黑"；
			}
			span{
				color:green;
			}
		</style>
	</head>

	<body>
		<!-- block -->
		<div class="block">
			<div class="navbar navbar-inner block-header">
				<div class="muted pull-left">专业用户对应信息添加</div>
			</div>
			<div class="block-content collapse in">
				<div class="span12">
					<form id="userAction_save_docollege" name="Form1" action="${pageContext.request.contextPath}/major_UserAdmin_save.action" method="post" class="form-horizontal">
						<fieldset>
							<legend>单用户多专业添加&nbsp;&nbsp;&nbsp;&nbsp;
								<span id="attention">注意：请到<span><a href="${pageContext.request.contextPath}/adminMajor_findAll.action">[专业管理]</a></span>和<span><a href="${pageContext.request.contextPath}/userAdmin_findAll.action">[用户管理]</a></span>查找正确后再输入！</span>
							</legend>
							
							<div class="control-group">
								<label class="control-label" for="focusedInput">专业编号</label>
								<div class="controls">
									<input class="input-xlarge focused" name="mid" id="userAction_save_do_logonName" type="text">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="focusedInput">用户名称</label>
								<div class="controls">
									<input class="input-xlarge focused" name="username" id="userAction_save_do_logonName" type="text">
								</div>
							</div>

							<div class="form-actions">
								<button type="submit" id="userAction_save_do_submit" class="btn btn-primary">提交</button>
								<button type="reset" class="btn">取消</button>
								<button type="button" onclick="history.go(-1)" class="btn btn-inverse">返回</button>
							</div>
						</fieldset>
					</form>

				</div>
			</div>
		</div>
		<!-- /block -->
		</div>

	</body>
</html>