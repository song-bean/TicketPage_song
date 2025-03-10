<%@page import="java.util.ArrayList"%>
<%@page import="my.manager.movie.MovieBean"%>
<%@page import="my.manager.movie.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>영화 등록 페이지</title>

<%
	MovieDao mdao = MovieDao.getInstance();
%>

<style type="text/css">
	.mtable{
		text-align: center;
		font-family: 'Nanum Pen Script', cursive;
		width : 50%;
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


<%
	String[] genre = {"액션","애니메이션","스릴러","공포","드라마","판타지","코미디","다큐멘터리"};
%>

<%@ include file="manager_top.jsp" %>
	<td colspan="3">
	<br>
		<form method="post" enctype="multipart/form-data" action="movieProc.jsp">
			<table class="mtable">
				<tr>
					<td>영화 제목</td>
					<td><input type="text" class="form-control" name="mname" id="i1" required></td>
				</tr>
				
				<tr>
					<td>영화 포스터</td>
					<td><input type="file" class="form-control" name="poster" id="i1"></td>
				</tr>
				
				<tr>
					<td>장르</td>
					<td style="border : 0.5px solid white" height="30">
					<%
						for(int i=0;i<genre.length;i++){
					%>
						<input type="checkbox" value="<%= genre[i] %>" name="genre"><%= genre[i] %>
					<%
						}
					%>	
					</td>
				</tr>
				
				<tr>
					<td>영화 길이(분)</td>
					<td><input type="text" class="form-control" name="running_time" id="i1" placeholder="숫자로 입력"></td>
				</tr>
				
				<tr>
					<td>개봉일</td>
					<td><input type="date" class="form-control" name="mdate" id="i1"></td>
				</tr>
				
				<tr>
					<td>관람 가능 나이</td>
					<td><input type="text" class="form-control" name="mage" id="i1" placeholder="숫자로 입력"></td>
				</tr>
				
				<tr>
					<td>감독</td>
					<td><input type="text" class="form-control" name="director" id="i1"></td>
				</tr>
				
				<tr>
					<td>배우</td>
					<td><input type="text" class="form-control" name="actor" id="i1"></td>
				</tr>
				
				<tr>
					<td>국가</td>
					<td><input type="text" class="form-control" name="country" id="i1"></td>
				</tr>
				
				<tr>
					<td>예매율</td>
					<td><input type="text" class="form-control" name="reser_rate" id="i1" placeholder="숫자로 입력"></td>
				</tr>
				
				<tr>
					<td>평점</td>
					<td><input type="text" class="form-control" name="star_rate" id="i1" placeholder="숫자로 입력"></td>
				</tr>
				<tr>
					<td colspan="2" height="40">
						<br>
						<input type="submit" value="영화 등록" id="sub">
					</td>
				</tr>
			</table>
		</form>
		<br>
	</td>
<%@ include file="manager_bottom.jsp" %>