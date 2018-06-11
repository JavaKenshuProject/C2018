
/**
 * employeeManagement
 * LicenseServlet.java
 */
/**
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

import model.dao.LicenseDAO;

/**
 * 資格を追加するサーブレット
 *
 * @author kogami
 * @version 1.00
 *
 */
@WebServlet("/LicenseServlet")
public class LicenseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LicenseServlet() {
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
	 *      response) 資格追加の制御メソッド 引数のrequestオブジェクトには入力値が入っている 戻り値なし
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String url = null; // 遷移先url

		String licenseCode = request.getParameter("licenseCode"); // 入力値取得
		String licenseName = request.getParameter("licenseName"); // 入力値取得

		LicenseDAO lDao = new LicenseDAO();
		try {
			if (licenseCode == "") {
				throw new NullPointerException("資格コードを入力してください"); // nullは登録しない
			} else if(licenseName == "") {
				throw new NullPointerException("資格名を入力してください"); // nullは登録しない
			}
			lDao.addLicense(licenseCode, licenseName);
			url = "addLicenseComplete.jsp"; // 成功
		} catch (ClassNotFoundException | NullPointerException e) {
			session.setAttribute("error", e.getMessage());
			url = "addLicenseError.jsp"; // 失敗
		} catch (SQLException e) {
			e.printStackTrace();
			url = "addLicenseErrorDup.jsp"; // 失敗
		}

		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response); // 遷移

	}

}
