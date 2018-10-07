<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
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
					<div class="muted pull-left">用户信息--添加</div>
				</div>
				<div class="block-content collapse in">
					
					<div class="span12">
						<!-- BEGIN FORM-->
						<form action="${pageContext.request.contextPath }/userAdmin_save.action" method="post" id="form_sample_1" class="form-horizontal">
							<fieldset>
								<div class="alert alert-error hide">
									<button class="close" data-dismiss="alert"></button> ERROR!你填写的信息有些错误!请检查。
								</div>
								<div class="alert alert-success hide">
									<button class="close" data-dismiss="alert"></button> Sucessful!表单填写信息成功！
								</div>
								<div class="control-group">
									<label class="control-label">用户名字<span class="required">*</span></label>
									<div class="controls">
										<input type="text" name="username" required="required" data-required="1" class="span6 m-wrap" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">授予密码<span class="required">*</span></label>
									<div class="controls">
										<input type="text" name="password" required="required" data-required="1" class="span6 m-wrap" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">真实姓名<span class="required">*</span></label>
									<div class="controls">
										<input type="text" name="name" data-required="1" class="span6 m-wrap" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">现任角色<span class="required">*</span></label>
									<div class="controls">
										<select class="span6 m-wrap" name="category">
											<option value="">--请选择（学生/老师）--</option>
											<option value="student">学生</option>
											<option value="teacher">老师</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">院系/专业<span class="required">*</span></label>
									<div class="controls">
										<select id="college" class="span3 m-wrap" name="college">
											<option value="">--请选择（学院）--</option>
											<option value="0">理学院</option>
											<option value="1">马克思主义学院</option>
											<option value="2">经济与管理学院</option>
											<option value="3">人文与社会科学学院(教师教育学院)</option>
											<option value="4">体育学院</option>
											<option value="5">外国语学院</option>
											<option value="6">传媒学院</option>
											<option value="7">电子与信息工程学院</option>
											<option value="8">土木与环境工程学院</option>
											<option value="9">化学与生物工程学院</option>
											<option value="10">音乐与舞蹈学院</option>
											<option value="11">美术与艺术设计学院</option>
										</select>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<select id="major" class="span3 m-wrap" name="major">
											<option>--请选择（专业）--</option>
										</select>
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">联系电话<span class="required">*</span></label>
									<div class="controls">
										<input name="phone" type="tel" class="span6 m-wrap" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">电子邮箱<span class="required">*</span></label>
									<div class="controls">
										<input name="email" id="email" required="required" type="email" class="span6 m-wrap" />
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" id="submit" class="btn btn-primary">提交</button>
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
				
				
				//院系/专业 ----二级联动
				var cities = [
					["信息与计算科学", "数学与应用数学", "物理学"],
					["思想政治教育专业"],
					["国际经济与贸易", "市场营销", "旅游管理", "金融工程", "统计学", "财务管理"],
					["汉语言文学专业", "法学专业"],
					["体育教育本科专业"],
					["日语", "英语", "商务英语"],
					["广告", "广播电视学", "广播电视编导", "数字媒体技术"],
					["电子科学与技术", "电子信息工程", "通信工程", "计算机科学与技术", "软件工程", "教育技术学", "机械设计制造及其自动化"],
					["工程管理", "土木工程", "测绘工程"],
					["化学(师范)", "材料化学", "生物工程", "生物技术", "食品质量与安全", "制药工程"],
					["音乐学", "舞蹈学"],
					["环境艺术设计", "视觉传达设计", "产品造型设计", "美术学"]
				];
				var $major = $("#major");
				// 获得代表学院的下拉列表
				$("#college").change(function() {
					// 清空第二个列表中的内容
					$major.get(0).options.length = 1;
					var val = this.value;
					// 遍历并且判断
					$.each(cities, function(i, n) {
						// 判断
						if(i == val) {
							$(n).each(function(j, m) {
								$major.append("<option>" + m + "</option>");
							});
						}
					});
				});
				
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