<%@page import="my.user.userBean"%>
<%@page import="my.user.userDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>마이 페이지</title>

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
	#sub{
		background-color: #353535;
		color : white;
	}
</style>

<script type="text/javascript">
	function mydelete_check(){
		var check = confirm('정말 탈퇴하시겠습니까?\n탈퇴시, 예매한 티켓은 자동으로 취소됩니다.');
		
		if(check){
			document.mydeleteform.action = '<%= request.getContextPath() %>/MY/my/my_delete_Proc.jsp';
			document.mydeleteform.submit();
		}
		else{
			document.mydeleteform.action = '<%= request.getContextPath() %>/MY/my/mypage.jsp';
		}
	}
</script>

<%@ include file="../Home/home_top.jsp"%>
<%
	userDao udao = userDao.getInstance();
	userBean user = udao.getMybyId(sid); 
%>
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
	<table width="70%" border="0" height="500">
		<tr>
			<td valign="top" width="150" style="border-right: 0.1px solid #5D5D5D;">
				<br><br>
				<table border = "0" id="mytable1">
					<tr>
						<td height="60">
							<a href="<%= request.getContextPath() %>/MY/my/my_ticket_list.jsp" class="f2" id="color1">나의 예매내역</a>
						</td>
					<tr>
					<tr>
						<td height="60">
							<a href="<%= request.getContextPath() %>/MY/my/my_detail.jsp" class="f2" id="color1">내 정보 보기</a>
						</td>
					</tr>
					<tr>
						<td height="60">
							<a href="<%= request.getContextPath() %>/MY/my/my_update_pwCheck.jsp" class="f2" id="color1">회원 정보 수정</a>
						</td>
					</tr>
					<tr>
						<td height="60">
							<a href="<%= request.getContextPath() %>/MY/my/my_updatePw.jsp" class="f2" id="color1">비밀번호 변경</a>
						</td>
					</tr>
					<tr>
						<td height="60">
							<a href="my_delete.jsp" class="f2" id="color2">회원 탈퇴</a>
						</td>
					</tr>
				</table>
			</td>
			<td valign="top">
				<table border="0">
					<tr>
						<td class="f2" colspan="1" height="70" align="center">
							회원 탈퇴
						</td>
					</tr>
					
					<tr>
						<td>
							<form name="mydeleteform" method="post">
								<table border="0" width="90%">
									<tr>
										<td align="left">
											<h5>아이디</h5>
											<input type="text" class="form-control" name="id" value="<%= sid %>" disabled>
										</td>
									</tr>
									
									<tr>
										<td>
											<h5>비밀번호</h5>
											<input type="password" class="form-control" name="password">
										</td>
									</tr>
									
									<tr>
										<td>
										<br>
											<input type="submit" value="회원 탈퇴" class="form-control" id="sub" onclick="mydelete_check()">
										</td>
									</tr>
								</table>	
							</form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
	</table>
</td>
<tr>
</tr>
<%@ include file="../Home/home_bottom.jsp"%>

