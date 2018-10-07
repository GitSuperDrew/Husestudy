<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript">
			function addMotto(){
				window.location.href = "${pageContext.request.contextPath}/admin/motto/add.jsp";
			}
		</script>
		
		<!-- Bootstrap -->
		<link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/admin/assets/styles.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/admin/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
		<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/vendors/flot/excanvas.min.js"></script><![endif]-->
		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
		<script src="${pageContext.request.contextPath}/admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
		<script type="text/javascript">
			function addUser(){
				window.location.href = "${pageContext.request.contextPath}/admin/user/add.jsp";
			}
		</script>
	</HEAD>
	<body>
		<div class="row-fluid">
			<!-- block -->
			<div class="block">
				<div class="navbar navbar-inner block-header">
					<div class="muted pull-left">格言列表</div>
				</div>
				<form action="${ pageContext.request.contextPath }/mottoAdmin_exportMottoToExcel.action" method="POST" onsubmit="return exportExcel();">
				<div class="block-content collapse in">
					<div class="span12">
						<div class="table-toolbar">
							<div class="btn-group">
								<a href="#"><button onclick="addMotto()" class="btn btn-success">添加格言<i class="icon-plus icon-white"></i></button></a>
								<input type="button" onclick="getAllChk()" value="选择本页全部" class="btn btn-success"/>
								<input type="button" onclick="letChkVal()" value="取消本页选择" class="btn btn-success"/>
								<input type="button" onclick="changeChkStatus()" value="全选/反选" class="btn btn-success"/>
							</div>
							<div class="btn-group pull-right">
								<button data-toggle="dropdown" class="btn dropdown-toggle">导出到本地 <span class="caret"></span></button>
								<ul class="dropdown-menu">
									<li><a href="#"><button>导出Excel</button></a></li>
								</ul>
							</div>
						</div>
	<script type="text/javascript">
		function exportExcel(){
			var checkedNum = document.getElementsByName("selectedRow");
		    check_val = [];  //此value数组，是发送信息编号。
		    for(k in checkedNum){
		        if(checkedNum[k].checked)
		            check_val.push(checkedNum[k].value);
		    }
		    if(check_val.length > 0){
		    	return true;
		    }else{
		    	return false;
		    }
		}
		function getAllChk(){
			var chk = document.getElementsByName("selectedRow");
			for (k in chk) {
				chk[k].checked = true;
			}
		}
		function letChkVal(){
			var chk = document.getElementsByName("selectedRow");
			for (k in chk) {
				chk[k].checked = false;
			}
		}
		function changeChkStatus(){
			var chk = document.getElementsByName("selectedRow");
			for (k in chk) {
				if (chk[k].checked) {
					chk[k].checked = false;
				} else{
					chk[k].checked = true;
				}
			}
		}
	</script>
						<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example2">
							<thead>
								<tr>
									<th>选择</th>
									<th>编号</th>
									<th>作者</th>
									<th>内容</th>
									<th>全部信息</th>
									<th>上传时间</th>
									<th>编辑</th>
									<th>删除</th>
								</tr>
							</thead>
							<tbody>
							<s:iterator var="motto" value="mottoList" status ="status">
								<tr class="odd gradeA">
									<td><input type="checkbox" id="selectedRow" name="selectedRow" value="<s:property value="#motto.motto_id"/>"></td>
									<td style="cursor:hand" align="center"><s:property value="#motto.motto_id"/></td>
									<td style="cursor:hand" align="center"><s:property value="#motto.motto_author"/></td>
									<td style="cursor:hand" align="center"><s:property value="#motto.motto_content"/></td>
									<td style="cursor:hand" align="center"><s:property value="#motto.motto_message"/></td>
									<td style="cursor:hand" align="center"><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm:ss}',{#motto.motto_time})}"/></td>
									
									<td align="center" style="HEIGHT: 22px">
										<a href="${ pageContext.request.contextPath }/mottoAdmin_edit.action?motto_id=<s:property value="#motto.motto_id"/>">
											<img src="${pageContext.request.contextPath}/admin/images/i_edit.gif" border="0" style="CURSOR: hand">
										</a>
									</td>
									<td align="center" style="HEIGHT: 22px">
										<a href="${ pageContext.request.contextPath }/mottoAdmin_delete.action?motto_id=<s:property value="#motto.motto_id"/>" onclick="return confirm('确定要删除吗？')">
											<img src="${pageContext.request.contextPath}/admin/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
										</a>
									</td>
								</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
				</form>
			</div>
			<!-- /block -->
		</div>
		
		
		<script src="${pageContext.request.contextPath}/admin/vendors/jquery-1.9.1.js"></script>
		<script src="${pageContext.request.contextPath}/admin/bootstrap/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/admin/vendors/datatables/js/jquery.dataTables.min.js"></script>

		<script src="${pageContext.request.contextPath}/admin/assets/scripts.js"></script>
		<script src="${pageContext.request.contextPath}/admin/assets/DT_bootstrap.js"></script>
	</body>
</HTML>

