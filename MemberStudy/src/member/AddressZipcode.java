package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AddressZipcode {
	String area1;
	String area2;
	String area3;
	String area4;
	String zipcode;

	public String getArea1() {
		return area1;
	}

	public void setArea1(String area1) {
		this.area1 = area1;
	}

	public String getArea2() {
		return area2;
	}

	public void setArea2(String area2) {
		this.area2 = area2;
	}

	public String getArea3() {
		return area3;
	}

	public void setArea3(String area3) {
		this.area3 = area3;
	}

	public String getArea4() {
		return area4;
	}

	public void setArea4(String area4) {
		this.area4 = area4;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	private static AddressZipcode instance = new AddressZipcode();

	// singleton
	public static AddressZipcode getInstance() {
		return instance;
	}

	public static Connection getConnection() throws NamingException, SQLException {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/encore");

		return ds.getConnection();
	}

	public  ArrayList<AddressZipcode> searchAddress(String area) {
		ArrayList<AddressZipcode> adrList = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			adrList = new ArrayList<AddressZipcode>();
			String sql = "select * from zipcode where area3 like ?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, area +"%");

			rs = pstmt.executeQuery();
			String zip;
			String area1,area2,area3,area4;
			while (rs.next()) {
				AddressZipcode adr = new AddressZipcode();
				zip = rs.getString(1);
				area1 = rs.getString(2);
				area2 = rs.getString(3);
				area3 = rs.getString(4);
				area4 = rs.getString(5);
				adr.setZipcode(zip);
				adr.setArea1(area1);
				adr.setArea2(area2);
				adr.setArea3(area3);
				adr.setArea4(area4);
				
				adrList.add(adr);
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return adrList;
	}

}//class



	


