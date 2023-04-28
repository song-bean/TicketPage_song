<%@page import="my.manager.snack.SnackDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String configFolder = config.getServletContext().getRealPath("/images/");
	
	int maxSize = 1024*1024*5; 
	String encoding="UTF-8"; 
	MultipartRequest mr = new MultipartRequest(request,configFolder,maxSize,encoding,new DefaultFileRenamePolicy());;
	String message = null, url = null;
	
	
	SnackDao sdao = SnackDao.getInstance();
	int cnt = sdao.insertSnack(mr);  
	
	if(cnt != -1){
		message = "스낵 등록 성공";
		url = "snack_list.jsp";
	}
	else{
		message = "스낵 등록 실패";
		url = "snackForm.jsp";
	}
	
%>

<script type="text/javascript">
	alert("<%= message %> "); 
	location.href= '<%= url %>';
</script>
