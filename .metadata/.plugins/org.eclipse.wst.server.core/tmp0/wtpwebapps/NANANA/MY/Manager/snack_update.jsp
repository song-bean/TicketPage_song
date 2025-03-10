<%@page import="my.manager.snack.SnackBean"%>
<%@page import="my.manager.snack.SnackDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>스낵 목록 수정 페이지</title>

<%
	String sno = request.getParameter("sno");
	SnackDao sdao = SnackDao.getInstance();
	SnackBean sb = sdao.getSnackBySno(sno); 
%>

<style type="text/css">
	.mtable{
		text-align: center;
		font-family: 'Nanum Pen Script', cursive;
		width : 70%;
	}
	#i1{
		background-color: #353535;
		color : white;
	}
	.mtable td:first-child{
		color : #E4F7BA;
	}
	#sub{
		background: #E4F7BA;
		color : #353535;
		font-size: 20px;
		border-radius: 10px;
	}
</style>

<%@ include file="manager_top.jsp" %>
	<td colspan="3">
	<br>
		<form method="post" enctype="multipart/form-data" action="snack_update_Proc.jsp">
			<input type="hidden" name="sno" value="<%= sb.getSno() %>">
			<table class="mtable">
				<tr>
					<td rowspan="11" width="200">
				<%
					if(sb.getSimage().equals("이미지 없음")){
				%>
						<font size="50px" color="#F15F5F">이미지<br>준비중</font>
				<%
					}
					else{
				%>
						<img src="<%= request.getContextPath() %>/images/<%= sb.getSimage() %>" width="200">
				<%
					}
				%>	
					</td>
					
					<td style="color : #E4F7BA;">스낵명</td>
					<td><input type="text" class="form-control" name="sname" id="i1" value="<%= sb.getSname() %>" required></td>
				</tr>
				
				<tr>
					<td>스낵 이미지</td>
					<td>
						<input type="file" class="form-control" name="simage" id="i1">
						<input type="hidden" name="simage" value="<%= sb.getSimage() %>">
						</td>
				</tr>
				
				<tr>
					<td>가격</td>
					<td><input type="text" class="form-control" name="sprice" id="i1" value="<%= sb.getSprice() %>" placeholder="숫자로 입력"></td>
				</tr>
				
				<tr>
					<td>스낵 구성</td>
					<td><input type="text" class="form-control" name="scomp" id="i1" value="<%= sb.getScomp() %>"></td>
				</tr>
				
				<tr>
					<td>
					</td>
					<td colspan="2" height="40">
						<br>
						<input type="submit" value="스낵 목록 수정" id="sub">
					</td>
				</tr>
			</table>
		</form>
		<br>
	</td>
<%@ include file="manager_bottom.jsp" %>