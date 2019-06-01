package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//싱글 톤 패텬
public class LogonDBBean {
	//Singleton pattern
	private static LogonDBBean instance = new LogonDBBean();
	public static LogonDBBean getInstance() { //factory-method
		return instance;
	}
	public Connection getConnection() throws NamingException, SQLException {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/encore");
		return ds.getConnection();
	}
	
	
	
	public int updateMember(LogonDataBean memberDto) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql =  "update memberstudy set passwd =? ,tel = ?, zipcode=?, address=?,  email=? where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberDto.getPasswd());
			pstmt.setString(2, memberDto.getTel());
			pstmt.setString(3, memberDto.getZipcode());
			pstmt.setString(4, memberDto.getAddress());
			pstmt.setString(5, memberDto.getEmail());
			pstmt.setString(6, memberDto.getId());
			
			result = pstmt.executeUpdate();
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int insertMember(LogonDataBean memberDto) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql =  "insert into memberstudy values(?,?,?,?  ,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberDto.getId());
			pstmt.setString(2, memberDto.getPasswd());
			pstmt.setString(3, memberDto.getName());
			pstmt.setString(4, memberDto.getZipcode());
			pstmt.setString(5, memberDto.getAddress());
			pstmt.setString(6, memberDto.getTel());
			pstmt.setString(7, memberDto.getEmail());
			pstmt.setTimestamp(8, memberDto.getReg_date());
			
			result = pstmt.executeUpdate();
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public int checkId(String id) {
		int result = 0;
		Connection con= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			
			String sql = "select * from memberstudy where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=1;
			}else {
				result=0;
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int check(String id, String passwd) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			
			String sql = "select * from memberstudy where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//아이디 있다.
				if(passwd.equals(rs.getString("passwd"))) {
					//비번 있음
					result = 1;
				} else {
					//비번 없음
					result = -1;
				}
			}else {
				//아이디 없다.
				result=0;
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int deleteMember(String id) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
	
		try {
			con = getConnection();
			
			String sql = "delete from memberstudy where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			//작업한 개수값이 리턴값 --> result, ==0 이면 아무 작업도 안했다.
			result = pstmt.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	public LogonDataBean getMember(String id) {
		LogonDataBean memberDto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select * from memberstudy where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			//rs.next 의 일은 ?? 데이터를 가져오나 못가져오나 알려주나?? 진짜 역할은 한행을 읽었냐가 아니라
			//real role : 한 행을 읽어라
			if(rs.next()) {
				memberDto = new LogonDataBean();
				
				memberDto.setId(rs.getString("id")); //변경 x
				memberDto.setPasswd(rs.getString("passwd"));
				memberDto.setName(rs.getString("name"));//변경 x
				memberDto.setZipcode(rs.getString("zipcode"));//변경 x
				
				memberDto.setAddress(rs.getString("address"));//변경 x
				memberDto.setTel(rs.getString("tel"));
				memberDto.setEmail(rs.getString("email"));
				memberDto.setReg_date(rs.getTimestamp("reg_date"));//변경 x
				
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return memberDto;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class
