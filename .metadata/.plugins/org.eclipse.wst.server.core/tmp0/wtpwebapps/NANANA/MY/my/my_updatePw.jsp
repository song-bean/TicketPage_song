<%@ page import="my.user.userBean"%>
<%@ page import="my.user.userDao"%>
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
	div{
		font-family: 'Gowun Dodum', sans-serif;
		font-size: 15px;
	}
</style>

<%@ include file="../Home/home_top.jsp"%>
<%
	userDao udao = userDao.getInstance();
	userBean user = udao.getMybyId(sid); 
	String db_password = udao.getPwById(sid);
%>

<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
	var pwuse;
	var pwsame;
	function PwCheck(){
		if($('input[name=password_cur]').val( ) == ""){ 
			$("#pw_curMessage").html('<font color="#CC3D3D">현재 비밀번호를 입력하세요.<font>').show();
			$('input[name=password_cur]').focus();
			return false;
		}
		
		if($('input[name=password]').val()==""){
			$("#pwMessage").html('<font color="#CC3D3D">변경할 비밀번호를 입력하세요.<font>').show();
			$('input[name=password]').focus();
			return false;
		}
		
		if(pwuse == "pwerror"){
			$('input[name=password]').select();
			$("#pwMessage").html('<font color="#CC3D3D">비밀번호를 형식이 틀렸습니다.<font>').show();
			return false;
		}
		
		if(pwsame == 'nosame'){
			alert('비밀번호를 다시 확인해주세요.');
			return false;	
		}
		
		if($('input[name=password_cur]').val( ) != "<%= db_password %>" ){ 
			alert('현재 비밀번호가 일치하지 않습니다.');
			$('input[name=password_cur]').select();
			return false;
		}
	}//PwCheck()
	
	function pwkeyd(){
		$('#pwMessage').css('display','none');
	}//pwkeyd()
	
	function pw_curkeyd(){
		$('#pw_curMessage').css('display','none');
	}//pw_curkeyd()
	
	function pwcheck(){
		pw = $('input[name=password]').val();
		
		var regexp = /^[a-zA-Z0-9`~!@#$%^&*()-_=+]{8,16}$/;
		if(!regexp.test(pw)){
			$("#pwMessage").html('<font color="#CC3D3D">비밀번호를 형식이 틀렸습니다.<font>').show();
			pwuse = "pwerror";
		}
		
		var chk_num = pw.search(/[0-9]/);
		var chk_eng = pw.search(/[a-z]/i);
		var chk_spe = pw.search(/[\W]/);
		
		if(chk_num <0 || chk_eng < 0 || chk_spe < 0){
			$("#pwMessage").html('<font color="#CC3D3D">비밀번호를 형식이 틀렸습니다.<font>').show();
			pwuse = "pwerror";
		}
		else{
			pwuse = "";
		}
		
	}//pwcheck()

	function pw2check(){
		if($('input[name=password]').val() == $('input[name=password2]').val()){
			$('#pwCheck').attr('class','');
			$('#pw2Message').html('<font color="#6799FF">비밀번호 일치</font>');
			pwsame = "same";
		}
		else{
			$('#pwCheck').attr('class','form-group has-error');
			$('#pw2Message').html('<font color="#CC3D3D">비밀번호 일치하지 않습니다.</font>');
			pwsame = "nosame";
		}
	}//pw2check()

</script> 


	<tr>
		<td align="center" colspan="1" style="color : white" height="20" height="20">
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
							<a href="my_detail.jsp" class="f2" id="color1" id="color1">내 정보 보기</a>
						</td>
					</tr>
					<tr>
						<td height="60">
							<a href="my_update_pwCheck.jsp" class="f2" id="color1">회원 정보 수정</a>
						</td>
					</tr>
					<tr>
						<td height="60">
							<a href="my_updatePw.jsp" class="f2" id="color2">비밀번호 변경</a>
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
				<table border="0" width="300">
					<tr>
						<td class="f2" colspan="1" height="70" align="center">
							비밀번호 변경
						</td>
					</tr>
					
					<tr>
						<td>
							<form action="<%= request.getContextPath() %>/MY/my/my_updatePw_proc.jsp" method="post" onSubmit="return PwCheck()">
								<table border="0" width="90%">
									<tr>
										<td>
											<h5>현재 비밀번호</h5>
											<input type="password" class="form-control" name="password_cur" onkeydown="return pw_curkeyd()">
											<div id="pw_curMessage"></div>
										</td>
									</tr>
									<tr>
										<td>
											<h5>변경할 비밀번호</h5>
											<input type="password" class="form-control" name="password" placeholder="8~16자 영문 대 소문자, 숫자, 특수문자 조합" onkeyup="return pwcheck()" onkeydown="return pwkeyd()">
											<div id="pwMessage"></div>
										</td>
									</tr>
									
									<tr>
										<td>
											<div id="pwCheck">
												<h5>변경할 비밀번호 확인</h5>
												<input type="password" class="form-control" name="password2" onkeyup="pw2check()">
												<div id="pw2Message"></div>
											</div>
										</td>
									</tr>
									
									<tr>
										<td>
										<br>
											<input type="submit" value="비밀번호 변경" class="form-control" id="sub">
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

