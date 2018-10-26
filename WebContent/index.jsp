<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的龙猫</title>
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
	function addTab(title, url) {

		//根据给定的选项卡标题 ，title ，来判断是否已经存在了这个选项卡。
		var exists = $('#tt').tabs('exists', title);

		if (exists) {
			//选中它
			$('#tt').tabs('select', title);
		} else {
			// 添加一个新的标签页面板（tab panel）
			$('#tt')
					.tabs(
							'add',
							{
								title : title,
								content : "<iframe src='"
										+ url
										+ "' style='width: 100%;height: 100%'></iframe>",
								closable : true,
								tools : [ {
									iconCls : 'icon-mini-refresh',
									handler : function() {
										//刷新
									}
								} ]
							});
		}
	}

	function addCustomer() {
		//如果这里的内容还是给字符串进去，那么显示的内容就很单调，永远都是字符串。  但是有时候想显示复杂一点。
		//就要给定url进来
		addTab("添加战绩", "${pageContext.request.contextPath }/host/add.jsp");
	}
	function listCustomer() {
		addTab("战绩列表", "${pageContext.request.contextPath }/host/list.jsp");
	}
	
</script>
<body>


	<!-- 1. 划分区域 -->
	<div id="cc" class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north',title:'顶部菜单',split:true"
			style="height: 120px;">

			<h2>${actionMessages }%</h2>

			<div onclick="window.location.href='${pageContext.request.contextPath }/index.jsp'" class="easyui-progressbar"
				data-options="value:'${actionMessages }'" style="width: 50%;"></div>
		</div>

		<div data-options="region:'west',title:'左侧菜单',split:true"
			style="width: 115px;">

			<!-- 2. 折叠面板 -->
			<div id="aa" class="easyui-accordion" data-options="fit:true">
				<div title="管理面板" data-options="iconCls:'icon-save'"
					style="overflow: auto; padding: 10px;">

					<!-- 3. 添加按钮 -->
					<a id="btn" href="javascript:addCustomer()"
						class="easyui-linkbutton" data-options="iconCls:'icon-add'"
						style="width: 96%">战绩添加</a>
					<br>
					<br>
					<a id="btn" href="javascript:listCustomer()"
						class="easyui-linkbutton" data-options="iconCls:'icon-search'"
						style="width: 96%">历史战绩</a>
				</div>

				<!--  <div title="联系人管理" data-options="iconCls:'icon-reload'" style="padding:10px;">
					content2
			    </div>
			    <div title="客户拜访">
					content3
			    </div> -->

			</div>
		</div>
		<!-- title:'操作面板' -->
		<div data-options="region:'center'"
			style="padding: 5px; background: #eee;">

			<!-- 4. 选项卡 -->

			<div id="tt" class="easyui-tabs" data-options="fit:true"></div>

		</div>
	</div>
</body>

</html>