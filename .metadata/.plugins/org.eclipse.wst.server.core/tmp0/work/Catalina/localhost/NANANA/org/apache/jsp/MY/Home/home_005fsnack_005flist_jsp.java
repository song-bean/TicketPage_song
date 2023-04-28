/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.71
 * Generated at: 2023-04-17 23:57:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.MY.Home;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import my.manager.snack.SnackBean;
import my.manager.snack.SnackDao;
import java.util.ArrayList;

public final class home_005fsnack_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/MY/Home/home_top.jsp", Long.valueOf(1681719743000L));
    _jspx_dependants.put("/MY/Home/home_bottom.jsp", Long.valueOf(1681720894000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("my.manager.snack.SnackDao");
    _jspx_imports_classes.add("my.manager.snack.SnackBean");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<title>스낵 정보 페이지</title>\n");
      out.write("\n");

	SnackDao sdao = SnackDao.getInstance();
	ArrayList<SnackBean> slist = sdao.getAllSnack();

      out.write("\n");
      out.write("\n");
      out.write("<style type=\"text/css\">\n");
      out.write("	.stable{\n");
      out.write("		text-align: center;\n");
      out.write("		font-family: 'Nanum Pen Script', cursive;\n");
      out.write("		font-size: 20px;\n");
      out.write("	}\n");
      out.write("	.stable td a{\n");
      out.write("		color : white;\n");
      out.write("	}\n");
      out.write("	.stable td a:hover{\n");
      out.write("		color : #3DB7CC;\n");
      out.write("	}\n");
      out.write("	\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Lily+Script+One&family=Roboto&family=Shadows+Into+Light&display=swap\" rel=\"stylesheet\">\n");
      out.write("<link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0\" />\n");
      out.write("<link href=\"");
      out.print( request.getContextPath() );
      out.write("/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("<link href=\"");
      out.print( request.getContextPath() );
      out.write("/css/kfonts2.css\" rel=\"stylesheet\">\n");
      out.write("<link href=\"");
      out.print( request.getContextPath() );
      out.write("/css/custom2.css\" rel=\"stylesheet\">\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js\"></script>\n");
      out.write("<script src=\"");
      out.print( request.getContextPath() );
      out.write("/js/bootstrap.min.js\"></script>\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap\" rel=\"stylesheet\">\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("\n");
      out.write("<style type=\"text/css\">\n");
      out.write("	body{\n");
      out.write("		background-color: #353535;\n");
      out.write("		color : white;\n");
      out.write("	}\n");
      out.write("	a:hover{\n");
      out.write("		text-decoration: none;\n");
      out.write("	}\n");
      out.write("	.f1{\n");
      out.write("		font-family: 'Shadows Into Light', cursive;	\n");
      out.write("		font-size: 100px;\n");
      out.write("		color: #CC3D3D;\n");
      out.write("	}\n");
      out.write("	.f2{\n");
      out.write("		font-family: 'Nanum Brush Script', cursive;\n");
      out.write("		font-size: 25px;\n");
      out.write("	}\n");
      out.write("	.f3{\n");
      out.write("		font-family: 'Shadows Into Light', cursive;	              \n");
      out.write("		font-size: 30px;\n");
      out.write("		color: #FF7171;\n");
      out.write("	}\n");
      out.write("	#m1{\n");
      out.write("		font-family: 'Nanum Brush Script', cursive;\n");
      out.write("		font-size: 25px;\n");
      out.write("		color : white;\n");
      out.write("		background: #353535;\n");
      out.write("	}\n");
      out.write("	#m1:hover{\n");
      out.write("		background: #353535;\n");
      out.write("		color : #FF7171;\n");
      out.write("	}\n");
      out.write("	#mm1{\n");
      out.write("		width: 50%;\n");
      out.write("		background: #353535;	\n");
      out.write("		text-align: center;\n");
      out.write("		margin: auto;\n");
      out.write("	}\n");
      out.write("	#mm1>li>a{\n");
      out.write("		color : white;\n");
      out.write("		font-family: 'Nanum Brush Script', cursive;\n");
      out.write("		font-size: 25px;\n");
      out.write("	}\n");
      out.write("	#mm1>li>a:hover{\n");
      out.write("		background: #353535;	\n");
      out.write("		color : pink;\n");
      out.write("	}\n");
      out.write("	table{\n");
      out.write("		margin: auto;\n");
      out.write("	}\n");
      out.write("	hr{\n");
      out.write("		border : 0.1px solid #4B4B4B;\n");
      out.write("	}\n");
      out.write("	.f4{\n");
      out.write("		font-family: 'Gowun Dodum', sans-serif;\n");
      out.write("		color : #9F9F9F;\n");
      out.write("		font-size: 13px;\n");
      out.write("	}\n");
      out.write("	.bottom_table{\n");
      out.write("		width : 65%;\n");
      out.write("		height: 150px;\n");
      out.write("		margin: 20px 30px;\n");
      out.write("		text-align: center;\n");
      out.write("	}\n");
      out.write("	#menu{\n");
      out.write("		font-family: 'Nanum Brush Script', cursive;\n");
      out.write("		font-size: 30px;\n");
      out.write("		background-color : #474747;\n");
      out.write("		position: fixed;\n");
      out.write("		top: -150px;\n");
      out.write("		display: block;\n");
      out.write("		width: 100%;\n");
      out.write("		height: 50px;\n");
      out.write("	}\n");
      out.write("	.box-title{\n");
      out.write("		position: relative;\n");
      out.write("		padding : 10px;\n");
      out.write("	}\n");
      out.write("	.box-container{\n");
      out.write("		display: flex;\n");
      out.write("	}\n");
      out.write("	.box{\n");
      out.write("		display: block;\n");
      out.write("		width: 300px;\n");
      out.write("		text-align: center;\n");
      out.write("	}\n");
      out.write("	.box a{\n");
      out.write("		color : white;\n");
      out.write("	}\n");
      out.write("</style>\n");
      out.write("\n");

	String sid = (String)session.getAttribute("sid");

      out.write("\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("	function not_login(){\n");
      out.write("		alert('로그인 먼저 하세요.');\n");
      out.write("	}\n");
      out.write("	function not_logout(){\n");
      out.write("		alert('로그인한 상태로는 회원가입이 불가능합니다.');\n");
      out.write("	}\n");
      out.write("	function ticket_idCheck(){\n");
      out.write("		alert('로그인 후 이용 가능합니다.');\n");
      out.write("	}\n");
      out.write("	function id_managerCheck(){\n");
      out.write("		alert('관리자는 예매가 불가능합니다.');\n");
      out.write("	}\n");
      out.write("	\n");
      out.write("	var prevScrollpos = window.pageYOffset;\n");
      out.write("	var navbar = document.getElementById(\"menu\");\n");
      out.write("	\n");
      out.write("	window.onscroll = function(){\n");
      out.write("		var currentScrollpos = window.pageYOffset;\n");
      out.write("		if(250 > currentScrollpos){\n");
      out.write("			document.getElementById(\"menu\").style.top = \"-150px\";\n");
      out.write("		}\n");
      out.write("		else{\n");
      out.write("			document.getElementById(\"menu\").style.top = \"0px\";\n");
      out.write("		}\n");
      out.write("		prevScrollpos = currentScrollpos;\n");
      out.write("	}\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<div id=\"menu\">\n");
      out.write("	<div id=\"nav\">\n");
      out.write("		<div class=\"box-title\">\n");
      out.write("			<div class=\"box-container\">\n");
      out.write("				<div class=\"box\">\n");
      out.write("					<a href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/home_movie_list.jsp\">영화</a>\n");
      out.write("				</div>\n");
      out.write("				<div class=\"box\">\n");
      out.write("					<a href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/home_cinema_list.jsp\">극장</a>\n");
      out.write("				</div>\n");
      out.write("				<div class=\"box\">\n");
      out.write("		        	  <a href=\"#\">예매</a>   \n");
      out.write("				</div>\n");
      out.write("				<div class=\"box\">\n");
      out.write("					<a href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/home_snack_list.jsp\">스낵</a>\n");
      out.write("				</div>\n");
      out.write("			</div>\n");
      out.write("		</div>\n");
      out.write("	</div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("<table border=\"0\" width=\"100%\"> \n");
      out.write("	<tr>\n");
      out.write("		<td valign=\"bottom\" width=\"630\">\n");
      out.write("			<a class=\"f1\" href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/home.jsp\">&nbsp;NANANA</a>&nbsp;&nbsp;\n");
      out.write("			<a href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/home.jsp\"><span class=\"f3\">CINEMA</span></a>\n");
      out.write("		</td>		\n");
      out.write("		\n");
      out.write("		<td align=\"center\" width=\"80\">	\n");
      out.write("		");

			if(sid != null){
		
      out.write("\n");
      out.write("				<a href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/logout.jsp\"><img src=\"");
      out.print( request.getContextPath() );
      out.write("/icon/unlock.png\" width=\"30\"></a><br>\n");
      out.write("				<a class=\"f2\" href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/logout.jsp\"><font color=black>로그아웃</font></a>\n");
      out.write("		");

			}
			else{
		
      out.write("\n");
      out.write("				<a href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/loginForm.jsp\"><img src=\"");
      out.print( request.getContextPath() );
      out.write("/icon/lock.png\" width=\"30\"></a><br>\n");
      out.write("				<a class=\"f2\" href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/loginForm.jsp\"><font color=black>로그인</font></a>\n");
      out.write("		");
		
			}
		
      out.write("	\n");
      out.write("		</td>\n");
      out.write("		\n");
      out.write("		<td align=\"center\" width=\"90\">	\n");
      out.write("		");

			if(sid != null){
		
      out.write("\n");
      out.write("				<a onclick=\"not_logout()\" href=\"\"><img src=\"");
      out.print( request.getContextPath() );
      out.write("/icon/join.png\" width=\"30\"></a><br> \n");
      out.write("				<a class=\"f2\" onclick=\"not_logout()\" href=\"\"><font color=black>회원가입</font></a>\n");
      out.write("		");

			}
			else{
		
      out.write("\n");
      out.write("				<a href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/joinForm.jsp\"><img src=\"");
      out.print( request.getContextPath() );
      out.write("/icon/join.png\" width=\"30\"></a><br> \n");
      out.write("				<a class=\"f2\" href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/joinForm.jsp\"><font color=black>회원가입</font></a>\n");
      out.write("		");

			}
		
      out.write("	\n");
      out.write("		</td>\n");
      out.write("		\n");
      out.write("		<td align=\"center\" width=\"90\">	\n");
      out.write("		");

			if(sid == null){
		
      out.write("\n");
      out.write("				<a href=\"\" onclick=\"not_login()\"><img src=\"");
      out.print( request.getContextPath() );
      out.write("/icon/my.png\" width=\"30\" height=\"30\"></a><br>\n");
      out.write("				<a class=\"f2\" href=\"\" onclick=\"not_login()\"><font color=black>마이페이지</font></a>\n");
      out.write("		");
			
			}
			else{
				if(sid.equals("manager")){
			
      out.write("\n");
      out.write("					<a href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Manager/manager_home.jsp\"><img src=\"");
      out.print( request.getContextPath() );
      out.write("/icon/manager.png\" width=\"30\"></a><br>\n");
      out.write("					<a class=\"f2\" href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Manager/manager_home.jsp\"><font color=black>관리자</font></a>\n");
      out.write("			");

				}
				else{
			
      out.write("\n");
      out.write("					<a href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/my/mypage.jsp\"><img src=\"");
      out.print( request.getContextPath() );
      out.write("/icon/my.png\" width=\"30\"></a><br>\n");
      out.write("					<a class=\"f2\" href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/my/mypage.jsp\"><font color=black>마이페이지</font></a>\n");
      out.write("			");
		
				}
			}
		
      out.write("	\n");
      out.write("		</td>\n");
      out.write("		\n");
      out.write("		<td align=\"center\" width=\"70\">\n");
      out.write("		");

			if(sid == null){
		
      out.write("\n");
      out.write("				<a href=\"\" onclick=\"not_login()\"><img src=\"");
      out.print( request.getContextPath() );
      out.write("/icon/inquiry.png\" width=\"30\" height=\"30\"></a><br>\n");
      out.write("				<a class=\"f2\" href=\"\" onclick=\"not_login()\"><font color=black>고객 문의</font></a>\n");
      out.write("		");
			
			}
			else{
			
      out.write("\n");
      out.write("				<a href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Inquiry/inquiry.jsp\"><img src=\"");
      out.print( request.getContextPath() );
      out.write("/icon/inquiry.png\" width=\"30\"></a><br>\n");
      out.write("				<a class=\"f2\" href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Inquiry/inquiry.jsp\"><font color=black>고객 문의</font></a>\n");
      out.write("			");
		
			}
		
      out.write("	\n");
      out.write("		</td>\n");
      out.write("		\n");
      out.write("		</tr>\n");
      out.write("	\n");
      out.write("				\n");
      out.write("\n");
      out.write("	<tr>\n");
      out.write("		<td align=\"center\" colspan=\"1\" style=\"color : white\" height=\"20\">\n");
      out.write("    		 <ul class=\"nav nav-pills nav-justified\"> \n");
      out.write("		         <li class=\"dropdown\">\n");
      out.write("		         	  <a href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/home_movie_list.jsp\" id=\"m1\">영화</a>\n");
      out.write("		         </li>\n");
      out.write("		         \n");
      out.write("		         <li class=\"dropdown\">\n");
      out.write("		         	  <a href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/home_cinema_list.jsp\" id=\"m1\">극장</a>\n");
      out.write("		         </li>\n");
      out.write("		         \n");
      out.write("		         <li class=\"dropdown\">\n");
      out.write("		         	 ");

		         	if(sid == null){
		         
      out.write("\n");
      out.write("		         	  <a data-toggle=\"dropdown\" href=\"\" id=\"m1\" onclick=\"ticket_idCheck()\">예매\n");
      out.write("		         	  	 <span class=\"caret\"></span> 	 \n");
      out.write("		         	  </a>\n");
      out.write("		        ");

		         	}
		         	else if(sid.equals("manager")){
		         
      out.write("\n");
      out.write("		         	<a data-toggle=\"dropdown\" href=\"\" id=\"m1\" onclick=\"id_managerCheck()\">예매\n");
      out.write("		         	  	 <span class=\"caret\"></span> 	 \n");
      out.write("		         	</a>\n");
      out.write("		         ");
		
		         	}
		         	else{
		         
      out.write("	 	  	  \n");
      out.write("		        	  <a data-toggle=\"dropdown\" href=\"#\" id=\"m1\">예매\n");
      out.write("		         	  	 <span class=\"caret\"></span> 	 \n");
      out.write("		         	  </a>\n");
      out.write("		         	   <ul class=\"dropdown-menu\" role=\"menu\" id=\"mm1\"> \n");
      out.write("			               <li><a role=\"menuitem\" href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/Ticket/home_ticket_movie.jsp\">영화별 예매</a></li>\n");
      out.write("			               <li><a role=\"menuitem\" href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/Ticket/home_ticket_cinema.jsp\">극장별 예매</a></li>\n");
      out.write("			               <li class=\"divider\" style=\"border : 0.1px solid #4B4B4B;\"></li>\n");
      out.write("			               <li><a role=\"menuitem\" href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/Ticket/home_ticket_list.jsp\">예매 확인 </a></li>\n");
      out.write("			          </ul>\n");
      out.write("			     ");

		         	}
			     
      out.write("     \n");
      out.write("		         </li>\n");
      out.write("		          <li class=\"dropdown\">\n");
      out.write("		         	  <a class=\"f2\" href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/home_snack_list.jsp\" id=\"m1\" style=\"color : #FF7171;\">스낵</a>\n");
      out.write("		         </li>\n");
      out.write("		     </ul>\n");
      out.write("		</td>\n");
      out.write("	</tr>\n");
      out.write("	\n");
      out.write("	<tr>\n");
      out.write("		<td colspan=\"5\" height=\"10\">\n");
      out.write("			<hr>\n");
      out.write("		</td>\n");
      out.write("	</tr>\n");
      out.write("	\n");
      out.write("	<tr>\n");
      out.write("<td colspan=\"5\" align=\"center\">\n");
      out.write("	<br>\n");
      out.write("		<table border=\"0\" class=\"stable\" width=\"80%\">\n");
      out.write("			<tr>\n");
      out.write("	");

		if(slist.size() == 0){
	
      out.write("\n");
      out.write("			<td colspan=\"12\">등록된 스낵이 없습니다.</td>\n");
      out.write("	");
		
		}
		else{
			int count = 0;
			for(SnackBean sb : slist){
			if(count%4 == 0){
	
      out.write("\n");
      out.write("					<tr>\n");
      out.write("			");
		
				}
			
      out.write("\n");
      out.write("				<td width=\"200\" height=\"350\">\n");
      out.write("				<a href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/home_snack_detail.jsp?sno=");
      out.print( sb.getSno() );
      out.write("\">\n");
      out.write("				");

					if(sb.getSimage().equals("이미지 없음")){
				
      out.write("\n");
      out.write("						<font size=\"50px\" color=\"#F15F5F\">이미지<br>준비중</font>\n");
      out.write("						<br><br>\n");
      out.write("				");

					}
					else{
				
      out.write("\n");
      out.write("						<img src=\"");
      out.print( request.getContextPath() );
      out.write("/images/");
      out.print( sb.getSimage() );
      out.write("\" width=\"200\">\n");
      out.write("				");

					}
				
      out.write("	\n");
      out.write("				 <br><br>\n");
      out.write("					");
      out.print( sb.getSname() );
      out.write("\n");
      out.write("				</a>\n");
      out.write("			</td>\n");
      out.write("			");

				if(count%4 == 3){
			
      out.write("\n");
      out.write("				</tr>\n");
      out.write("			");
		
				}
				count++;
			}
		}
	
      out.write("\n");
      out.write("			\n");
      out.write("		</table>\n");
      out.write("		<br>\n");
      out.write("</td>\n");
      out.write("\n");
      out.write("    \n");
      out.write("	</tr>\n");
      out.write("	\n");
      out.write("	<tr>\n");
      out.write("		<td colspan=\"5\">\n");
      out.write("			<hr>\n");
      out.write("		</td>\n");
      out.write("	</tr>\n");
      out.write("	<tr bgcolor=\"#272727\">\n");
      out.write("		<td colspan=\"5\">\n");
      out.write("			<table border=\"0\" class=\"bottom_table\">\n");
      out.write("				<tr height=\"50\">\n");
      out.write("					<td class=\"f4\">회사소개</td>\n");
      out.write("					<td class=\"f4\">지속가능경영</td>\n");
      out.write("					<td class=\"f4\">IR</td>\n");
      out.write("					<td class=\"f4\">채용정보</td>\n");
      out.write("					<td class=\"f4\">광고/제휴/훌점문의</td>\n");
      out.write("					<td class=\"f4\">이용약관</td>\n");
      out.write("					<td class=\"f4\">편성기준</td>\n");
      out.write("					<td class=\"f4\">개인정보처리방침</td>\n");
      out.write("					<td class=\"f4\">법적고지</td>\n");
      out.write("					<td class=\"f4\">이메일주소무단수집거부</td>\n");
      out.write("					<td class=\"f4\">사이버감사실</td>\n");
      out.write("				</tr>\n");
      out.write("				\n");
      out.write("				<tr>\n");
      out.write("					<td align=\"left\" class=\"f4\" colspan=\"11\">[02832]서울특별시 영화구 극장로 예매 34길 78, 나나빌딩</td>\n");
      out.write("				</tr>\n");
      out.write("				<tr>	\n");
      out.write("					<td align=\"left\" class=\"f4\" colspan=\"11\">대표이사 : 송나영 사업자등록번호 : 123-45-67891 통신판매신고번호 : 2023-서울영화-1234 사업자정보확인</td>\n");
      out.write("				</tr>	\n");
      out.write("				<tr>	\n");
      out.write("					<td align=\"left\" class=\"f4\" colspan=\"11\">사업자 : SNY 개인정보보호 책임자 : 송나영 대표이메일 : SNY@nanana.com</td>\n");
      out.write("				</tr>	\n");
      out.write("				<tr>\n");
      out.write("					<td align=\"left\" class=\"f4\" colspan=\"11\">©NANANA</td>\n");
      out.write("				</tr>\n");
      out.write("			</table>\n");
      out.write("		</td>\n");
      out.write("	</tr>\n");
      out.write("</table>");
      out.write('\n');
      out.write('\n');
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
