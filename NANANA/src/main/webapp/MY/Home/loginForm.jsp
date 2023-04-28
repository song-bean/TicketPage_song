<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>로그인 페이지</title>
<style type="text/css">
	#sub,#btn1,#btn2{
		background-color: #353535;
		color : white;
	}
</style>

<%@ include file="home_top.jsp"%>
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
<td colspan="5" align="center">
	<form name="loginform" action="<%= request.getContextPath() %>/MY/Home/loginProc.jsp" method="post">
		<table border="0" width="30%">
			<tr>
				<td align="left" colspan="2">
					<h5>아이디</h5>
						<input type="text" class="form-control" name="id" value="manager">
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<h5>비밀번호</h5>
					<input type="password" class="form-control" name="password" value="qwerty123!">
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
				<br>
					<input type="submit" value="로그인" class="form-control" id="sub">
				<br>
				</td>
			</tr>
			
			<tr>	
				<td>
					<input type="button" value="아이디 찾기" class="form-control" id="btn1" onclick="location.href='findid_Form.jsp'">
				</td>
				<td>	
					<input type="button" value="비밀번호 찾기" class="form-control" id="btn2" onclick="location.href='findpw_Form.jsp'">
				</td>
			</tr>
			
		</table>
	</form>
</td>
<%@ include file="home_bottom.jsp"%>