/**
 * employeeManagement
 * SectionDAO.java
 *
 * Cteam
 */
package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 部署に関するデータベース接続
 *
 * @author Niibo
 * @version 1.00
 *
 */
public class SectionDAO {

	/**
	 * 部署コードから部署名を取得するメソッド
	 *
	 * @param sectionCode 部署コード
	 * @return 部署名
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public String getSectionName(String sectionCode) throws SQLException, ClassNotFoundException {

		String sectionName = null;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"SELECT section_name FROM m_section WHERE section_code = ?;")) {

			pstmt.setString(1, sectionCode);

			ResultSet res = pstmt.executeQuery();

			if(res.next()) {
				sectionName = res.getString("section_name");
			}

		}

		return sectionName;

	}

	/**
	 * 部署名から部署コードを取得するメソッド
	 *
	 * @param sectionName 部署名
	 * @return 部署コード
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public String getSectionCode(String sectionName) throws SQLException, ClassNotFoundException {

		String sectionCode = null;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"SELECT section_code FROM m_section WHERE section_name = ?;")) {

			pstmt.setString(1, sectionName);

			ResultSet res = pstmt.executeQuery();

			if(res.next()) {
				sectionCode = res.getString("section_code");
			}

		}

		return sectionCode;

	}

}
