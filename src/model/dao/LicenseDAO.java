/**
 * employeeManagement
 * LicenseDAO.java
 *
 * Cteam
 */
package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * 資格に関するデータベース接続
 *
 * @author Niibo
 * @version 1.00
 *
 */
public class LicenseDAO {

	/**
	 * 資格を追加するメソッド
	 *
	 * @param licenseCode 資格コード
	 * @param licenseName 資格名
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public void addLicense(String licenseCode, String licenseName) throws SQLException, ClassNotFoundException {

		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
					PreparedStatement pstmt = con.prepareStatement("INSERT INTO m_license VALUES(?, ?);")) {

			ResultSet res = stmt.executeQuery("SELECT license_name FROM m_license;");

			while(res.next()) {
				if(licenseName.equals(res.getString("license_name"))) {
					throw new SQLException();
				}
			}

			pstmt.setString(1, licenseCode);
			pstmt.setString(2, licenseName);

			pstmt.executeUpdate();

		}

	}

	/**
	 * 資格名から資格コードを取得するメソッド
	 *
	 * @param licenseName 資格名
	 * @return 資格コード
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public String getLicenseCode(String licenseName) throws SQLException, ClassNotFoundException {

		String licenseCode = null;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"SELECT license_code FROM m_license WHERE license_name = ?;")) {

			pstmt.setString(1, licenseName);

			ResultSet res = pstmt.executeQuery();

			if(res.next()) {
				licenseCode = res.getString("license_code");
			}

		}

		return licenseCode;

	}

	/**
	 * 資格コードから資格名を取得するメソッド
	 *
	 * @param licenseCode 資格コード
	 * @return 資格名
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public String getLicenseName(String licenseCode) throws SQLException, ClassNotFoundException {

		String licenseName = null;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"SELECT license_name FROM m_license WHERE license_code = ?;")) {

			pstmt.setString(1, licenseCode);

			ResultSet res = pstmt.executeQuery();

			if(res.next()) {
				licenseName = res.getString("license_name");
			}

		}

		return licenseName;

	}

	/**
	 * データベース上のすべての資格名を取得するメソッド
	 *
	 * @return 資格名リスト
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<String> getLicenseAll() throws SQLException, ClassNotFoundException {

		List<String> licenseList = null;

		try (Connection con = ConnectionManager.getConnection(); Statement stmt = con.createStatement()) {

			ResultSet res = stmt.executeQuery("SELECT license_name FROM m_license;");

			while (res.next()) {

				licenseList = new ArrayList<>();
				licenseList.add(res.getString("license_name"));

			}

		}

		return licenseList;

	}

}
