package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetLicenseDAO {

	public void addEmployeeLicense(String empCode, String licenseCode, Date getDate)
											throws SQLException, ClassNotFoundException{

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"INSERT into t_get_license VALUES(?, ?, ?)")) {

			pstmt.setString(1, empCode);
			pstmt.setString(2, licenseCode);
			pstmt.setDate(3, getDate);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public String getLicenseCode(String empCode) throws SQLException, ClassNotFoundException {

		String licenseCode = null;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"SELECT license_code FROM t_get_license WHERE emp_code = ?")) {

			pstmt.setString(1, empCode);

			ResultSet res = pstmt.executeQuery();

			res.next();
			licenseCode = res.getString("license_code");

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return licenseCode;
	}

}
