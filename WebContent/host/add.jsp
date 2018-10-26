<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../demo.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/locale/easyui-lang-zh_CN.js"></script>
<!-- 日期插件，使用jquery -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jquery/jquery.datepick.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery.datepick.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery.datepick-zh-CN.js"></script>

</head>
<script type="text/javascript">
	
</script>
<body>




	<h2>战绩添加</h2>
	<!-- <div style="margin: 20px 0;"></div> -->
	<form action="${pageContext.request.contextPath }/hostAction_save"
		method="post">
		<div class="easyui-panel" style="width: 400px; padding: 30px 60px">

			<!-- <div style="margin-bottom: 20px">
				<div>战绩日期:</div>
				<input id="timeId" class="easyui-textbox" data-options="prompt:''"
					style="width: 100%; height: 32px" name="mydate">
			</div> -->
			<p>战绩日期:</p>
			<input class="easyui-datebox" data-options="onSelect:onSelect" name="mydate"></input>
			<div style="margin: 10px 0">
				<span id="result"></span>
			</div>
			<script>
				function onSelect(date) {
				/* 	$('#result').text(date)
 */				$('#result').datepick({
					//dateFormat : 'yy-mm-dd'
					dateFormat : 'yyyy-mm-dd'
				})
				
				}
			</script>





			<div style="margin-bottom: 20px">
				<div>战斗目标:</div>
				<input class="easyui-textbox" style="width: 100%; height: 32px"
					name="target">
			</div>
			<div style="margin-bottom: 20px">
				<div>获得金额:</div>
				<input class="easyui-textbox" style="width: 100%; height: 32px"
					name="getmoney">
			</div>
			<div style="margin-bottom: 20px">
				<div>战斗日志:</div>
				<input class="easyui-textbox" data-options="prompt:'记录下你的辉煌战绩'"
					style="width: 100%; height: 32px" name="event">
			</div>

			<div>
				<!-- <a href="" class="easyui-linkbutton" iconCls="icon-ok"
					style="width: 100%; height: 32px">Register</a> -->
				<input type="hidden" name="id" value="1">
				<input type="hidden" name="totalmoney" value="1">
				<input type="hidden" name="speed" value="1">
				<input type="submit" value="确定" style="width: 61.8%; height: 32px">
			</div>
		</div>
	</form>

	<!-- <div>
			<label for="name">战绩日期:</label>
			<input class="easyui-validatebox" type="text" name="mydate"
				data-options="required:true" />
		</div>
		<div>
			<label for="email">战斗目标:</label>
			<input class="easyui-validatebox" type="text" name="target"
				data-options="required:true" />
		</div>
		<div>
			<label for="email">获得金额:</label>
			<input class="easyui-validatebox" type="text" name="getmoney"
				data-options="required:true" />
		</div>
		<div>
			<label for="email">已完成储蓄:</label>
			<input class="easyui-validatebox" type="text" name="totalmoney"
				data-options="required:true" />
		</div>
		<div>
			<label for="email">进度:</label>
			<input class="easyui-validatebox" type="text" name="speed"
				data-options="required:true" />
		</div>
		<div>
			<label for="email">战斗日志:</label>
			<input class="easyui-validatebox" type="text" name="event"
				data-options="required:true" />
		</div> -->
</body>
</html>