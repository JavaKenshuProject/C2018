package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LicenseDAO {

	public void addLicense(String licenseCode, String licenseName) throws SQLException, ClassNotFoundException {

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement("INSERT INTO m_license VALUES(?, ?)")) {

			pstmt.setString(1, licenseCode);
			pstmt.setString(2, licenseName);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public String getLicenseCode(String licenseName) throws SQLException, ClassNotFoundException {

		String licenseCode = null;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"SELECT license_code FROM m_license WHERE license_name = ?")) {

			pstmt.setString(1, licenseName);

			ResultSet res = pstmt.executeQuery();

			res.next();
			licenseCode = res.getString("license_code");

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return licenseCode;

	}

	public String getLicenseName(String licenseCode) throws SQLException, ClassNotFoundException {

		String licenseName = null;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"SELECT license_name FROM m_license WHERE license_code = ?")) {

			pstmt.setString(1, licenseCode);

			ResultSet res = pstmt.executeQuery();

			res.next();
			licenseName = res.getString("license_name");

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return licenseName;

	}

}
