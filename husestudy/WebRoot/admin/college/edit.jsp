<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>编辑学院</title>
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
	</HEAD>
	
	<body>
		<!-- block -->
		<div class="block">
			<div class="navbar navbar-inner block-header">
				<div class="muted pull-left">学院编辑</div>
			</div>
			<div class="block-content collapse in">
				<div class="span12">
					<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/adminCollege_update.action" method="post" class="form-horizontal">
						<fieldset>
							<legend>学院编辑</legend>
							<div class="control-group">
								<label class="control-label" for="focusedInput">学院编号</label>
								<div class="controls">
									<input class="input-xlarge focused" id="userAction_save_do_logonName" type="text" name="cid" value="<s:property value="model.cid"/>"><s:hidden name="college.cid" id="cid"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="focusedInput">学院名字</label>
								<div class="controls">
									<input class="input-xlarge focused" id="userAction_save_do_logonName" type="text" name="cname" value="<s:property value="model.cname"/>">
								</div>
							</div>

							<div class="form-actions">
								<button type="submit" id="userAction_save_do_submit" class="btn btn-primary">确定</button>
								<button type="reset" class="btn">重置</button>
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
</HTML>