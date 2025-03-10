<%@page import="my.manager.snack.SnackDao"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String configFolder = config.getServletContext().getRealPath("/images/");
	
	int maxSize = 1024*1024*5; 
	String encoding="UTF-8"; 
	MultipartRequest mr = new MultipartRequest(request,configFolder,maxSize,encoding,new DefaultFileRenamePolicy());
	
	SnackDao sdao = SnackDao.getInstance();
	
	String simage = "이미지 없음";
	
	if(!mr.getParameter("simage").equals("이미지 없음")){
		File delFile = new File(configFolder, mr.getParameter("simage"));
		if(mr.getFilesystemName("simage") != null){ //기존 이미지 o, 새 이미지 o => 기존 이미지 삭제하고 새 이미지 넣기 
			if(delFile.delete()){ 
				%>
					<script type="text/javascript">
						alert("기존 이미지 삭제 성공"); 
					</script>		
				<% 		
				simage = mr.getFilesystemName("simage");
			}
		}
		else{ //기존 이미지 o, 새 이미지 x => 기존 이미지 삭제  
			if(delFile.delete()){ 
				%>
					<script type="text/javascript">
						alert("기존 이미지 삭제 성공"); 
					</script>		
				<% 		
			}
		}
	}
	else{ 
		if(mr.getFilesystemName("simage") != null){ //기존 이미지 x, 새 이미지 o => 새 이미지 바로 넣기 
			simage = mr.getFilesystemName("simage");
		}
	}
	
	String message = null, url = null;
	int cnt = sdao.updateSnack(mr, simage);  
	if(cnt != -1){
		message = "스낵 수정 성공";
		url = "snack_list.jsp";
	}
	else{
		message = "스낵 수정 실패";
		url = "snack_list.jsp?mno=" + mr.getParameter("sno");
	}
	
%>

<script type="text/javascript">
	alert("<%= message %> "); 
	location.href= '<%= url %>';
</script>
