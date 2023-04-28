package my.user.inquiry;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class inquiryDao {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String dbid = "jspid";
	private String dbpw = "jsppw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static inquiryDao idao;
	
	public static inquiryDao getInstance() {
		if(idao == null) {
			idao = new inquiryDao();
		}
		return idao;
	}
	
	private inquiryDao() {
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbid,dbpw);

		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public int getArticleCount() {
		int count = 0;
		String sql = "select count(*) from inquiry";
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}

		} catch( SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(ps != null) {
					ps.close();
				}	
				if(rs != null) {
					rs.close();
				}	
			}catch(SQLException e){
				e.printStackTrace();
			}	
		}
		
		return count;
	}
	
	public ArrayList<inquiryBean> getArticles(int start, int end){
		ArrayList<inquiryBean> ilist = new ArrayList<inquiryBean>();
		String sql = "select ino, iid, subject, passwd, reg_date, readcount, ref, re_step, re_level, content from (select rownum as rank, ino, iid, subject, passwd, reg_date, readcount, ref, re_step, re_level, content from (select ino, iid, subject, passwd, reg_date, readcount, ref, re_step, re_level, content from inquiry order by ref desc, re_step asc)) where rank between ? and ?";
		try {
			//3.
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			//4.
			rs = ps.executeQuery();
			while(rs.next()) {
				inquiryBean ib = new inquiryBean();
				ib.setIno(rs.getInt("ino"));
				ib.setIid(rs.getString("iid"));
				ib.setSubject(rs.getString("subject"));
				ib.setPasswd(rs.getInt("passwd"));
				ib.setReg_date(rs.getTimestamp("reg_date"));
				ib.setReadcount(rs.getInt("readcount"));
				ib.setRef(rs.getInt("ref"));
				ib.setRe_step(rs.getInt("re_step"));
				ib.setRe_level(rs.getInt("re_level"));
				ib.setContent(rs.getString("content"));
				
				ilist.add(ib);
			}

		} catch( SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(ps != null) {
					ps.close();
				}	
				if(rs != null) {
					rs.close();
				}	
			}catch(SQLException e){
				e.printStackTrace();
			}	
		}
		return ilist;
	}
	
	public inquiryBean getInquiryByIno(String ino) {
		inquiryBean ib  = null;
		String sql2 = "update inquiry set readcount = readcount+1 where ino=?";
		String sql = "select * from inquiry where ino=?";
		try {
			ps = conn.prepareStatement(sql2);
			ps.setString(1, ino);
			ps.executeUpdate();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, ino);
			rs = ps.executeQuery();
			if(rs.next()) {
				ib = new inquiryBean();
				ib.setIno(rs.getInt("ino"));
				ib.setIid(rs.getString("iid"));
				ib.setSubject(rs.getString("subject"));
				ib.setPasswd(rs.getInt("passwd"));
				ib.setReg_date(rs.getTimestamp("reg_date"));
				ib.setReadcount(rs.getInt("readcount"));
				ib.setRef(rs.getInt("ref"));
				ib.setRe_step(rs.getInt("re_step"));
				ib.setRe_level(rs.getInt("re_level"));
				ib.setContent(rs.getString("content"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(ps != null) {
					ps.close();
				}	
				if(rs != null) {
					rs.close();
				}	
			}catch(SQLException e){
				e.printStackTrace();
			}	
		}
		return ib;
	}
	public inquiryBean getContentByIno(int ino) {
		inquiryBean ib  = null;
		String sql = "select * from inquiry where ino=?";
		try {
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ino);
			rs = ps.executeQuery();
			if(rs.next()) {
				ib = new inquiryBean();
				ib.setIno(rs.getInt("ino"));
				ib.setIid(rs.getString("iid"));
				ib.setSubject(rs.getString("subject"));
				ib.setPasswd(rs.getInt("passwd"));
				ib.setReg_date(rs.getTimestamp("reg_date"));
				ib.setReadcount(rs.getInt("readcount"));
				ib.setRef(rs.getInt("ref"));
				ib.setRe_step(rs.getInt("re_step"));
				ib.setRe_level(rs.getInt("re_level"));
				ib.setContent(rs.getString("content"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(ps != null) {
					ps.close();
				}	
				if(rs != null) {
					rs.close();
				}	
			}catch(SQLException e){
				e.printStackTrace();
			}	
		}
		return ib;
	}
	
	public int insertInquiry(String iid, String subject, String content, int passwd, Timestamp reg_date) {
		int cnt = -1;
		String sql = "insert into inquiry(ino,iid,subject,passwd,reg_date,ref,re_step,re_level,content)"
				+ "values(inquiry_seq.nextval,?,?,?,?,inquiry_seq.currval,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, iid);
			ps.setString(2, subject);
			ps.setInt(3, passwd);
			ps.setTimestamp(4, reg_date);
			ps.setInt(5, 0);
			ps.setInt(6, 0);
			ps.setString(7, content);
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(ps != null) {
					ps.close();
				}	
			}catch(SQLException e){
				e.printStackTrace();
			}	
		}
		return cnt;
	}
	
	public int replyInquiry(inquiryBean ib) {
		int cnt = -1;
		int re_step, re_level;
		String sql2 = "update inquiry set re_step=re_step+1 where ref=? and re_step > ?";
		
		String sql = "insert into inquiry(ino,iid,subject,passwd,reg_date,ref,re_step,re_level,content)"
				+ "values(inquiry_seq.nextval,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, ib.getRef());
			ps.setInt(2, ib.getRe_step());
			ps.executeUpdate();
			
			re_step = ib.getRe_step() + 1;
			re_level = ib.getRe_level() + 1;
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, ib.getIid());
			ps.setString(2, ib.getSubject());
			ps.setInt(3, ib.getPasswd());
			ps.setTimestamp(4, ib.getReg_date());
			ps.setInt(5, ib.getRef());
			ps.setInt(6, re_step);
			ps.setInt(7, re_level);
			ps.setString(8, ib.getContent());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(ps != null) {
					ps.close();
				}	
			}catch(SQLException e){
				e.printStackTrace();
			}	
		}
		return cnt;
	}
	
	public int deleteInquiry(String ino) {
		int cnt = -1;
		String sql = "delete inquiry where ino = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ino);
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(ps != null) {
					ps.close();
				}	
			}catch(SQLException e){
				e.printStackTrace();
			}	
		}
		return cnt;
	}
	
	public int updateInquiry(int ino, String subject, String content, Timestamp reg_date) {
		int cnt = -1;
		String sql = "update inquiry set subject=?, content=?, reg_date=? where ino = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, subject);
			ps.setString(2, content);
			ps.setTimestamp(3, reg_date);
			ps.setInt(4, ino);
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(ps != null) {
					ps.close();
				}	
			}catch(SQLException e){
				e.printStackTrace();
			}	
		}
		return cnt;
	}
	
	
	public int updateInquiryByIid(String iid) {
		int cnt = -1;
		String sql = "update inquiry set subject='관리자에 의해 변경되었습니다.', iid='manager' where iid=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, iid);
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(ps != null) {
					ps.close();
				}	
			}catch(SQLException e){
				e.printStackTrace();
			}	
		}
		return cnt;
	}
	
	
}
