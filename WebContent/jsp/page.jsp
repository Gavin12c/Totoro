<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-1.4.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script> --%>
<script type="text/javascript">
	function to_page(page){
		
		if(page){
			$("#page").val(page);
		}
		
		
		
		var requestPage = $("#page").val();
		var totalPage = "${totalPage}" ;
		
		if(Number(requestPage)  > Number(totalPage)){
			return ;
		}
		
		document.customerForm.submit();	
	}
	
	function changePagesize () {
		document.customerForm.submit();	
	}


</script>
</head>
<body>

	<TR>
		<TD><SPAN id=pagelink>
				<DIV style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
					共[<B>${totalSize}</B>]条记录,[<B>${totalPage}</B>]页 ,每页显示 <select
						name="pageSize" onchange="changePagesize()">
						<option value="5" <c:if test="${pageSize==5 }">selected</c:if>>5</option>
						<option value="10" <c:if test="${pageSize==10 }">selected</c:if>>10</option>
						<option value="15" <c:if test="${pageSize==15 }">selected</c:if>>15</option>
					</select> 条 [

					<!-- if(如果已经是第一页了){
													前一页
												}else{
												 -->

					<s:if test="currentPage == 1">
													前一页
												</s:if>
					<s:else>
						<A href="javascript:to_page(${currentPage-1})">前一页</A>
					</s:else>


					] <B>${currentPage}</B> [
					<s:if test="currentPage == totalPage">
														后一页
													</s:if>
					<s:else>
						<A href="javascript:to_page(${currentPage+1})">后一页</A>
					</s:else>
					] 到 <input type="text" size="3" id="page" name="currentPage" /> 页

					<input type="button" value="Go" onclick="to_page()" />
				</DIV>
		</SPAN></TD>
	</TR>
</body>
</html>