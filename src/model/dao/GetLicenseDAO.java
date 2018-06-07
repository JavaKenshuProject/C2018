/**
 * employeeManagement
 * GetLicenseDAO.java
 *
 * Cteam
 */
package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 保有資格登録に関するデータベース接続
 *
 * @author Niibo
 * @version 1.00
 *
 */
public class GetLicenseDAO {

	/**
	 * 従業員の保有資格を登録するメソッド
	 *
	 * @param empCode 従業員コード
	 * @param licenseCode 資格コード
	 * @param getDate 取得日
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public void addEmployeeLicense(String empCode, String licenseCode, Date getDate)
											throws SQLException, ClassNotFoundException{

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"INSERT into t_get_license VALUES(?, ?, ?);")) {

			pstmt.setString(1, empCode);
			pstmt.setString(2, licenseCode);
			pstmt.setDate(3, getDate);

			pstmt.executeUpdate();

		}

	}

	/**
	 * 従業員コードから資格コードを取得するメソッド
	 *
	 * @param empCode 従業員コード
	 * @return 資格コード
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public String getLicenseCode(String empCode) throws SQLException, ClassNotFoundException {

		String licenseCode = null;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"SELECT license_code FROM t_get_license WHERE emp_code = ?;")) {

			pstmt.setString(1, empCode);

			ResultSet res = pstmt.executeQuery();

			if(res.next()) {
				licenseCode = res.getString("license_code");
			}

		}

		return licenseCode;
	}

}
