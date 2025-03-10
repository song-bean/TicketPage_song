<%@page import="my.user.userBean"%>
<%@page import="my.user.userDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>마이페이지</title>

<style type="text/css">
	#color1{
		color : #F2CB61;
	}
	#color1:hover{
		color : #664B00;
	}
	#color2{
		color : #664B00;
	}
	.mtable{
		text-align: center;
		font-family: 'Nanum Pen Script', cursive;
		font-size: 20px;
		width : 50%;
	}
	#i1{
		background-color: #353535;
		color : white;
	}
	.mtable td:first-child{
		color : #E4F7BA;
	}
	.hp{
		border : 0.5px solid white;
		height: 30px;
		text-align: left;
	}
	#sub{
		background: #E4F7BA;
		color : #353535;
		font-size: 20px;
	}
</style>

<%@ include file="../Home/home_top.jsp"%>

<%
	userDao udao = userDao.getInstance();
	userBean user = udao.getMybyId(sid); 
	
	String[] gender = {"남자", "여자"};
%>
<tr>
		<td align="center" colspan="1" style="color : white">
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
	<table width="70%" border="0" height="500">
		<tr>
			<td valign="top" width="150" style="border-right: 0.1px solid #5D5D5D;">
				<br><br>
				<table border = "0" id="mytable1">
					<tr>
						<td height="60">
							<a href="my_ticket_list.jsp" class="f2" id="color1">나의 예매내역</a>
						</td>
					<tr>
					<tr>
						<td height="60">
							<a href="my_detail.jsp" class="f2" id="color1">내 정보 보기</a>
						</td>
					</tr>
					<tr>
						<td height="60">
							<a href="my_update_pwCheck.jsp" class="f2" id="color2">회원 정보 수정</a>
						</td>
					</tr>
					<tr>
						<td height="60">
							<a href="<%= request.getContextPath() %>/MY/my/my_updatePw.jsp" class="f2" id="color1">비밀번호 변경</a>
						</td>
					</tr>
					<tr>
						<td height="60">
							<a href="my_delete.jsp" class="f2" id="color1">회원 탈퇴</a>
						</td>
					</tr>
				</table>
			</td>
			<td valign="top">
				<br><br><br><br>
				<form method="post" action="my_update_Proc.jsp">
					<table border="0" class="mtable">
						<tr>
							<td>아이디</td>
							<td><input type="text" class="form-control" name="id2" id="i1" value="<%= user.getId() %> (변경 불가)" disabled></td>
							<td><input type="hidden" name="id" value="<%= user.getId() %>"></td>
						</tr>
						
						<tr>
							<td>이름</td>
							<td><input type="text" class="form-control" name="uname" id="i1" value="<%= user.getUname() %>"></td>
						</tr>
						
						<tr>
							<td>생년월일</td>
							<td><input type="text" class="form-control" name="birth" id="i1" value="<%= user.getBirth() %>"></td>
						</tr>
						
						<tr>
							<td>성별</td>
							<td class="hp">
							&nbsp;
							<%
								for(int i=0;i<gender.length;i++){	
							%>
									<%= gender[i] %> <input type="radio" value="<%= gender[i] %>" name="gender" <% if(user.getGender().equals(gender[i])){ %> checked <%} %>> 
							<%
								}
							%>	
							</td>
						</tr>
						
						<tr>
							<td>이메일</td>
							<td><input type="text" class="form-control" name="email" id="i1" value="<%= user.getEmail() %>"></td>
						</tr>
						
						<tr>
							<td>전화번호</td>
							<td class="hp">
								&nbsp;
								+82&nbsp; 
								<input type="text" name="hp1" size="3" maxlength="3" style="background : #353535; border : 0.1px solid white;" value="<%= user.getHp1() %>"> -
								<input type="text" name="hp2" size="4" maxlength="4" style="background : #353535; border : 0.1px solid white;" value="<%= user.getHp2() %>"> -
								<input type="text" name="hp3" size="4" maxlength="4" style="background : #353535; border : 0.1px solid white;" value="<%= user.getHp3() %>">
							</td>
						</tr>
						
						<tr>
							<td colspan="2" height="40">
								<br>
								<input type="submit" value="회원 정보 수정" id="sub">
							</td>
						</tr>
						
					</table>
				</form>
			</td>
		</tr>
		
	</table>
</td>
<tr>
</tr>
<%@ include file="../Home/home_bottom.jsp"%>

