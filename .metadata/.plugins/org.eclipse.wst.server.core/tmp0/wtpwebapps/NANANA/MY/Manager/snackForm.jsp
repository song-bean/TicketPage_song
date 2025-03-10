<%@page import="my.manager.snack.SnackDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>스낵 등록 페이지</title>

<%
	SnackDao sdao = SnackDao.getInstance();
%>

<style type="text/css">
	.stable{
		text-align: center;
		font-family: 'Nanum Pen Script', cursive;
		width : 50%;
	}
	#i1{
		background-color: #353535;
		color : white;
	}
	.stable td:first-child{
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
		<form method="post" enctype="multipart/form-data" action="snackProc.jsp">
			<table class="stable">
				<tr>
					<td>스낵명</td>
					<td><input type="text" class="form-control" name="sname" id="i1" required></td>
				</tr>
				
				<tr>
					<td>스낵 이미지</td>
					<td><input type="file" class="form-control" name="simage" id="i1"></td>
				</tr>
				
				<tr>
					<td>가격</td>
					<td><input type="text" class="form-control" name="sprice" id="i1" placeholder="숫자로 입력"></td>
				</tr>
				
				<tr>
					<td>스낵 구성</td>
					<td><input type="text" class="form-control" name="scomp" id="i1"></td>
				</tr>
				
				<tr>
					<td colspan="2" height="40">
						<br>
						<input type="submit" value="스낵 등록" id="sub">
					</td>
				</tr>
			</table>
		</form>
		<br>
	</td>
<%@ include file="manager_bottom.jsp" %>