<%@page import="my.manager.movie.MovieDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String configFolder = config.getServletContext().getRealPath("/poster/");
	
	int maxSize = 1024*1024*5; 
	String encoding="UTF-8"; 
	MultipartRequest mr = new MultipartRequest(request,configFolder,maxSize,encoding,new DefaultFileRenamePolicy());;
	String message = null, url = null;
	
	
	MovieDao mdao = MovieDao.getInstance();
	int cnt = mdao.insertMovie(mr); 
	
	if(cnt != -1){
		message = "영화 등록 성공";
		url = "movie_list.jsp";
	}
	else{
		message = "영화 등록 실패";
		url = "movieForm.jsp";
	}
	
%>

<script type="text/javascript">
	alert("<%= message %> "); 
	location.href= '<%= url %>';
</script>
