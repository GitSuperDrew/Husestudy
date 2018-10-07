<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加作品</title>
		<!-- Bootstrap -->
		<link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/admin/assets/styles.css" rel="stylesheet" media="screen">
		<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <!-- 学校Logo -->
    	<link rel="icon" href="${pageContext.request.contextPath}/images/logo/HomeLogo.jpg" type="image/x-icon"/>
    
		<script src="${pageContext.request.contextPath}/admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	</head>

	<body>
		<!-- block -->
		<div class="block">
			<div class="navbar navbar-inner block-header">
				<div class="muted pull-left">添加作品</div>
			</div>
			<div class="block-content collapse in">
				<div class="span12">
					<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/works_save.action" method="post" class="form-horizontal" enctype="multipart/form-data">
						<fieldset>
							<legend>作品添加</legend>
							<div class="control-group">
								<label class="control-label" for="focusedInput">作品编号</label>
								<div class="controls">
									<input class="input-xlarge focused" name="wid" disabled="disabled" id="userAction_save_do_logonName" type="text" value="作品编号，系统自动生成，无需填写"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="focusedInput">作品名称</label>
								<div class="controls">
									<input class="input-xlarge focused" name="wname" id="userAction_save_do_logonName" required="required" type="text">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="focusedInput">作品简述</label>
								<div class="controls">
									 <div class="span12" id="content">
					                    <div class="row-fluid">
					                        <!-- block  -->
					                        <!-- <textarea rows="15" cols="20"  name="wcontent" style="width:480px;height:310px;overflow:scroll;resize:none;" required="required"></textarea> -->
					                        <div class="block">
					                            <div class="navbar navbar-inner block-header">
					                                <div class="muted pull-left">CKEditor Standard</div>
					                            </div>
					                            <div class="block-content collapse in">
					                               <textarea id="ckeditor_standard" name="wcontent"></textarea>
					                            </div>
					                        </div>
					                        <script src="${pageContext.request.contextPath}/admin/vendors/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
        <script src="${pageContext.request.contextPath}/admin/vendors/jquery-1.9.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/bootstrap/js/bootstrap.min.js"></script>
					                        <script src="${pageContext.request.contextPath}/admin/vendors/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
		<script src="${pageContext.request.contextPath}/admin/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>

		<script src="${pageContext.request.contextPath}/admin/vendors/ckeditor/ckeditor.js"></script>
		<script src="${pageContext.request.contextPath}/admin/vendors/ckeditor/adapters/jquery.js"></script>

		<script type="text/javascript" src="${pageContext.request.contextPath}/admin/vendors/tinymce/js/tinymce/tinymce.min.js"></script>

        <script src="${pageContext.request.contextPath}/admin/assets/scripts.js"></script>
        <script>
        $(function() {
            // Bootstrap
            $('#bootstrap-editor').wysihtml5();

            // Ckeditor standard
            $( 'textarea#ckeditor_standard' ).ckeditor({width:'98%', height: '150px', toolbar: [
				{ name: 'document', items: [ 'Source', '-', 'NewPage', 'Preview', '-', 'Templates' ] },	// Defines toolbar group with name (used to create voice label) and items in 3 subgroups.
				[ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ],			// Defines toolbar group without name.
				{ name: 'basicstyles', items: [ 'Bold', 'Italic' ] }
			]});
            $( 'textarea#ckeditor_full' ).ckeditor({width:'98%', height: '150px'});
        });
        </script>
					                        
					                        <!-- /block -->
					                    </div>
					                </div>
					                <!--/.fluid-container-->
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="focusedInput">作品图片</label>
								<div class="controls">
									<input type="file" name="upload" accept="image/*"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="focusedInput">作品视频</label>
								<div class="controls">
									<input type="file" name="uploadVedio" accept="video/*"/>
								</div>
								<s:fielderror/>
							</div>
							<div class="control-group">
								<label class="control-label" for="focusedInput">用户账号</label>
								<div class="controls">
									<input type="text" name="uid" disabled="disabled" value="<s:property value="#session.existUser.uid"/>"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="focusedInput">提交时间</label>
								<div class="controls">
									<input type="text" name="wdate" disabled="disabled" value='当前时间为系统时间，无需填写'/>
								</div>
							</div>

							<div class="form-actions">
								<button type="submit" id="userAction_save_do_submit" class="btn btn-primary">提交</button>
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
		<script type="text/javascript" src="${pageContext.request.contextPath }/admin/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
		<script src="${pageContext.request.contextPath }/admin/assets/form-validation.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery_Validation_messages_zh.js" ></script>
		
	</body>
</html>