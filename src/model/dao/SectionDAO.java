package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SectionDAO {

	public String getSectionName(String sectionCode) throws SQLException, ClassNotFoundException {

		String sectionName = null;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"SELECT section_name FROM m_section WHERE section_code = ?")) {

			pstmt.setString(1, sectionCode);

			ResultSet res = pstmt.executeQuery();

			res.next();
			sectionName = res.getString("section_name");

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return sectionName;

	}

	public String getSectionCode(String sectionName) throws SQLException, ClassNotFoundException {

		String sectionCode = null;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"SELECT section_code FROM m_section WHERE section_name = ?")) {

			pstmt.setString(1, sectionName);

			ResultSet res = pstmt.executeQuery();

			res.next();
			sectionCode = res.getString("section_code");

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return sectionCode;

	}

}
