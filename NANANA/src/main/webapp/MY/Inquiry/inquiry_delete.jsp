<%@page import="my.user.inquiry.inquiryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String ino = request.getParameter("ino");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	inquiryDao idao = inquiryDao.getInstance();
	int cnt = idao.deleteInquiry(ino); 
	
	String message = null;
	String url = null;
	if(cnt == 1){ 
		message = "문의 삭제되었습니다."; 
		
		int pageSize = 10;
		int count =idao.getArticleCount();
		int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
		
		if(pageNum > pageCount){
			url = request.getContextPath() + "/MY/Inquiry/inquiry.jsp?pageNum=" + (pageNum - 1); 
		}
		else{
			url = "inquiry.jsp?pageNum=" + pageNum;
		}
	}
	else{
		message = "문의를 삭제하지 못하였습니다.";
		url = request.getContextPath() + "/MY/Inquiry/inquiry_detail.jsp?ino=" + ino + "&pageNum=" + pageNum;
	}
%>    

<script type="text/javascript">
	alert("<%= message %> "); 
	location.href= '<%= url %>'; 
</script>