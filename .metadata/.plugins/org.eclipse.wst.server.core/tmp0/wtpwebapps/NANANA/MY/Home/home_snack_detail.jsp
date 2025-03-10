<%@page import="my.manager.snack.SnackBean"%>
<%@page import="my.manager.snack.SnackDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>스낵 상세 정보 페이지</title>

<%
	String sno = request.getParameter("sno");
	SnackDao sdao = SnackDao.getInstance();
	SnackBean sb = sdao.getSnackBySno(sno);
%>

<style type="text/css">
	.stable{
		font-family: 'Nanum Pen Script', cursive;
		font-size: 20px;
	}
	.stable h2, .stable h4{
		font-family : 'Nanum Pen Script', cursive;
	}
	.stable h5{
		font-family : 'Nanum Pen Script', cursive;
		color : grey;
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
		         	  <a class="f2" href="<%= request.getContextPath() %>/MY/Home/home_snack_list.jsp"id="m1" style="color : #FF7171;">스낵</a>
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
	<br>
		<table border="0" class="stable" width="50%">
			<tr>
				<td height="200" width="200">
				<%
					if(sb.getSimage().equals("이미지 없음")){
				%>
						<font size="50px" color="#F15F5F">이미지<br>준비중</font>
						<br><br>
				<%
					}
					else{
				%>
						<img src="<%= request.getContextPath() %>/images/<%= sb.getSimage() %>" height="200" width="200">
				<%
					}
				%>	
				</td>
				<td width="60%" valign="top">
					<h2 style="color : #B2EBF4;"><%= sb.getSname() %></h2>
					<hr>
					<h4>가격 : <%= sb.getSprice() %></h4>
					<h4>스낵 구성 : <%= sb.getScomp() %></h4>
					<h5>스낵은 현장 구매만 가능합니다.</h5>
				</td>
			</tr>
		</table>
		<br>
</td>
<%@ include file="home_bottom.jsp"%>

