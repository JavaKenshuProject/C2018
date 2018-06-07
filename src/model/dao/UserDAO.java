
/**
 * employeeManagement
 * UserDAO.java
 *
 *
 * @author Cteam
 *
 */

package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.entity.UserBean;

/**
 *
 * システム利用者登録のDB処理
 *
 * @author kogami
 * @version 1.00
 *
 */
public class UserDAO {
	public UserBean getUser(String userId, String password) {

		UserBean user = new UserBean(); // UserBean型のオブジェクト取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT user_id,password,section_code FROM m_user WHERE user_id=? AND password=?;")) {

			pstmt.setString(1, userId); // 引数のuserIdをセット
			pstmt.setString(2, password); // 引数のpasswordをセット

			ResultSet res = pstmt.executeQuery();

			res.next();
			user.setUserId(res.getString("user_id")); // userにuserIdをセット
			user.setPassword(res.getString("password")); // userにpasswordをセット

			SectionDAO secDao = new SectionDAO();
			user.setSectionName(secDao.getSectionName(res.getString("section_code")));  // userにsectionNameをセット

			System.out.println(res.getString("section_code"));
			System.out.println(secDao.getSectionName(res.getString("section_code")));

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return user;

	}

	public void addUser(String userId, String password, String sectionCode) throws SQLException, ClassNotFoundException {

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO m_user VALUES (?,?,?,CURRENT_TIMESTAMP)")) {

			pstmt.setString(1, userId); // 引数のuserIdをセット
			pstmt.setString(2, password); // 引数のpasswordをセット
			pstmt.setString(3, sectionCode);  //sectionCodeをセット

			pstmt.executeUpdate();

		}

	}

}
