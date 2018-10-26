<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/themes/icon.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/locale/easyui-lang-zh_CN.js"></script>
</head>
	<script type="text/javascript">
	
		$(function(){
			
			$('#dg').datagrid({
				// url:'../datagrid_data1.json',
				url:'${pageContext.request.contextPath }/hostAction_findByPage.action',
			    pagination:true,
			    pageSize:5, //默认是10条
			    pageList:["5","10","15","20"], //供选择每页显示多少条记录
			    columns:[[
					{field:'id',title:'序号',width:50},
					{field:'mydate',title:'战绩日期',width:72},
					{field:'target',title:'战斗目标 ',width:100},/* align:'right' */
					{field:'getmoney',title:'获得金额',width:60,align:'center'},
					{field:'totalmoney',title:'已完成储蓄',width:80,align:'center'},
					{field:'event',title:'战斗日志',width:500,align:'center'},
					{field:'speed',title:'进度',width:80}
			    ]]
			});
			
		})
	</script>

<body>

	<h2>历史战绩</h2>
	<table id="dg"></table>
	
</body>
</html>