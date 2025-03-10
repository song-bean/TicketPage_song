<%@page import="my.manager.snack.SnackBean"%>
<%@page import="my.manager.snack.SnackDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>스낵 정보 페이지</title>

<%
	SnackDao sdao = SnackDao.getInstance();
	ArrayList<SnackBean> slist = sdao.getAllSnack();
%>

<style type="text/css">
	.stable{
		text-align: center;
		font-family: 'Nanum Pen Script', cursive;
		font-size: 20px;
	}
	.stable td a{
		color : white;
	}
	.stable td a:hover{
		color : #3DB7CC;
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
		         	  <a class="f2" href="<%= request.getContextPath() %>/MY/Home/home_snack_list.jsp" id="m1" style="color : #FF7171;">스낵</a>
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
		<table border="0" class="stable" width="80%">
			<tr>
	<%
		if(slist.size() == 0){
	%>
			<td colspan="12">등록된 스낵이 없습니다.</td>
	<%		
		}
		else{
			int count = 0;
			for(SnackBean sb : slist){
			if(count%4 == 0){
	%>
					<tr>
			<%		
				}
			%>
				<td width="200" height="350">
				<a href="<%= request.getContextPath() %>/MY/Home/home_snack_detail.jsp?sno=<%= sb.getSno() %>">
				<%
					if(sb.getSimage().equals("이미지 없음")){
				%>
						<font size="50px" color="#F15F5F">이미지<br>준비중</font>
						<br><br>
				<%
					}
					else{
				%>
						<img src="<%= request.getContextPath() %>/images/<%= sb.getSimage() %>" width="200">
				<%
					}
				%>	
				 <br><br>
					<%= sb.getSname() %>
				</a>
			</td>
			<%
				if(count%4 == 3){
			%>
				</tr>
			<%		
				}
				count++;
			}
		}
	%>
			
		</table>
		<br>
</td>
<%@ include file="home_bottom.jsp"%>

