<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<!-- Bootstrap -->
		<link href="${pageContext.request.contextPath }/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath }/admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath }/admin/assets/styles.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath }/admin/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
		<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/vendors/flot/excanvas.min.js"></script><![endif]-->
		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
		<script src="${pageContext.request.contextPath }/admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>

	</head>

	<body>
		<!-- validation -->
		<div class="row-fluid">
			<!-- block -->
			<div class="block">
				<div class="navbar navbar-inner block-header">
					<div class="muted pull-left">格言信息--编辑</div>
				</div>
				<div class="block-content collapse in">
					
					<div class="span12">
						<!-- BEGIN FORM-->
						<form method="post" action="${pageContext.request.contextPath}/mottoAdmin_update.action" id="userAction_save_do" class="form-horizontal">
							<input type="hidden" name="motto_id" value="<s:property value="model.motto_id"/>" />
							<fieldset>
								<div class="alert alert-error hide">
									<button class="close" data-dismiss="alert"></button> ERROR!你填写的信息有些错误!请检查。
								</div>
								<div class="alert alert-success hide">
									<button class="close" data-dismiss="alert"></button> Sucessful!表单填写信息成功！
								</div>
								<div class="control-group">
									<label class="control-label">格言作者<span class="required">*</span></label>
									<div class="controls">
										<input type="text" name="motto_author" value="<s:property value="model.motto_author"/>" id="userAction_save_do_logonName" data-required="1" class="span6 m-wrap" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">格言内容<span class="required">*</span></label>
									<div class="controls">
										<input type="text" name="motto_content" value="<s:property value="model.motto_content"/>" id="userAction_save_do_logonName" data-required="1" class="span6 m-wrap" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">格言条目<span class="required">*</span></label>
									<div class="controls">
										<input type="text" name="motto_message" value="<s:property value="model.motto_message"/>" id="userAction_save_do_logonName" data-required="1" class="span6 m-wrap" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">上传时间<span class="required">*</span></label>
									<div class="controls">
										<input type="text" name="motto_time" disabled="disabled" value="<s:property value="model.motto_time"/>" id="userAction_save_do_logonName"class="span6 m-wrap" />
									</div>
								</div>
								
								<div class="form-actions">
									<button type="submit" id="submit1" class="btn btn-primary">提交</button>
									<button type="reset" id="reset" class="btn">重置</button>
									<button type="button" onclick="history.go(-1)" class="btn btn-inverse">返回</button>
								</div>
							</fieldset>
						</form>
						<!-- END FORM-->
					</div>
				</div>
			</div>
			<!-- /block -->
		</div>
		<!-- /validation -->
		
		<script src="${pageContext.request.contextPath }/admin/vendors/jquery-1.9.1.js"></script>
		<script src="${pageContext.request.contextPath }/admin/bootstrap/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/admin/vendors/jquery.uniform.min.js"></script>
		<script src="${pageContext.request.contextPath }/admin/vendors/chosen.jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/admin/vendors/bootstrap-datepicker.js"></script>


		<script type="text/javascript" src="${pageContext.request.contextPath }/admin/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
		<script src="${pageContext.request.contextPath }/admin/assets/form-validation.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery_Validation_messages_zh.js" ></script>

		<script src="${pageContext.request.contextPath }/admin/assets/scripts.js"></script>
		<script>
			jQuery(document).ready(function() {
				FormValidation.init();
			});
			
			//验证表单信息是否达到填写要求
			$(function() {
				$(".datepicker").datepicker();
				$(".uniform_on").uniform();
				$(".chzn-select").chosen();
				$('.textarea').wysihtml5();

				$('#rootwizard').bootstrapWizard({
					onTabShow: function(tab, navigation, index) {
						var $total = navigation.find('li').length;
						var $current = index + 1;
						var $percent = ($current / $total) * 100;
						$('#rootwizard').find('.bar').css({
							width: $percent + '%'
						});
						// If it's the last tab then hide the last button and show the finish instead
						if($current >= $total) {
							$('#rootwizard').find('.pager .next').hide();
							$('#rootwizard').find('.pager .finish').show();
							$('#rootwizard').find('.pager .finish').removeClass('disabled');
						} else {
							$('#rootwizard').find('.pager .next').show();
							$('#rootwizard').find('.pager .finish').hide();
						}
					}
				});
				$('#rootwizard .finish').click(function() {
					alert('Finished!, Starting over!');
					$('#rootwizard').find("a[href*='tab1']").trigger('click');
				});
				
			});
		</script>

	</body>

</html>