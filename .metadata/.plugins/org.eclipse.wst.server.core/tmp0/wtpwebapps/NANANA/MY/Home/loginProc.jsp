<%@page import="my.user.userBean"%>
<%@page import="my.user.userDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	String message = null;
	String url = null;
	
	userDao udao = userDao.getInstance();
	userBean user = udao.getUserInfo(id, password);  
	boolean idCheck = udao.searchId(id);
	
	if(user != null){
		if(user.getId().equals("manager")){ //관리자
			url = request.getContextPath() + "/MY/Home/home.jsp";
		}
		else{ //일반 사용자
			url = request.getContextPath() + "/MY/Home/home.jsp";
		}
		session.setAttribute("sid", id);		
	}
	else{ //로그인 실패
		if(idCheck){
	%>
		<script type="text/javascript">
			alert("비밀번호가 틀렸습니다. "); 
		</script>	
	<%
		}
		else{
	%>	
		<script type="text/javascript">
			alert("가입하지 않은 회원입니다. "); 
		</script>
	<%	
		}
		url = request.getContextPath() + "/MY/Home/loginForm.jsp";
	}
	%>

<script type="text/javascript">
	location.href= '<%= url %>'; 
</script>