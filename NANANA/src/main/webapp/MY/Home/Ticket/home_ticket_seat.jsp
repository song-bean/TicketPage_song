<%@page import="my.manager.movie.MovieBean"%>
<%@page import="my.manager.movie.MovieDao"%>
<%@page import="my.manager.cinema.CinemaBean"%>
<%@page import="my.manager.cinema.CinemaDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>예매 페이지</title>


<%
	request.setCharacterEncoding("UTF-8");
	String tmovie = request.getParameter("tmovie");
	String tcinema = request.getParameter("tcinema");
	String time = request.getParameter("time");
	
	CinemaDao cdao = CinemaDao.getInstance();
	int seat_capa = cdao.getSeatByCname(tcinema); // 선택한 극장의 좌석 수 가져오기
	String[] seat = {
						"A1","A2","A3","A4","A5","A6","A7","A8","A9","A10","A11","A12","A13","A14","A15","A16","A17","A18","A19","A20",
						"B1","B2","B3","B4","B5","B6","B7","B8","B9","B10","B11","B12","B13","B14","B15","B16","B17","B18","B19","B20",
						"C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","C11","C12","C13","C14","C15","C16","C17","C18","C19","C20",
						"D1","D2","D3","D4","D5","D6","D7","D8","D9","D10","D11","D12","D13","D14","D15","D16","D17","D18","D19","D20",
						"E1","E2","E3","E4","E5","E6","E7","E8","E9","E10","E11","E12","E13","E14","E15","E16","E17","E18","E19","E20",
						"F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12","F13","F14","F15","F16","F17","F18","F19","F20",
						"G1","G2","G3","G4","G5","G6","G7","G8","G9","G10","G11","G12","G13","G14","G15","G16","G17","G18","G19","G20",
						"H1","H2","H3","H4","H5","H6","H7","H8","H9","H10","H11","H12","H13","H14","H15","H16","H17","H18","H19","H20",
						"I1","I2","I3","I4","I5","I6","I7","I8","I9","I10","I11","I12","I13","I14","I15","I16","I17","I18","I19","I20",
						"J1","J2","J3","J4","J5","J6","J7","J8","J9","J10","J11","J12","J13","J14","J15","J16","J17","J18","J19","J20",
						"K1","K2","K3","K4","K5","K6","K7","K8","K9","K10","K11","K12","K13","K14","K15","K16","K17","K18","K19","K20",
						"L1","L2","L3","L4","L5","L6","L7","L8","L9","L10","L11","L12","L13","L14","L15","L16","L17","L18","L19","L20",
						"M1","M2","M3","M4","M5","M6","M7","M8","M9","M10","M11","M12","M13","M14","M15","M16","M17","M18","M19","M20",
						"N1","N2","N3","N4","N5","N6","N7","N8","N9","N10","N11","N12","N13","N14","N15","N16","N17","N18","N19","N20",
						"O1","O2","O3","O4","O5","O6","O7","O8","O9","O10","O11","O12","O13","O14","O15","O16","O17","O18","O19","O20"
					};
	String[] seat_alpha = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O"};
%>
<style type="text/css">
	.ttable{
		text-align: center;
		font-family: 'Nanum Pen Script', cursive;
		font-size: 20px;
	}
	#tm1{
		color : pink;
	}
	#tm1:hover, #tm2:hover{
		background-color : #353535;
		border-bottom : 1px dotted #A6A6A6;
	}
	#tm2{
		color : #F2CB61;
	}
	#sub{
		background-color : #5D5D5D;
		font-family: 'Nanum Pen Script', cursive;
		font-size: 18px;
		color : white;
	}
	.radio-wrap input[type="radio"]{
		display: none;
	}
	.radio-wrap {
        width: 10%;
        height: 30px;
        border: 1px solid #eaeaea;
        border-radius: 5px;
    }
    .radio-wrap label {
        display: block;
        margin: 0 auto;
        height: -webkit-fill-available;
        line-height: 30px;
        border-radius: 5px;
        text-align: center;
        cursor: pointer;
	}
	.radio-wrap input[type="radio"]:checked + label {
        background: #878787;
        color: #fff;
	}
	.checkbox-wrap input[type="checkbox"] + label {
		display: inline-block;
		width: 15px;
		height: 15px;
		border: 0.1px solid #bcbcbc;
		border-radius : 3px;
		cursor: pointer;
	}
	.checkbox-wrap input[type="checkbox"]:checked + label {
		background-color: #9FC93C; 
	}
	.checkbox-wrap input[type="checkbox"] {
		display: none;
	}
	.checkbox-wrap input[type="checkbox"]:disabled + label {
		background-color: #353535;
		border: #353535;
		cursor: auto;
	}
</style>

<script type="text/javascript">
	function seatCheck(){
		//seat_pos
		str = "좌석 : ";
		flag = false;
		count = 0;
		for(i=0;i<seatForm.seat_pos.length;i++) {
			if(seatForm.seat_pos[i].checked) {
				flag = true;
				count++;
				str += seatForm.seat_pos[i].value + " ";
			}
		}
		if(flag == false) {
			alert('좌석을 선택해야 합니다.');
			return false;
		}
		str += "\n";
		
		var people = 0;
		//adult
		str += "성인 관람자 수 : ";
		flag2 = false;
		for(i=0;i<seatForm.adult.length;i++) {
			if(seatForm.adult[i].checked) {
				flag2 = true;
				adult = Number(seatForm.adult[i].value);
				people += adult;
				str += seatForm.adult[i].value + " 명\n";
				break;
			}
		}
		if(flag2 == false) {
			alert('성인 관람자 수를 선택해야 합니다.');
			return false;
		}
		
		//child
		str += "어린이 관람자 수 : ";
		flag3 = false;
		for(i=0;i<seatForm.child.length;i++) {
			if(seatForm.child[i].checked) {
				flag3 = true;
				child = Number(seatForm.child[i].value);
				people += child;
				str += seatForm.child[i].value + " 명\n";
				break;
			}
		}
		if(flag3 == false) {
			alert('어린이 관람자 수를 선택해야 합니다.');
			return false;
		}
		
		//선택한 좌석 수와 관람자 수가 일치하는지
		if(people != count){
			alert('관람자 수에 맞게 좌석을 선택해주세요.');
			return false;
		}
		
		
		var price = 13000 * adult + 10000 * child;
		str += "티켓 가격 : " +  price + "\n\n";
		var pay = confirm(str + '예매 정보를 확인해 주시고 카드로 결제하시려면 확인을 눌러 주세요.\n (현금일 경우, 취소를 눌러주세요.)');
		if(pay){
			seatForm.pay.value = 'card';
		}
		else{
			seatForm.pay.value = 'cash';
		}
	}
</script>

<%@ include file="../home_top.jsp"%>
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
		        	  <a data-toggle="dropdown" href="#" id="m1" style="color : #FF7171;">예매
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
		         	  <a class="f2" href="<%= request.getContextPath() %>/MY/Home/home_snack_list.jsp" id="m1">스낵</a>
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
<td colspan="5" align="center" width="500">
	<br>
		<form name="seatForm" method="post" action="<%= request.getContextPath() %>/MY/Home/Ticket/home_ticket_reservarion.jsp" onsubmit="return seatCheck()">
		<input type="hidden" name="tmovie" value="<%= tmovie %>">
		<input type="hidden" name="tcinema" value="<%= tcinema %>">
		<input type="hidden" name="time" value="<%= time %>">
		<input type="hidden" name="pay">
			<table>
				<tr>
					<td>	
						<table border="0" class="ttable" width="500" align="center">
							<tr>
								<td>
									좌석 선택
								</td>
							</tr>
							<tr>
								<td class="checkbox-wrap">
									<div style="background-color : #5D5D5D;">screen</div>
									<br>
								<%
									int spare = 20 - seat_capa%20;
									int seat_capa_spare = seat_capa + spare;
									int count = 0;
									for(int i=0;i<seat_capa_spare;i++){
										if(count%20 == 0){
								%>
											<%= seat_alpha[count/20] %>
								<%
										}
										count++;
										if(i >= seat_capa){
								%>
											<input id="checkbox-<%= i %>" type="checkbox" name="seat_pos" value="<%= seat[i] %>" disabled>
											<label for="checkbox-<%= i %>"></label>
								<%			
										}
										else{
								%>	
											<input id="checkbox-<%= i %>" type="checkbox" name="seat_pos" value="<%= seat[i] %>">
											<label for="checkbox-<%= i %>"></label>
								<%
										}
										if(count%10 == 0){
								%>
											&nbsp;&nbsp;
								<%			
										}
										if(count%20 == 0){
								%>
											<br>
								<%
										}	
									}
								%>	
								<br>
								</td>
							</tr>
						</table>
					</td>
					
					<td width="100">
						
					</td>
					
					<td>	
						<table border="0" width="150" class="ttable">
							<tr>
								<td colspan="2">성인</td>
							</tr>
							<tr>
								<%
									for(int i=0;i<6;i++){
								%>	
								<td class="radio-wrap"> 
	      							<input id="radio-<%= i %>" type="radio" name="adult" value="<%= i %>" />
	       							<label for="radio-<%= i %>"><%= i %></label>
								</td>
      							<%
									}
      							%>
							</tr>
							<tr>
								<td colspan="2"><br>어린이</td>
							</tr>
							<tr>
								<%
									for(int j=6;j<12;j++){
								%>	
								<td class="radio-wrap"> 
	      							<input id="radio-<%= j %>" type="radio" name="child" value="<%= j-6 %>" />
	       							<label for="radio-<%= j %>"><%= j-6 %></label>
								</td>
      							<%
									}
      							%>
							</tr>
						</table>
					</td>
				</tr>		
				<tr>
					<td colspan="3" align="center">
						<input type="submit" value="결제하기" class="form-control" id="sub">
					</td>
				</tr>
			</table>
		</form>
	<br>
</td>
<%@ include file="../home_bottom.jsp"%>

								