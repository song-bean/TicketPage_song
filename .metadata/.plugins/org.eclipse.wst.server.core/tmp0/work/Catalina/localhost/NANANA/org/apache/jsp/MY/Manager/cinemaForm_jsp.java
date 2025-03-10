/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.71
 * Generated at: 2023-04-18 00:06:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.MY.Manager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import my.manager.cinema.CinemaBean;
import my.manager.cinema.CinemaDao;
import java.util.ArrayList;
import my.manager.movie.MovieBean;
import my.manager.movie.MovieDao;

public final class cinemaForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/MY/Manager/manager_top.jsp", Long.valueOf(1681690291000L));
    _jspx_dependants.put("/MY/Manager/manager_bottom.jsp", Long.valueOf(1680680930000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("my.manager.movie.MovieDao");
    _jspx_imports_classes.add("my.manager.movie.MovieBean");
    _jspx_imports_classes.add("my.manager.cinema.CinemaBean");
    _jspx_imports_classes.add("my.manager.cinema.CinemaDao");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<title>극장 등록 페이지</title>\n");
      out.write("\n");

	CinemaDao cdao = CinemaDao.getInstance();
	ArrayList<CinemaBean> clist = cdao.getAllCinema();

      out.write("\n");
      out.write("\n");
      out.write("<style type=\"text/css\">\n");
      out.write("	.ctable{\n");
      out.write("		text-align: center;\n");
      out.write("		font-family: 'Nanum Pen Script', cursive;\n");
      out.write("		width : 50%;\n");
      out.write("	}\n");
      out.write("	#i1{\n");
      out.write("		background-color: #353535;\n");
      out.write("		color : white;\n");
      out.write("	}\n");
      out.write("	.ctable td:first-child{\n");
      out.write("		color : #E4F7BA;\n");
      out.write("	}\n");
      out.write("	#sub{\n");
      out.write("		background: #E4F7BA;\n");
      out.write("		color : #353535;\n");
      out.write("		font-size: 20px;\n");
      out.write("		border-radius: 10px;\n");
      out.write("	}\n");
      out.write("	.tel{\n");
      out.write("		border : 0.5px solid white;\n");
      out.write("		height: 30px;\n");
      out.write("		text-align: left;\n");
      out.write("	}\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("\n");

	String[] genre = {"액션","애니메이션","스릴러","공포","드라마","판타지","코미디","다큐멘터리"};

      out.write('\n');
      out.write('\n');
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
      out.write("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap\" rel=\"stylesheet\">\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
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
      out.write("		color: #CEF279;\n");
      out.write("	}\n");
      out.write("	.f2{\n");
      out.write("		font-family: 'Nanum Brush Script', cursive;\n");
      out.write("		font-size: 22px;\n");
      out.write("	}\n");
      out.write("	#m1{\n");
      out.write("		color : white;\n");
      out.write("		background: #353535;\n");
      out.write("		font-size: 30px;\n");
      out.write("	}\n");
      out.write("	#m1:hover{\n");
      out.write("		background: #353535;\n");
      out.write("		color : #FAED7D;\n");
      out.write("	}\n");
      out.write("	#mm1{\n");
      out.write("		width: 100%;\n");
      out.write("		background: #353535;	\n");
      out.write("		text-align: center;\n");
      out.write("	}\n");
      out.write("	#mm1>li>a{\n");
      out.write("		color : white;\n");
      out.write("		font-family: 'Nanum Brush Script', cursive;\n");
      out.write("		font-size: 25px;\n");
      out.write("	}\n");
      out.write("	#mm1>li>a:hover{\n");
      out.write("		background: #353535;	\n");
      out.write("		color : FAED7D;\n");
      out.write("	}\n");
      out.write("	table{\n");
      out.write("		margin: auto;\n");
      out.write("	}	\n");
      out.write("	hr{\n");
      out.write("		border : 0.1px solid #4B4B4B ;\n");
      out.write("	}\n");
      out.write("	.f4{\n");
      out.write("		font-family: 'Gowun Dodum', sans-serif;\n");
      out.write("		color : #9F9F9F;\n");
      out.write("		font-size: 13px;\n");
      out.write("	}\n");
      out.write("	.bottom_table{\n");
      out.write("		color : #9F9F9F;\n");
      out.write("		width : 80%;\n");
      out.write("		height: 150px;\n");
      out.write("		margin: 20px 30px;\n");
      out.write("		text-align: center;\n");
      out.write("	}\n");
      out.write("</style>\n");
      out.write("\n");

	String sid = (String)session.getAttribute("sid");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<table border=\"0\" width=\"1000\"> \n");
      out.write("	<tr>\n");
      out.write("		<td class=\"f1\" valign=\"bottom\" width=\"730\">\n");
      out.write("			<a class=\"f1\" href=\"");
      out.print( request.getContextPath() );
      out.write("/MY/Home/home.jsp\">\n");
      out.write("			MANAGER\n");
      out.write("			</a>\n");
      out.write("		</td>		\n");
      out.write("		<td width=\"170\">\n");
      out.write("		</td>\n");
      out.write("		<td align=\"center\" width=\"100\">	\n");
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
      out.write("/MY/Home/logout.jsp\">\n");
      out.write("					<font color=black>관리자</font> <br>\n");
      out.write("					<font color=black>로그아웃</font> \n");
      out.write("				</a>\n");
      out.write("		");

			}
		
      out.write("	\n");
      out.write("		</td>\n");
      out.write("		\n");
      out.write("	</tr>\n");
      out.write("	\n");
      out.write("	<tr>\n");
      out.write("		<td colspan=\"4\">\n");
      out.write("			<hr>\n");
      out.write("		</td>\n");
      out.write("	</tr>\n");
      out.write("	\n");
      out.write("	<tr>\n");
      out.write("		<td align=\"center\" colspan=\"1\" style=\"color : white\">\n");
      out.write("    		 <ul class=\"nav nav-pills nav-justified\"> \n");
      out.write("		         <li class=\"dropdown\">\n");
      out.write("		         	  <a data-toggle=\"dropdown\" class=\"f2\" href=\"#\" id=\"m1\">영화\n");
      out.write("		         	  	 <span class=\"caret\"></span>\n");
      out.write("		         	  </a>\n");
      out.write("		         	   <ul class=\"dropdown-menu\" role=\"menu\" id=\"mm1\"> \n");
      out.write("			               <li><a role=\"menuitem\" href=\"movieForm.jsp\">영화 등록</a></li>\n");
      out.write("			               <li><a role=\"menuitem\" href=\"movie_list.jsp\">영화 목록</a></li>\n");
      out.write("			          </ul>\n");
      out.write("		         </li>\n");
      out.write("		         \n");
      out.write("		         <li class=\"dropdown\">\n");
      out.write("		         	  <a data-toggle=\"dropdown\" class=\"f2\" href=\"#\" id=\"m1\">극장\n");
      out.write("		         	  	 <span class=\"caret\"></span>\n");
      out.write("		         	  </a>\n");
      out.write("		         	   <ul class=\"dropdown-menu\" role=\"menu\" id=\"mm1\"> \n");
      out.write("			               <li><a role=\"menuitem\" href=\"cinemaForm.jsp\">극장 등록</a></li>\n");
      out.write("			               <li><a role=\"menuitem\" href=\"cinema_list.jsp\">극장 목록</a></li>\n");
      out.write("			          </ul>\n");
      out.write("		         </li>\n");
      out.write("		         \n");
      out.write("		         <li class=\"dropdown\">\n");
      out.write("		         	  <a data-toggle=\"dropdown\" class=\"f2\" href=\"#\" id=\"m1\">회원\n");
      out.write("		         	  	 <span class=\"caret\"></span>\n");
      out.write("		         	  </a>\n");
      out.write("		         	   <ul class=\"dropdown-menu\" role=\"menu\" id=\"mm1\"> \n");
      out.write("			               <li><a role=\"menuitem\" href=\"user_list.jsp\">회원 정보</a></li>\n");
      out.write("			               <li><a role=\"menuitem\" href=\"manager_ticket_list.jsp\">예매 내역</a></li>\n");
      out.write("			          </ul>\n");
      out.write("		         </li>\n");
      out.write("		          <li class=\"dropdown\">\n");
      out.write("		         	  <a data-toggle=\"dropdown\" class=\"f2\" href=\"#\"id=\"m1\">스낵\n");
      out.write("		         	  <span class=\"caret\"></span>\n");
      out.write("		         	  </a>\n");
      out.write("		         	   <ul class=\"dropdown-menu\" role=\"menu\" id=\"mm1\"> \n");
      out.write("			               <li><a role=\"menuitem\" href=\"snackForm.jsp\">스낵 등록</a></li>\n");
      out.write("			               <li><a role=\"menuitem\" href=\"snack_list.jsp\">스낵 목록</a></li>\n");
      out.write("			          </ul>\n");
      out.write("		         </li>\n");
      out.write("		     </ul>\n");
      out.write("		</td>\n");
      out.write("	</tr>\n");
      out.write("	\n");
      out.write("	<tr>\n");
      out.write("		\n");
      out.write("		\n");
      out.write("\n");
      out.write("	<td colspan=\"3\">\n");
      out.write("	<br>\n");
      out.write("		<form method=\"post\" action=\"cinamaProc.jsp\">\n");
      out.write("			<table class=\"ctable\">\n");
      out.write("				<tr>\n");
      out.write("					<td>극장 이름</td>\n");
      out.write("					<td><input type=\"text\" class=\"form-control\" name=\"cname\" id=\"i1\" required></td>\n");
      out.write("				</tr>\n");
      out.write("				\n");
      out.write("				<tr>\n");
      out.write("					<td>좌석 수</td>\n");
      out.write("					<td><input type=\"text\" class=\"form-control\" name=\"seat\" id=\"i1\" placeholder=\"숫자로 입력(최대 299석)\" required></td>\n");
      out.write("				</tr>\n");
      out.write("				\n");
      out.write("				<tr>\n");
      out.write("					<td>주소</td>\n");
      out.write("					<td><input type=\"text\" class=\"form-control\" name=\"address\" id=\"i1\" required></td>\n");
      out.write("				</tr>\n");
      out.write("				\n");
      out.write("				<tr>\n");
      out.write("					<td>전화번호</td>\n");
      out.write("					<td class=\"tel\">\n");
      out.write("						&nbsp;&nbsp;\n");
      out.write("						<input type=\"text\" name=\"tel1\" size=\"5\" maxlength=\"4\" style=\"background : #353535; border : 0.1px solid white;\"> -\n");
      out.write("						<input type=\"text\" name=\"tel2\" size=\"5\" maxlength=\"4\" style=\"background : #353535; border : 0.1px solid white;\">\n");
      out.write("					</td>\n");
      out.write("				</tr>\n");
      out.write("				<tr>\n");
      out.write("					<td colspan=\"2\" height=\"40\">\n");
      out.write("						<br>\n");
      out.write("						<input type=\"submit\" value=\"극장 등록\" id=\"sub\">\n");
      out.write("					</td>\n");
      out.write("				</tr>\n");
      out.write("			</table>\n");
      out.write("		</form>\n");
      out.write("		<br>\n");
      out.write("	</td>\n");
      out.write("\n");
      out.write("    \n");
      out.write("	</tr>\n");
      out.write("	\n");
      out.write("	<tr>\n");
      out.write("		<td colspan=\"4\">\n");
      out.write("			<hr>\n");
      out.write("		</td>\n");
      out.write("	</tr>\n");
      out.write("	<tr bgcolor=\"#272727\">\n");
      out.write("		<td colspan=\"4\">\n");
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
