<%@page import="my.user.userDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	userDao udao = userDao.getInstance();
%>

<jsp:useBean id="ub" class="my.user.userBean"/>
<jsp:setProperty property="*" name="ub"/>

<%	
	String message = null;
	String url = null;
	int cnt = udao.insertUser(ub);
	if(cnt == 1){
		message = "가입 성공"; 
		url = request.getContextPath() +  "/MY/Home/home.jsp";
	}
	else{
		message = "가입 실패";
		url = request.getContextPath() +  "/MY/Home/joinForm.jsp";
	}
%> 

<script type="text/javascript">
	alert("<%= message %> "); 
	location.href= '<%= url %>'; 
</script>

  