<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>编辑客户</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
</HEAD>

<script type="text/javascript">

	function loadDict(type_code , tagId , saveId){
		var url = "${pageContext.request.contextPath }/baseDict_findByTypeCode.action"
		//请求
		$.post(url , {dict_type_code : type_code} , function(result){
			
			$(result).each(function(i,n){ //node  n其实就是得到了一个字典对象
				//alert("result="+n.dict_item_name);
			
				$(tagId).append("<option value='"+n.dict_id+"'>"+n.dict_item_name+"</option>");
			});
			
				 $(tagId).find("option[value='"+saveId+"']").attr("selected","selected");
			
		} , "json");
	}
	
	
	$(function(){
		
		
		loadDict("001" , "#cust_industry" ,  "${customer.cust_industry.dict_id}");  //001 --  客户行业
		loadDict("002" , "#cust_source" ,  "${customer.cust_source.dict_id}"); //002 -- 客户来源
		loadDict("006" , "#cust_level" ,  "${customer.cust_level.dict_id}"); //006  ---客户级别
	}) 
	

</script>
<BODY>
	<FORM id=form1 name=form1 action="${pageContext.request.contextPath }/customer_update.action" method=post>
		<input type="hidden" name="cust_id" value="${customer.cust_id}">
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
								<TD class=manageHead>当前位置：客户管理 &gt; 编辑客户</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>						
						<TABLE cellSpacing=0 cellPadding=5  border=0>
							<TR>
								<td>客户名称：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="cust_name" value="${customer.cust_name}">
								</td>
								<td>所属行业 ：</td>
								<td>
									<%-- <INPUT class=textbox id="cust_industry" style="WIDTH: 180px" maxLength=50 name="cust_industry" value="${customer.cust_industry}"> --%>
									
									<select name="cust_industry.dict_id" class=textbox id="cust_industry" style="WIDTH: 180px;height:21px">
										<option value="">---请选择---</option>
									</select>
								</td>
							</TR>							
							<TR>	
								<td>信息来源 ：</td>
								<td>
									<select name="cust_source.dict_id" class=textbox id="cust_source" style="WIDTH: 180px;height:21px">
										<option value="">---请选择---</option>
									</select>
								</td>
								<td>客户级别：</td>
								<td>
									<select name="cust_level.dict_id" class=textbox id="cust_level" style="WIDTH: 180px;height:21px">
										<option value="">---请选择---</option>
									</select>								
								</td>
							</TR>
							<TR>
								<td>联系地址 ：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="cust_address" value="${customer.cust_address}">
								</td>
								<td>联系电话 ：</td>
								<td>
									<INPUT class=textbox id=sChannel2 style="WIDTH: 180px" maxLength=50 name="cust_mobile" value="${customer.cust_mobile}">
								</td>
							</TR>
							<TR>
								<td>客户资质 ：</td>
								<td>
									<img src="${pageContext.request.contextPath}/${customer.cust_image}"/>
								</td>
							</TR>
							<tr>
								<td rowspan=2>
									<INPUT class=button id=sButton2 type=submit value=" 保存 " name=sButton2>
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
