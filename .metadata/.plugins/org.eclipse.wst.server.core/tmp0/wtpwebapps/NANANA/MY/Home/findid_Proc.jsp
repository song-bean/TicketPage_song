<%@page import="my.user.userDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	userDao udao = userDao.getInstance();
	
	String uname = request.getParameter("uname");
	int birth = Integer.parseInt(request.getParameter("birth"));
	
	String message = null;
	String url = null;
	String id = udao.findId(uname, birth); 
	if(id != null){
%>
		<script type="text/javascript">
			alert('찾으시는 아이디는 <%= id %>입니다.');
			location.href = '<%= request.getContextPath() %>/MY/Home/loginForm.jsp'; 
		</script>
<%		
	}
	else{
%>
		<script type="text/javascript">
			alert('가입하지 않은 회원입니다.');
			var join = confirm('회원가입 하시겠습니까?');
			
			if(join){
				location.href = '<%= request.getContextPath() %>/MY/Home/joinForm.jsp'; 
			}
			else{
				location.href = '<%= request.getContextPath() %>/MY/Home/home.jsp'; 
			}
		</script>
<%		
	}
%> 

  