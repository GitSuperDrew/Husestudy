<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html>

	<head>
		<title></title>
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
				padding-bottom: 40px;
			}
			
			.sidebar-nav {
				padding: 9px 0;
			}
			
			@media (max-width: 980px) {
				/* Enable use of floated navbar text */
				.navbar-text.pull-right {
					float: none;
					padding-left: 5px;
					padding-right: 5px;
				}
			}
		</style>
	</head>

	<body>
		<form action="{:U('User/edit')}" method="post" class="definewidth m20">
			<input type="hidden" name="id" value="{$user.id}" />
			<table class="table table-bordered table-hover definewidth m10">
				<tr>
					<td width="10%" class="tableleft">用户编号</td>
					<td><input type="text" name="uid" disabled="disabled" value="<s:property value="model.uid"/>" /></td>
				</tr>
				<tr>
					<td width="10%" class="tableleft">用户姓名</td>
					<td><input type="text" name="username" value="<s:property value="model.username"/>" /></td>
				</tr>
				
				<tr>
					<td class="tableleft">修改密码</td>
					<td><input type="password" name="password" value="<s:property value="model.password"/>" /></td>
				</tr>
				<tr>
					<td width="10%" class="tableleft">真实姓名</td>
					<td><input type="text" name="name" value="<s:property value="model.name"/>" /></td>
				</tr>
				<tr>
					<td class="tableleft">担任角色</td>
					<td>
						<select class="span6 m-wrap" name="category">
							<option value="">--请选择（学生/老师）--</option>
							<option value="student" <s:if test="model.job==1">selected</s:if>>学生</option>
							<option value="teacher" <s:if test="model.job==2">selected</s:if>>老师</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="tableleft">电话号码</td>
					<td><input type="tel" name="phone" value="<s:property value="model.phone" />"/></td>
				</tr>
				<tr>
					<td width="10%" class="tableleft">电子邮箱</td>
					<td><input type="email" name="email" value="<s:property value="model.email" />"/></td>
				</tr>
				<tr>
					<td width="10%" class="tableleft">所在学院</td>
					<td>
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
					</td>
				</tr>
				<tr>
					<td width="10%" class="tableleft">所在专业</td>
					<td>
						<select id="majors" class="span3 m-wrap" name="majors">
							<option>--请选择（专业）--</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="tableleft"></td>
					<td>
						<button type="submit" class="btn btn-primary" type="button">保存</button> &nbsp;&nbsp;
						<button type="reset" class="btn " type="button">重置</button> &nbsp;&nbsp;
						<button type="button" class="btn btn-success" onclick="history.go(-1)">返回列表</button>
					</td>
				</tr>
			</table>
		</form>
	</body>

</html>
<script>
	$(function() {
		$('#backid').click(function() {
			window.location.href = "{:U('User/index')}";
		});
		
		//院系/专业 ----二级联动
		var majors = [
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
		var $majors = $("#majors");
		// 获得代表学院的下拉列表
		$("#college").change(function() {
			// 清空第二个列表中的内容
			$majors.get(0).options.length = 1;
			var val = this.value;
			// 遍历并且判断
			$.each(majors, function(i, n) {
				// 判断
				if(i == val) {
					$(n).each(function(j, m) {
						$majors.append("<option>" + m + "</option>");
					});
				}
			});
		});
		
	});

	});
</script>