/**
 * employeeManagement
 * LoginServlet.java
 *
 * @author Cteam
 *
 */
package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;
import model.entity.UserBean;

/**
 * ログイン、ログアウト制御サーブレット
 *
 * @author kogami
 * @version 1.00
 *
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	static int count = 0; // ログイン失敗の回数

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
	 *      response) ログインの制御メソッド 引数のrequestオブジェクトは入力値が入ってる 戻り値なし
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action"); // 処理の種類
		String userId = null;
		String password = null;
		UserBean user = null; // ログインできた場合に情報を保存
		String url = null; // 遷移先url
		HttpSession session = request.getSession();

		if ("ログイン".equals(action)) {
			if (session.getAttribute("count") ==null || (int)session.getAttribute("count")<5) {　
				userId = request.getParameter("userId");
				password = request.getParameter("password");

				UserDAO uDao = new UserDAO();
				user = uDao.getUser(userId, password); // ログイン判定

				if (user.getUserId() != null) { // ログインできたとき
					session.removeAttribute("count");
					count = 0; // 失敗回数を0に
					url = "/menu.jsp"; // メニューページに飛ぶ
					session.setAttribute("sectionName", user.getSectionName()); // sectionNameを保存
				} else {
					if (session.getAttribute("count") != null) {
						count = (int) session.getAttribute("count");
						count += 1; // 失敗回数を足す
					} else {
						count += 1;
					}

					session.setAttribute("count", count);
					url = "/loginError.jsp"; // エラーページに飛ぶ
				}
			}else {
				url = "/loginError.jsp"; // エラーページに飛ぶ
			}

		} else if ("ログアウト".equals(action)) {
			url = "/logout.jsp"; // ログアウトページに飛ぶ
		}

		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response); // 遷移先

	}
}
