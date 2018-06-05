package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.EmployeeBean;

public class EmployeeDAO {

	public List<EmployeeBean> getEmployee(String str1, String str2) throws SQLException, ClassNotFoundException {

		List<EmployeeBean> empList = null;

		try (Connection con = ConnectionManager.getConnection(); Statement stmt = con.createStatement()) {

			ResultSet res = null;

			if (str1 == null || str2 == null) {
				res = stmt.executeQuery("SELECT * FROM m_employee");
			} else {

				try (PreparedStatement pstmt = con.prepareStatement(
					"SELECT * FROM m_employee WHERE l_name like \'% ? %\' or f_name like \'% ? %\' or"
						+ "l_kana_name like \'% ? %\' or f_kana_name like \'% ? %\' or section_code like \'% ? %\';")) {

					if (str1.equals("氏名")) {
						pstmt.setString(1, str2);
						pstmt.setString(2, str2);
						pstmt.setString(3, str2);
						pstmt.setString(4, str2);
					} else if (str1.equals("部署")) {
						SectionDAO sdao = new SectionDAO();
						String sectionCode = sdao.getSectionCode(str2);
						pstmt.setString(5, sectionCode);
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}

			}

			while (res.next()) {

				if (empList == null) {
					empList = new ArrayList<EmployeeBean>();
				}
				EmployeeBean emp = new EmployeeBean();

				String empCode = res.getString("emp_code");
				emp.setEmpCode(empCode);
				emp.setlKanji(res.getString("l_name"));
				emp.setfKangji(res.getString("f_name"));
				emp.setlKana(res.getString("l_kana_name"));
				emp.setfKana(res.getString("f_kana_name"));
				emp.setSex(res.getByte("sex"));
				emp.setBirthday(res.getDate("birth_day"));

				String sectionCode = res.getString("section_code");
				SectionDAO sdao = new SectionDAO();
				String sectionName = sdao.getSectionName(sectionCode);
				emp.setSectionName(sectionName);

				emp.setEmpDate(res.getDate("emp_date"));

				GetLicenseDAO gldao = new GetLicenseDAO();
				String licenseCode = gldao.getLicenseCode(empCode);
				LicenseDAO ldao = new LicenseDAO();
				String licenseName = ldao.getLicenseName(licenseCode);
				emp.setLicenseName(licenseName);

				empList.add(emp);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return empList;

	}

	public void addEmployee(String empCode, String lKanji, String fKanji, String lKana, String fKana,
								byte sex, Date birthday, String sectionCode, Date empDate)
															throws SQLException, ClassNotFoundException {

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"INSERT INTO m_employee VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);")) {

			pstmt.setString(1, empCode);
			pstmt.setString(2, lKanji);
			pstmt.setString(3, fKanji);
			pstmt.setString(4, lKana);
			pstmt.setString(5, fKana);
			pstmt.setByte(6, sex);
			pstmt.setDate(7, birthday);
			pstmt.setString(8, sectionCode);
			pstmt.setDate(9, empDate);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void deleteEmployee(String empCode) throws SQLException, ClassNotFoundException {

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement("DELETE FROM m_employee where emp_code = ?;")) {

			pstmt.setString(1, empCode);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void changeEmployee(String empCode, String lKanji, String fKanji, String lKana, String fKana,
									byte sex, String sectionCode) throws SQLException, ClassNotFoundException {

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("INSERT INTO m_employee VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);")) {

			pstmt.setString(1, empCode);
			pstmt.setString(2, lKanji);
			pstmt.setString(3, fKanji);
			pstmt.setString(4, lKana);
			pstmt.setString(5, fKana);
			pstmt.setByte(6, sex);
			pstmt.setString(8, sectionCode);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}