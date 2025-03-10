<%@page import="my.user.userBean"%>
<%@page import="my.user.userDao"%>
<%@page import="my.user.inquiry.inquiryBean"%>
<%@page import="my.user.inquiry.inquiryDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>문의 작성</title>
<style type="text/css">
	#i1{
		background-color: #353535;
		color : white;
	}
	.itable{
		width: 500px;
		font-size: 20px;
		text-align: center;
	}
	.itable td:first-child{
		color : #E4F7BA;
	}
	#sub{
		background: #E4F7BA;
		color : #353535;
		font-size: 20px;
	}
	.wtable{
		text-align : right;
		font-family: 'Nanum Pen Script', cursive;
		font-size: 20px;
	}
	.wtable input[type='button'], .wtable input[type='submit'], .wtable input[type='reset']{
		background-color: #D4F4FA;
		color : black;
		border : 0.1px solid #353535;
		border-radius: 5px;
	}
	.wtable input[type='button']:hover{
		background-color: #4374D9;;
	}
</style>

<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
function inquiryCheck(){
	if($('input[name=subject]').val() == ""){
		alert('제목을 입력하세요.');
		$('input[name=subject]').focus();
		return false;
	}
	
	if($('textarea[name=content]').val() == ""){
		alert('내용을 입력하세요.');
		$('textarea[name=content]').focus();
		return false;
	}
	
	if($('input[name=passwd]').val() == ""){
		alert('비밀번호를 입력하세요.');
		$('input[name=passwd]').focus();
		return false;
	}
}
</script> 

<%@ include file="../Home/home_top.jsp"%>
	<tr>
		<td align="center" colspan="1" style="color : white" height="20">
    		 <ul class="nav nav-pills nav-justified"> 
		         <li class="dropdown">
		         	  <a href="<%= request.getContextPath() %>/MY/Home/home_movie_list.jsp" id="m1">영화</a>
		         </li>
		         
		         <li class="dropdown">
		         	  <a href="<%= request.getContextPath() %>/MY/Home/home_cinema_list.jsp" id="m1">극장</a>
		         </li>
		         
		         <li class="dropdown">
		         	 <%
		         	if(sid == null){
		         %>
		         	  <a data-toggle="dropdown" href="" id="m1" onclick="ticket_idCheck()">예매
		         	  	 <span class="caret"></span> 	 
		         	  </a>
		        <%
		         	}
		         	else if(sid.equals("manager")){
		         %>
		         	<a data-toggle="dropdown" href="" id="m1" onclick="id_managerCheck()">예매
		         	  	 <span class="caret"></span> 	 
		         	</a>
		         <%		
		         	}
		         	else{
		         %>	 	  	  
		        	  <a data-toggle="dropdown" href="#" id="m1">예매
		         	  	 <span class="caret"></span> 	 
		         	  </a>
		         	   <ul class="dropdown-menu" role="menu" id="mm1"> 
			               <li><a role="menuitem" href="<%= request.getContextPath() %>/MY/Home/Ticket/home_ticket_movie.jsp">영화별 예매</a></li>
			               <li><a role="menuitem" href="<%= request.getContextPath() %>/MY/Home/Ticket/home_ticket_cinema.jsp">극장별 예매</a></li>
			               <li class="divider" style="border : 0.1px solid #4B4B4B;"></li>
			               <li><a role="menuitem" href="<%= request.getContextPath() %>/MY/Home/Ticket/home_ticket_list.jsp">예매 확인 </a></li>
			          </ul>
			     <%
		         	}
			     %>     
		         </li>
		          <li class="dropdown">
		         	  <a class="f2" href="<%= request.getContextPath() %>/MY/Home/home_snack_list.jsp"id="m1">스낵</a>
		         </li>
		     </ul>
		</td>
	</tr>
	
	<tr>
		<td colspan="5" height="10">
			<hr>
		</td>
	</tr>
	
	<tr>
<td colspan="5" align="center" style="font-family: 'Nanum Pen Script', cursive;font-size: 25px;">
	<b>문의 작성</b>
	<br><br>
<form name="writeform" action="<%= request.getContextPath() %>/MY/Inquiry/inquiry_write_Proc.jsp" method="post" onSubmit="return inquiryCheck()">
	<input type="hidden" name="iid" value="<%= sid %>">
	<table class="itable" border="0">
		<tr>
			<td>제목</td>
			<td width="400"><input type="text" class="form-control" name="subject" id="i1"></td>
		</tr>
				
		<tr>
			<td>내용</td>
			<td>
				<textarea class="form-control" name="content" id="i1" rows="5"></textarea>
			</td>
		</tr>
				
		<tr>
			<td>비밀번호</td>
			<td><input type="password" class="form-control" name="passwd" maxlength="6" placeholder="숫자로 입력(6자리)" id="i1"></td>
		</tr>
		<tr>
			<td colspan="2" class="wtable">
				<br>
				<input type="submit" value="문의 작성">
				<input type="reset" value="다시 작성">
				<input type="button" value="목록 보기" onclick="location.href='<%= request.getContextPath() %>/MY/Inquiry/inquiry.jsp';">
			</td>
		</tr>
		
	</table>
</form>

</td>
<%@ include file="../Home/home_bottom.jsp"%>

