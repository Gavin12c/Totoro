<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>添加客户</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
</HEAD>

<script type="text/javascript">

	
	/* 一上来就拿数据， 肯定走入口函数 */
	
/* 	$(function(){
		var url = "${pageContext.request.contextPath }/baseDict_findByTypeCode.action"
		//请求
		$.post(url , {dict_type_code : "001"} , function(result){
			
			$(result).each(function(i,n){ //node  n其实就是得到了一个字典对象
				//alert("result="+n.dict_item_name);
			
				$("#cust_industry").append("<option value='"+n.dict_id+"'>"+n.dict_item_name+"</option>");
			});
		} , "json");
	}) */
	
	
	function loadDict(type_code , tagId , saveId){
		var url = "${pageContext.request.contextPath }/baseDict_findByTypeCode.action"
		//请求
		$.post(url , {dict_type_code : type_code} , function(result){
			
			alert("ccc");
			
			$(result).each(function(i,n){ //node  n其实就是得到了一个字典对象
				//alert("result="+n.dict_item_name);
			
				$(tagId).append("<option value='"+n.dict_id+"'>"+n.dict_item_name+"</option>");
			});
			
			
			//回显客户级别的数据 , 其实就是只要打回来，那么会重新请求一次字典数据，然后重新append进去。
				/* 	<select name="cust_level.dict_id" class=textbox id="cust_level" style="WIDTH: 180px;height: 21px">
						<option value="">---请选择---</option>
						<option value="22" selected="selected">普通客户</option>
						<option value="23">VIP客户</option>
					</select>	
				
				2. 取到值栈里面的客户级别的ID值。  22  | 23
				
				3. 把这个从值栈里面去到的值， 丢到select标签里面去， 通过比对value ，找出对应的option标签， 然后让这个option标签选中
				 */
				 
				 /*
				 	$(tagId)： 根据传递进来的标签id找到具体的标签	
				 	
				 	find(): 在这个给定的标签里面找具体的子级标签。
				 	
				 	$(tagId).find("option[value='"+saveId+"']") ： 在指定标签里面，找一个自己标签叫做option的，但是找的时候有条件的去找。
				 	
				 	谁的value值  等于传递进来的saveId ， 那么久表示找到这个option了。
				 	
				 	.attr("selected","selected") ： 找到这个option之后，就让它选中。
				 */
				 $(tagId).find("option[value='"+saveId+"']").attr("selected","selected");
			
		} , "json");
	}
	
	
	$(function(){
		
		
		loadDict("001" , "#cust_industry" ,  "${cust_industry.dict_id}");  //001 --  客户行业
		loadDict("002" , "#cust_source" ,  "${cust_source.dict_id}"); //002 -- 客户来源
		loadDict("006" , "#cust_level" ,  "${cust_level.dict_id}"); //006  ---客户级别
	}) 
	

</script>
<BODY>

	<!-- enctype="application/x-www-form-urlencoded" : 给服务器上传的是一个经过url编码的form表单数据 -->
	<FORM id=form1 name=form1 action="${pageContext.request.contextPath }/customer_save.action" method=post
		enctype="multipart/form-data"
	>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_019.jpg" border=0></TD>
					<TD width="100%" background="${pageContext.request.contextPath }/images/new_020.jpg" height=20></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_021.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15 background="${pageContext.request.contextPath }/images/new_022.jpg">
						<IMG src="${pageContext.request.contextPath }/images/new_022.jpg" border=0>
					</TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD class=manageHead>当前位置：客户管理 &gt; 添加客户</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>						
						<TABLE cellSpacing=0 cellPadding=5  border=0>
							<TR>
								<td>客户名称：</td>
								<td>
									<s:textfield class="textbox" id="sChannel2" style="WIDTH: 180px" maxLength="50" name="cust_name"></s:textfield>
									<!-- <INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="cust_name"> -->
								</td>
								<td>所属行业 ：</td>
								<td>
									
									<select name="cust_industry.dict_id" class=textbox id="cust_industry" style="WIDTH: 180px;height: 21px">
										<option value="">---请选择---</option>
									</select>
								</td>
							</TR>							
							<TR>	
								<td>信息来源 ：</td>
								<td>
									<select name="cust_source.dict_id" class=textbox id="cust_source" style="WIDTH: 180px;height: 21px">
										<option value="">---请选择---</option>
									</select>
								</td>
								<td>客户级别：</td>
								<td>
									<select name="cust_level.dict_id" class=textbox id="cust_level" style="WIDTH: 180px;height: 21px">
										<option value="">---请选择---</option>
									</select>								
								</td>
							</TR>
							<TR>
								<td>联系地址 ：</td>
								<td>
									<s:textfield class="textbox" id="sChannel2" style="WIDTH: 180px" maxLength="50" name="cust_address"></s:textfield>
									<!-- <INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="cust_address"> -->
								</td>
								<td>联系电话 ：</td>
								<td>
									<s:textfield class="textbox" id="sChannel2" style="WIDTH: 180px" maxLength="50" name="cust_mobile"></s:textfield>
									<!-- <INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="cust_mobile"> -->
								</td>
							</TR>
							<TR>
								<td>客户资质 ：</td>
								<td>
									<input type="file" name="upload"/>
								</td>
							</TR>
							<tr>
								<td>
									<INPUT class=button id=sButton2 type=submit value=" 保存 " name=sButton2>
								</td>
								<td>
									${fieldErrors.result[0] }
								</td>
							</tr>
						</TABLE>
					</TD>
					<TD width=15 background="${pageContext.request.contextPath }/images/new_023.jpg">
						<IMG src="${pageContext.request.contextPath }/images/new_023.jpg" border=0>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_024.jpg" border=0></TD>
					<TD align="center" width="100%" background="${pageContext.request.contextPath }/images/new_025.jpg" height=15></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_026.jpg"	border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
	<s:debug></s:debug>
</BODY>
</HTML>
