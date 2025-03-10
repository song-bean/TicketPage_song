<%@page import="my.manager.cinema.CinemaBean"%>
<%@page import="my.manager.cinema.CinemaDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.manager.movie.MovieBean"%>
<%@page import="my.manager.movie.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>극장 목록 수정 페이지</title>

<%
	String cno = request.getParameter("cno");
	CinemaDao cdao = CinemaDao.getInstance();
	CinemaBean cb = cdao.getCinemaByCno(cno); 
%>

<style type="text/css">
	.ctable{
		text-align: center;
		font-family: 'Nanum Pen Script', cursive;
		width : 50%;
	}
	#i1{
		background-color: #353535;
		color : white;
	}
	.ctable td:first-child{
		color : #E4F7BA;
	}
	#sub{
		background: #E4F7BA;
		color : #353535;
		font-size: 20px;
		border-radius: 10px;
	}
	.tel{
		border : 0.5px solid white;
		height: 30px;
		text-align: left;
	}
</style>


<%
	String[] genre = {"액션","애니메이션","스릴러","공포","드라마","판타지","코미디","다큐멘터리"};
%>

<%@ include file="manager_top.jsp" %>
	<td colspan="3">
	<br>
		<form method="post" action="cinema_update_Proc.jsp">
			<input type="hidden" name="cno" value="<%= cb.getCno() %>">
			<table class="ctable">
				<tr>
					<td>극장 이름</td>
					<td><input type="text" class="form-control" name="cname" id="i1" required value="<%= cb.getCname() %>"></td>
				</tr>
				
				<tr>
					<td>좌석 수</td>
					<td><input type="text" class="form-control" name="seat" id="i1" placeholder="숫자로 입력(최대 299석)" required value="<%= cb.getSeat() %>"></td>
				</tr>
				
				<tr>
					<td>주소</td>
					<td><input type="text" class="form-control" name="address" id="i1" required value="<%= cb.getAddress() %>"></td>
				</tr>
				
				<tr>
					<td>전화번호</td>
					<td class="tel">
						&nbsp;&nbsp;
						<input type="text" name="tel1" size="4" maxlength="4" style="background : #353535; border : 0.1px solid white;" value="<%= cb.getTel1() %>">-
						<input type="text" name="tel2" size="4" maxlength="4" style="background : #353535; border : 0.1px solid white;" value="<%= cb.getTel2() %>">
					</td>
				</tr>
				<tr>
					<td colspan="2" height="40">
						<br>
						<input type="submit" value="극장 목록 수정" id="sub">
					</td>
				</tr>
			</table>
		</form>
		<br>
	</td>
<%@ include file="manager_bottom.jsp" %>