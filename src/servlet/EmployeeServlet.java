/**
 * employeeManagement
 * EmployeeServlet.java
 *
 * Cteam
 */
package servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.EmployeeDAO;
import model.dao.GetLicenseDAO;
import model.dao.LicenseDAO;
import model.dao.SectionDAO;
import model.entity.EmployeeBean;

/**
 * 従業員サーブレット
 */
/**
 * @author Niibo
 * @version 1.00
 *
 */
@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
														throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * 従業員情報を制御するメソッド
	 *
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * @param request リクエスト
	 * @param response レスポンス
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
														throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");  // エンコーディング方式を指定

		String action = request.getParameter("action");  // ボタン名
		String url = null;  // 遷移先のURL
		HttpSession session = request.getSession();  // セッションオブジェクトを取得

		EmployeeDAO edao = new EmployeeDAO(); // 従業員DAOをインスタンス化

		if("従業員一覧表示".equals(action)) {

			try {
				// 検索した従業員を取得してセッションに保存
				List<EmployeeBean> empList = edao.getEmployee(null, null);
				session.setAttribute("empList", empList);

			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
			url = "/employeeList.jsp";  // 従業員一覧画面

		} else if("検索".equals(action)) {

			String column = request.getParameter("column");  // カラム名
			String value = request.getParameter("value");  // 値
			try {
				// 検索した従業員を取得してセッションに保存
				List<EmployeeBean> empList = edao.getEmployee(column, value);
				session.setAttribute("empList", empList);

			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
			url = "/employeeList.jsp";  // 従業員一覧画面

		} else if("従業員情報変更".equals(action)) {

			try {
				String empCode = request.getParameter("empCode");
				if(empCode == null) {  // 従業員の未選択
					throw new ClassNotFoundException();
				}

				// 登録されている元のデータをセッションに保存
				session.setAttribute("empCode", empCode);
				EmployeeBean emp = edao.getEmpData(empCode);
				session.setAttribute("lKanji", emp.getLKanji());
				session.setAttribute("fKanji", emp.getFKanji());
				session.setAttribute("lKana", emp.getLKana());
				session.setAttribute("fKana", emp.getFKana());
				session.setAttribute("sex", emp.getSex());
				session.setAttribute("sectionName", emp.getSectionName());

			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
			url = "/employeeDataChange.jsp";  // 従業員情報変更画面

		} else if("更新".equals(action)) {

			String empCode = (String)session.getAttribute("empCode");
			try {
				String lKanji = request.getParameter("lKanji");
				String fKanji = request.getParameter("fKanji");
				String lKana = request.getParameter("lKana");
				String fKana = request.getParameter("fKana");
				byte sex = Byte.valueOf(request.getParameter("sex"));

				String sectionName = request.getParameter("sectionName");

				// 入力不備
				if(lKanji == "" || fKanji == "" || lKana == "" || fKana == "" || (sex != 0 && sex !=1)) {
					throw new ClassNotFoundException();
				}

				SectionDAO sdao = new SectionDAO();
				String sectionCode = sdao.getSectionCode(sectionName);  // 部署名から部署コードを取得

				edao.changeEmployee(empCode, lKanji, fKanji, lKana, fKana, sex, sectionCode);  // 従業員情報を変更

				url = "/employeeDataChangeComplete.jsp";  // 完了画面

			} catch (SQLException | ClassNotFoundException e) {
				url = "/employeeDataChangeError.jsp";  // エラー画面
			}

		} else if("削除".equals(action)) {

			try {
				String empCode = request.getParameter("empCode");
				if(empCode == null) {  // 従業員の未選択
					throw new ClassNotFoundException();
				}

				edao.deleteEmployee(empCode);  // 従業員を削除

				url = "/deleteComplete.jsp";  // 完了画面

			} catch (SQLException | ClassNotFoundException e) {
				url = "/deleteError.jsp";  // エラー画面
			}

		} else if("従業員登録".equals(action)) {

			try {
				LicenseDAO ldao = new LicenseDAO();
				List<String> licenseList = ldao.getLicenseAll();  // 資格リストを取得
				session.setAttribute("licenseList", licenseList);  // 資格リストをセッションに保存

			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
			url = "/employeeDataRegister.jsp";  // 従業員登録画面

		} else if("登録".equals(action)) {

			try {
				String empCode = request.getParameter("empCode");
				String lKanji = request.getParameter("lKanji");
				String fKanji = request.getParameter("fKanji");
				String lKana = request.getParameter("lKana");
				String fKana = request.getParameter("fKana");
				byte sex = Byte.valueOf(request.getParameter("sex"));

				String birthY = request.getParameter("birthY");  // 年
				String birthM = request.getParameter("birthM");  // 月
				String birthD = request.getParameter("birthD");  // 日
				Date birthday = Date.valueOf(request.getParameter(birthY + birthM + birthD));  // 生年月日

				String sectionName = request.getParameter("sectionName");
				SectionDAO sdao = new SectionDAO();
				String sectionCode = sdao.getSectionCode(sectionName);  // 部署名から部署コードを取得

				String empY = request.getParameter("empY");  // 年
				String empM = request.getParameter("empM");  // 月
				String empD = request.getParameter("empD");  // 日
				Date empDate = Date.valueOf(request.getParameter(empY + empM + empD));  // 入社日

				// 入力不備
				if(empCode == "" || lKanji == "" || fKanji == "" || lKana == "" || fKana == ""
																		|| (sex != 0 && sex !=1)) {
					throw new ClassNotFoundException();
				}

				// 従業員を登録
				edao.addEmployee(empCode, lKanji, fKanji, lKana, fKana, sex, birthday, sectionCode, empDate);

				String licenseName = request.getParameter("licenseName");
				if("なし".equals(licenseName) == false) {  // 資格を保有している場合
					LicenseDAO ldao = new LicenseDAO();
					String licenseCode = ldao.getLicenseName(licenseName);  // 資格名から資格コードを取得
					GetLicenseDAO gldao = new GetLicenseDAO();
					gldao.addEmployeeLicense(empCode, licenseCode, null);  // 保有資格を登録
				}

				url = "/registerComplete.jsp";  // 完了画面

			} catch (SQLException e) {
				url = "/registerErrorDup.jsp";  // 重複登録のエラー画面
			} catch (ClassNotFoundException e) {
				url = "/registerError.jsp";  // 入力不備のエラー画面
			}

		} else if("資格取得".equals(action)) {

			try {
				// 従業員リストを取得してセッションに保存
				List<EmployeeBean> empList = edao.getEmployee(null, null);
				session.setAttribute("empList", empList);

				// 資格リストを取得してセッションに保存
				LicenseDAO ldao = new LicenseDAO();
				List<String> licenseList = ldao.getLicenseAll();
				session.setAttribute("licenseList", licenseList);

			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
			url = "/getLicense.jsp";  // 資格取得画面

		} else if("取得".equals(action)) {

			try {
				String empCode = request.getParameter("empCode");

				String licenseY = request.getParameter("licenseY");  // 年
				String licenseM = request.getParameter("licenseM");  // 月
				String licenseD = request.getParameter("licenseD");  // 日
				Date getDate = Date.valueOf(request.getParameter(licenseY + licenseM + licenseD));  // 資格取得日

				if(empCode == null) {  // 入力不備
					throw new ClassNotFoundException();
				}

				String licenseName = request.getParameter("licenseName");
				LicenseDAO ldao = new LicenseDAO();
				String licenseCode = ldao.getLicenseName(licenseName);  // 資格名から資格コードを取得

				GetLicenseDAO gldao = new GetLicenseDAO();
				gldao.addEmployeeLicense(empCode, licenseCode, getDate);  // 保有資格を登録

				url = "/getLicenseComplete.jsp";  // 完了画面

			} catch (SQLException e) {
				url = "/getLicenseErrorDup.jsp";  // 重複登録のエラー画面
			} catch (ClassNotFoundException e) {
				url = "/getLicenseError.jsp";  // 入力不備のエラー画面
			}

		}

		// リクエストの委譲
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

}