/**
 * employeeManagement
 * UserServlet.java
 *
 * @author Cteam
 *
 */

package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.SectionDAO;
import model.dao.UserDAO;


/**
 *
 * システム利用者追加のサーブレット
 *
 * @author kogami
 * @version 1.00
 *
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *
	 *      システム利用者新規追加の制御
	 *      引数のrequestオブジェクトには入力値が入っている
	 *      戻り値なし
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String url = null;

		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String sectionName = request.getParameter("sectionName");

		try {
			SectionDAO secDao = new SectionDAO();
			String sectionCode = secDao.getSectionCode(sectionName);  //sectionCodeを取得

			if(userId == "") {
				throw new NullPointerException("ユーザIDを入力してください");
			} else if(password == "") {
				throw new NullPointerException("パスワードを入力してください");
			} else if(sectionCode == null) {
				throw new NullPointerException("部署名を選択してください");
			}
			UserDAO uDao = new UserDAO();
			uDao.addUser(userId, password, sectionCode);  // 利用者追加
			url="userRegisterComplete.jsp";  // 成功画面

		} catch (NullPointerException | ClassNotFoundException e) {
			session.setAttribute("error", e.getMessage());
			url = "userRegisterError.jsp";  // 失敗画面
		} catch (SQLException e) {
			url = "userRegisterErrorDup.jsp";  // 失敗画面
		}

		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);  // 遷移

	}

}
