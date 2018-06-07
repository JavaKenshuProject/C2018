/**
 * employeeManagement
 * EmployeeDAO.java
 *
 * Cteam
 */
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

/**
 * 従業員に関するデータベース接続
 *
 * @author Niibo
 * @version 1.00
 *
 */
public class EmployeeDAO {

	/**
	 * @param str1 カラム名
	 * @param str2 値
	 * @return 従業員リスト
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<EmployeeBean> getEmployee(String str1, String str2) throws SQLException, ClassNotFoundException {

		List<EmployeeBean> empList = null;  // 従業員リスト

		try (Connection con = ConnectionManager.getConnection(); Statement stmt = con.createStatement()) {

			ResultSet res = null;

			if (str1 == null || str2 == null) {  // 全従業員の情報をresに保存

				res = stmt.executeQuery("SELECT * FROM m_employee;");

			} else {  // 検索した文字が氏名あるいは部署名に含まれている従業員の情報をresに保存

				try (PreparedStatement pstmt = con.prepareStatement(
						"SELECT * FROM m_employee WHERE l_name like \'% ? %\' or f_name like \'% ? %\' or"
						+ "l_kana_name like \'% ? %\' or f_kana_name like \'% ? %\' or section_code like \'% ? %\';")) {

					if (str1.equals("氏名")) {  // カラム名が氏名の場合
						pstmt.setString(1, str2);
						pstmt.setString(2, str2);
						pstmt.setString(3, str2);
						pstmt.setString(4, str2);
					} else if (str1.equals("部署名")) {  // カラム名が部署名の場合
						SectionDAO sdao = new SectionDAO();
						String sectionCode = sdao.getSectionCode(str2);  // 部署名から部署コードを取得
						pstmt.setString(5, sectionCode);
					}

					res = pstmt.executeQuery();

				}

			}

			while (res.next()) {  // EmployeeBean型のempのフィールドに各要素を設定後、リストに追加

				empList = new ArrayList<EmployeeBean>();
				EmployeeBean emp = new EmployeeBean();

				String empCode = res.getString("emp_code");
				emp.setEmpCode(empCode);
				emp.setLKanji(res.getString("l_name"));
				emp.setFKanji(res.getString("f_name"));
				emp.setLKana(res.getString("l_kana_name"));
				emp.setFKana(res.getString("f_kana_name"));
				emp.setSex(res.getByte("sex"));
				emp.setBirthday(res.getDate("birth_day"));

				String sectionCode = res.getString("section_code");
				SectionDAO sdao = new SectionDAO();
				String sectionName = sdao.getSectionName(sectionCode);  // 部署コードから部署名を取得
				emp.setSectionName(sectionName);

				emp.setEmpDate(res.getDate("emp_date"));

				GetLicenseDAO gldao = new GetLicenseDAO();
				String licenseCode = gldao.getLicenseCode(empCode);
				LicenseDAO ldao = new LicenseDAO();
				String licenseName = ldao.getLicenseName(licenseCode);  // 資格コードから資格名を取得
				emp.setLicenseName(licenseName);

				empList.add(emp);

			}

		}

		return empList;

	}

	/**
	 * 従業員を登録するメソッド
	 *
	 * @param empCode 従業員コード
	 * @param lKanji 姓（漢字）
	 * @param fKanji 名（漢字）
	 * @param lKana 姓（カナ）
	 * @param fKana 名（カナ）
	 * @param sex 性別
	 * @param birthday 誕生日
	 * @param sectionCode 部署コード
	 * @param empDate 入社日
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public void addEmployee(String empCode, String lKanji, String fKanji, String lKana, String fKana,
											byte sex, Date birthday, String sectionCode, Date empDate)
															throws SQLException, ClassNotFoundException {

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"INSERT INTO m_employee VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);")) {

			// データベースに従業員を挿入
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

		}

	}

	/**
	 * 従業員を削除するメソッド
	 *
	 * @param empCode 従業員コード
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public void deleteEmployee(String empCode) throws SQLException, ClassNotFoundException {

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement("DELETE FROM m_employee where emp_code = ?;")) {

			// データベース上の従業員を削除
			pstmt.setString(1, empCode);
			pstmt.executeUpdate();

		}

	}

	/**
	 * 従業員情報を変更するメソッド
	 *
	 * @param empCode 従業員コード
	 * @param lKanji 姓（漢字）
	 * @param fKanji 名（漢字）
	 * @param lKana 姓（カナ）
	 * @param fKana 名（カナ）
	 * @param sex 性別
	 * @param sectionCode 部署コード
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public void changeEmployee(String empCode, String lKanji, String fKanji,String lKana, String fKana,
									byte sex, String sectionCode) throws SQLException, ClassNotFoundException {

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"UPDATE m_employee SET l_name = ?, f_name = ?, l_kana_name = ?, f_kana_name = ?, "
														+ "sex = ?, section_code = ? WHERE emp_code = ?;")) {
			// データベース上の各要素を更新
			pstmt.setString(1, lKanji);
			pstmt.setString(2, fKanji);
			pstmt.setString(3, lKana);
			pstmt.setString(4, fKana);
			pstmt.setByte(5, sex);
			pstmt.setString(6, sectionCode);

			pstmt.setString(7, empCode);

			pstmt.executeUpdate();

		}

	}

	/**
	 * 従業員コードから変更可能な従業員データを取得するメソッド
	 *
	 * @param empCode 従業員コード
	 * @return 変更可能な従業員データ
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public EmployeeBean getEmpData(String empCode) throws SQLException, ClassNotFoundException {

		EmployeeBean emp = null;  // 選択された従業員

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
					"SELECT l_name, f_name, l_kana_name, f_kana_name, sex, section_code "
													+ "FROM m_employee WHERE emp_code = ?;")) {

			pstmt.setString(1, empCode);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {  // EmployeeBean型のempのフィールドに各要素を設定

				emp = new EmployeeBean();

				emp.setLKanji(res.getString("l_name"));
				emp.setFKanji(res.getString("f_name"));
				emp.setLKana(res.getString("l_kana_name"));
				emp.setFKana(res.getString("f_kana_name"));
				emp.setSex(res.getByte("sex"));

				String sectionCode = res.getString("section_code");
				SectionDAO sdao = new SectionDAO();
				String sectionName = sdao.getSectionName(sectionCode);  // 部署コードから部署名を取得

				emp.setSectionName(sectionName);

			}

		}

		return emp;

	}

}