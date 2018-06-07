/**
 * employeeManagement
 * ConnectionManager.java
 *
 * Cteam
 */
package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * データベース管理クラスです
 *
 * @author Niibo
 * @version 1.00
 *
 */
public class ConnectionManager {

	private final static String URL = "jdbc:mysql://localhost:3306/emp_sys_db?useSSL=false";
	private final static String USER = "root";
	private final static String PASSWORD = "root";

	/**
	 * データベースの接続
	 *
	 * @return コネクション
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public static Connection getConnection() throws SQLException, ClassNotFoundException {

		Class.forName("com.mysql.jdbc.Driver");  // JDBCクラスの初期化処理
		return DriverManager.getConnection(URL, USER, PASSWORD);  // コネクションの取得

	}

}