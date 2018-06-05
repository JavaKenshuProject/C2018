package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	private final static String URL = "jdbc:mysql://localhost/emp_sys_db";
	private final static String USER = "root";
	private final static String PASSWORD = "root";

	public static Connection getConnection() throws SQLException, ClassNotFoundException {

		Class.forName("com.mysql.jdbc.Driver");

		return DriverManager.getConnection(URL, USER, PASSWORD);

	}

}