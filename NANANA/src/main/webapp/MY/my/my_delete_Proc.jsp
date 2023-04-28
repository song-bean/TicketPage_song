<%@ page import="my.user.inquiry.inquiryDao"%>
<%@ page import="my.user.ticket.ticketDao"%>
<%@ page import="my.user.userDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sid = (String)session.getAttribute("sid");
	String input_password = request.getParameter("password");
	
	userDao udao = userDao.getInstance();
	ticketDao tdao = ticketDao.getInstance();
	inquiryDao idao = inquiryDao.getInstance();
	String db_password = udao.getPwById(sid); 
	
	String message = null, url = null;
	if(db_password.equals(input_password)){ // 아이디와 일치하는 비밀번호와 입력한 비밀번호가 같다면
		int cnt_user = udao.deleteUser(sid); // 로그인 되어 있는 아이디와 일치하는 사용자 삭제
		if(cnt_user == 1){
			message = "회원 탈퇴되었습니다.";
			url = request.getContextPath() + "/MY/Home/home.jsp";
			
			//회원 탈퇴시 탈퇴하는 아이디에 해당하는 티켓 다 삭제
			int cnt_ticket = tdao.deleteTicketByTid(sid); 
			if(cnt_ticket != -1){
				System.out.println("예매한 티켓이 취소되었습니다.");
			}
			
			//회원 탈퇴시 탈퇴하는 아이디에 해당하는 문의 내역을 변경
			int cnt_inquiry = idao.updateInquiryByIid(sid); 
			if(cnt_inquiry != -1){
				System.out.println("문의 내역이 변경되었습니다.");
			}
			
			//로그인 되어 있는 아이디를 탈퇴 --> 자동 로그아웃
			session.invalidate();
		}
		else{
			message = "회원 탈퇴 실패";
			url = request.getContextPath() + "/MY/Home/home.jsp";
		}
	}
	else{
		message = "비밀번호가 일치하지 않습니다.";
		url = request.getContextPath() + "/MY/my/my_delete.jsp";
	}
%>

<script type="text/javascript">
	alert("<%= message %> "); 
	location.href= '<%= url %>'; 
</script>