package my.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import my.manager.movie.MovieBean;

public class userDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static userDao udao;

	private userDao() {
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

	public static userDao getInstance() {
		if(udao==null)
			udao = new userDao();
		return udao;
	}

	public boolean searchId(String userid) {
		boolean result = false;
		String sql = "select * from na_user where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(ps != null)
						ps.close();
					if(rs != null)
						rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}//

	public int insertUser(userBean ub) {
		int cnt = -1;
		String sql = "insert into na_user values(user_seq.nextval,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ub.getUname());
			ps.setString(2, ub.getId());
			ps.setString(3, ub.getPassword());
			ps.setInt(4, ub.getBirth());
			ps.setString(5, ub.getGender());
			ps.setString(6, ub.getEmail());
			ps.setString(7, ub.getHp1());
			ps.setString(8, ub.getHp2());
			ps.setString(9, ub.getHp3());

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

	public userBean getUserInfo(String id, String password) {
		userBean user = null;
		String sql = "select * from na_user where id=? and password=?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);

			rs = ps.executeQuery();

			if(rs.next()) {
				user = new userBean();
				user.setUno(rs.getInt("uno"));
				user.setUname(rs.getString("uname"));
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setBirth(rs.getInt("birth"));
				user.setGender(rs.getString("gender"));
				user.setEmail(rs.getString("email"));
				user.setHp1(rs.getString("hp1"));
				user.setHp2(rs.getString("hp2"));
				user.setHp3(rs.getString("hp3"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return user;
	}

	public ArrayList<userBean> getAllUser(){
		ArrayList<userBean> ulist = new  ArrayList<userBean>();
		String sql = "select * from na_user order by uno";
		try {
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();
			while(rs.next()) {
				userBean user = new userBean();
				user.setUno(rs.getInt("uno"));
				user.setUname(rs.getString("uname"));
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setBirth(rs.getInt("birth"));
				user.setGender(rs.getString("gender"));
				user.setEmail(rs.getString("email"));
				user.setHp1(rs.getString("hp1"));
				user.setHp2(rs.getString("hp2"));
				user.setHp3(rs.getString("hp3"));

				ulist.add(user);
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
		return ulist;
	}

	public userBean getMybyId(String id) {
		userBean user = null;
		String sql = "select * from na_user where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);

			rs = ps.executeQuery();
			if(rs.next()) {
				user = new userBean();
				user.setUno(rs.getInt("uno"));
				user.setUname(rs.getString("uname"));
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setBirth(rs.getInt("birth"));
				user.setGender(rs.getString("gender"));
				user.setEmail(rs.getString("email"));
				user.setHp1(rs.getString("hp1"));
				user.setHp2(rs.getString("hp2"));
				user.setHp3(rs.getString("hp3"));

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
		return user;	
	}

	public String findId(String uname, int birth) {
		String id = null;
		String sql = "select * from na_user where uname=? and birth=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,uname);
			ps.setInt(2, birth);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
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
		return id;
	}
	
	public String findPw(String id, String uname, int birth) {
		String password = null;
		String sql = "select * from na_user where id=? and uname=? and birth=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2,uname);
			ps.setInt(3, birth);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				password = rs.getString("password");
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
		return password;
	}
	
	public String getPwById(String id) {
		String password = null;
		String sql = "select * from na_user where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				password = rs.getString("password");
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
		return password;
	}
	
	public int deleteUser(String id) {
		int cnt = -1;
		String sql = "delete na_user where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);

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
	
	public int updateUser(userBean ub) {
		int cnt = -1;
		String sql = "update na_user set uname=?,birth=?,gender=?,email=?,hp1=?,hp2=?,hp3=? where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ub.getUname());
			ps.setInt(2, ub.getBirth());
			ps.setString(3, ub.getGender());
			ps.setString(4, ub.getEmail());
			ps.setString(5, ub.getHp1());
			ps.setString(6, ub.getHp2());
			ps.setString(7, ub.getHp3());
			ps.setString(8, ub.getId());

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
	
	public int updatePwById(String id, String password) {
		int cnt = -1;
		String sql = "update na_user set password=? where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, id);
			
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

}
