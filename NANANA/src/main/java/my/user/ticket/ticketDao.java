package my.user.ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ticketDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static ticketDao tdao;

	private ticketDao() {
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

	public static ticketDao getInstance() {
		if(tdao==null)
			tdao = new ticketDao();
		return tdao;
	}


	public int insertTicket(ticketBean tb) {
		int cnt = -1;
		String sql = "insert into ticket values(ticket_seq.nextval,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, tb.getTmovie());
			ps.setString(2, tb.getTcinema());
			ps.setString(3, tb.getTime());
			ps.setString(4, tb.getTid());
			ps.setString(5, tb.getSeat_pos());
			ps.setInt(6, tb.getSeat_cap());
			ps.setInt(7, tb.getAdult());
			ps.setInt(8, tb.getChild());
			ps.setString(9, tb.getPay());

			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}

	public ArrayList<ticketBean> getTicketById(String sid){
		ArrayList<ticketBean> tlist = new ArrayList<ticketBean>();
		String sql = "select t.tno, t.tmovie, t.tcinema, t.time, t.tid, t.seat_pos, t.seat_cap, t.adult, t.child, t.pay, m.mno, m.poster, m.mage, u.uname, u.birth\n"
				+ "from (movie m inner join ticket t on m.mname = t.tmovie) inner join na_user u on t.tid = u.id\n"
				+ "where t.tid = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sid);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				ticketBean tb = new ticketBean();
				tb.setTno(rs.getInt("tno"));
				tb.setTmovie(rs.getString("tmovie"));
				tb.setTcinema(rs.getString("tcinema"));
				tb.setTime(rs.getString("time"));
				tb.setTid(rs.getString("tid"));
				tb.setSeat_pos(rs.getString("seat_pos"));
				tb.setSeat_cap(rs.getInt("seat_cap"));
				tb.setAdult(rs.getInt("adult"));
				tb.setChild(rs.getInt("child"));
				tb.setPay(rs.getString("pay"));
				tb.setMno(rs.getInt("mno"));
				tb.setPoster(rs.getString("poster"));
				tb.setMage(rs.getInt("mage"));
				tb.setUname(rs.getString("uname"));
				tb.setBirth(rs.getInt("birth"));
				
				tlist.add(tb);
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
		return tlist;	
	}
	
	public int deleteTicket(String tno) {
		int cnt = -1;
		String sql = "delete ticket where tno = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, tno);

			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public int deleteTicketByTid(String tid) {
		int cnt = -1;
		String sql = "delete ticket where tid = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, tid);
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public ArrayList<ticketBean> getAllTicket(){
		ArrayList<ticketBean> tlist = new ArrayList<ticketBean>();
		String sql = "select t.tno, t.tmovie, t.tcinema, t.time, t.tid, t.seat_pos, t.seat_cap, t.adult, t.child, t.pay, m.mno, m.poster, m.mage, u.uname, u.birth\n"
				+ "from (movie m inner join ticket t on m.mname = t.tmovie) inner join na_user u on t.tid = u.id order by tno";
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				ticketBean tb = new ticketBean();
				tb.setTno(rs.getInt("tno"));
				tb.setTmovie(rs.getString("tmovie"));
				tb.setTcinema(rs.getString("tcinema"));
				tb.setTime(rs.getString("time"));
				tb.setTid(rs.getString("tid"));
				tb.setSeat_pos(rs.getString("seat_pos"));
				tb.setSeat_cap(rs.getInt("seat_cap"));
				tb.setAdult(rs.getInt("adult"));
				tb.setChild(rs.getInt("child"));
				tb.setPay(rs.getString("pay"));
				tb.setMno(rs.getInt("mno"));
				tb.setPoster(rs.getString("poster"));
				tb.setMage(rs.getInt("mage"));
				tb.setUname(rs.getString("uname"));
				tb.setBirth(rs.getInt("birth"));
				
				tlist.add(tb);
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
		return tlist;	
	}
	
	

}
