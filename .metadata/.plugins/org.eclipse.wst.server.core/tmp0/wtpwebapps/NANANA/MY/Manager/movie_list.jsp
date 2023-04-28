<%@page import="java.util.ArrayList"%>
<%@page import="my.manager.movie.MovieBean"%>
<%@page import="my.manager.movie.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>영화 목록 페이지</title>

<%
	MovieDao mdao = MovieDao.getInstance();
	ArrayList<MovieBean> mlist =  mdao.getAllMovie();
%>

<style type="text/css">
	.mtable{
		text-align: center;
		font-family: 'Nanum Pen Script', cursive;
		width : 95%;
	}
	.mtable td{
		border-bottom: 0.3px dotted white;
	}
	.mtable td:firth-child{
		border-top: 0.3px dotted white;
	}
	.mtable td a{
		color : #E4F7BA;
	}
	.mtable td .update_a:hover{
		color : #6799FF;
	}
	.mtable td .delete_a:hover{
		color : #CC3D3D;
	}

</style>

<%@ include file="manager_top.jsp" %>
	<td colspan="3">
		<br>
		<table class="mtable">
			<tr>
				<td height="50">번호</td>
				<td>제목</td>
				<td>이미지명</td>
				<td>장르</td>
				<td>영화 길이</td>
				<td>개봉일</td>
				<td>관람 가능 나이</td>
				<td>감독</td>
				<td>주요 배우</td>
				<td>국가</td>
				<td>예매율</td>
				<td>평점</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
	<%
		if(mlist.size() == 0){
	%>
			<tr>
				<td colspan="12">등록된 영화가 없습니다.</td>
			</tr>
	<%		
		}
		for(MovieBean mb : mlist){
	%>
			<tr>
				<td><%= mb.getMno() %></td>
				<td><%= mb.getMname() %></td>
				<td><%= mb.getPoster() %></td>
				<td><%= mb.getGenre() %></td>
				<td><%= mb.getRunning_time() %>분</td>
				<td><%= mb.getMdate() %></td>
				<%
					if(mb.getMage() == 0){
				%>
						<td>전체 이용가</td>
				<%	
					}
					else{
				%>	
					<td><%= mb.getMage() %>세 이상</td>
				<%
					}
				%>
				<td><%= mb.getDirector() %></td>
				<td><%= mb.getActor() %></td>
				<td><%= mb.getCountry() %></td>
				<td><%= mb.getReser_rate() %>%</td>
				<td><%= mb.getStar_rate() %>/5</td>
				<td><a class="update_a" href="movie_update.jsp?mno=<%= mb.getMno() %>">수정</a></td>
				<td><a class="delete_a" href="movie_delete.jsp?mno=<%= mb.getMno() %>&poster=<%= mb.getPoster() %>">삭제</a></td>
	<%	
		}
	%>
			</tr>
		</table>
		<br>
	</td>
<%@ include file="manager_bottom.jsp" %>