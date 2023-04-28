package my.manager.snack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

import my.manager.movie.MovieBean;
import my.manager.movie.MovieDao;

public class SnackDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static SnackDao sdao;

	private SnackDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static SnackDao getInstance() {
		if(sdao==null)
			sdao = new SnackDao();
		return sdao;
	}

	public ArrayList<SnackBean> getAllSnack(){
		ArrayList<SnackBean> slist = new ArrayList<SnackBean>();
		String sql = "select * from snack order by sno";
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				SnackBean sb = new SnackBean();
				sb.setSno(rs.getInt("sno"));
				sb.setSname(rs.getString("sname"));
				sb.setSimage(rs.getString("simage"));
				sb.setSprice(rs.getInt("sprice"));
				sb.setScomp(rs.getString("scomp"));
				
				slist.add(sb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return slist;
	}
	
	public int insertSnack(MultipartRequest mr) {
		int cnt = -1;
		String sql = "insert into snack values(snack_seq.nextval,?,?,?,?)";
		try {
			String simage = null;
			if(mr.getFilesystemName("simage") == null) {
				simage = "이미지 없음";
			}
			else {
				simage = mr.getFilesystemName("simage");
			}
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("sname"));
			ps.setString(2, simage);
			ps.setInt(3, Integer.parseInt(mr.getParameter("sprice")));
			ps.setString(4, mr.getParameter("scomp"));
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
	}
	
	public int deleteSnack(int sno) {
		int cnt = -1;
		String sql = "delete snack where sno=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sno);
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
	}
	
	public SnackBean getSnackBySno(String sno){
		SnackBean sb = null;
		String sql = "select * from snack where sno=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sno);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				sb = new SnackBean();
				sb.setSno(rs.getInt("sno"));
				sb.setSname(rs.getString("sname"));
				sb.setSimage(rs.getString("simage"));
				sb.setSprice(rs.getInt("sprice"));
				sb.setScomp(rs.getString("scomp"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb;
	}
	
	public int updateSnack(MultipartRequest mr, String simage) {
		int cnt = -1;
		String sql = "update snack set sname=?, simage=?, sprice=?, scomp=? where sno=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("sname"));
			ps.setString(2, mr.getFilesystemName("simage"));
			ps.setInt(3, Integer.parseInt(mr.getParameter("sprice")));
			ps.setString(4, mr.getParameter("scomp"));
			ps.setString(5, mr.getParameter("sno"));
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			try {
				if(ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
}

