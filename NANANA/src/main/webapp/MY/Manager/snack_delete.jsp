<%@page import="my.manager.snack.SnackDao"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	SnackDao sdao = SnackDao.getInstance();

	int sno = Integer.parseInt(request.getParameter("sno"));
	String simage = request.getParameter("simage");
	
	String configFolder = config.getServletContext().getRealPath("/images/");
	File delFile = null;
	
	if(simage != null){
		delFile = new File(configFolder,simage);
		if(delFile.exists()){
			if(delFile.delete()){
				System.out.println("이미지 삭제 완료");
			}
		}
	}
	
	String message = null, url = null;
	int cnt = sdao.deleteSnack(sno); 
	
	if(cnt != -1){
		message = "스낵 삭제 성공";
	}
	else{
		message = "스낵 삭제 실패";
	}
	url = "snack_list.jsp";
	
%>

<script type="text/javascript">
	alert("<%= message %> "); 
	location.href= '<%= url %>';
</script>
