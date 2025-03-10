<%@page import="java.sql.Timestamp"%>
<%@page import="my.user.inquiry.inquiryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int ino = Integer.parseInt(request.getParameter("ino"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");

	Timestamp reg_date = new Timestamp(System.currentTimeMillis());
	
	inquiryDao idao = inquiryDao.getInstance();
	int cnt = idao.updateInquiry(ino, subject, content, reg_date);   
	
	String message = null;
	String url = null;
	if(cnt == 1){
		message = "수정되었습니다."; 
		url = request.getContextPath() + "/MY/Inquiry/inquiry_detail.jsp?ino=" + ino+ "&pageNum=" + pageNum;
	}
	else{
		message = "수정 실패하였습니다.";
		url = request.getContextPath() + "/MY/Inquiry/inquiry_update.jsp?ino=" + ino + "&pageNum=" + pageNum;
	}
%>

<script type="text/javascript">
	alert("<%= message %> "); 
	location.href= '<%= url %>'; 
</script>