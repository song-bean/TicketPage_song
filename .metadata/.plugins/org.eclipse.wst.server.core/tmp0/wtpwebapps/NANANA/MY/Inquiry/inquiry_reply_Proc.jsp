<%@page import="java.sql.Timestamp"%>
<%@page import="my.user.inquiry.inquiryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	inquiryDao idao = inquiryDao.getInstance();
%>

<jsp:useBean id="ib" class="my.user.inquiry.inquiryBean"/>
<jsp:setProperty property="*" name="ib"/>

<%	
	ib.setReg_date(new Timestamp(System.currentTimeMillis()));	 

	String message = null;
	String url = null;
	int cnt = idao.replyInquiry(ib); 
	if(cnt == 1){
		message = "답변이 작성되었습니다."; 
		url = request.getContextPath() + "/MY/Inquiry/inquiry.jsp?pageNum=" + pageNum;
	}
	else{
		message = "답변이 작성되지 못하였습니다.";
		url = request.getContextPath() + "/MY/Inquiry/inquiry_reply.jsp?ino=" +  ib.getIno() + "&pageNum=" + pageNum;
	}
%>

<script type="text/javascript">
	alert("<%= message %> "); 
	location.href= '<%= url %>'; 
</script>
