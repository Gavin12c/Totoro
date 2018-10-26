<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
	<h2>恭喜添加成功!</h2>
	<p></p>
	<a href="${pageContext.request.contextPath }/host/add.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-back"><font size="4" color="green">返回添加</font></a><br/>
	<br/>
	<input type="image" src="${pageContext.request.contextPath }/mytotoro.png" border="1px" >
</body>
</html>