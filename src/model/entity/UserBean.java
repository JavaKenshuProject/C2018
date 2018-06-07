/**
 * employeeManagement
 * EmployeeBean.java
 *
 * Cteam
 */
package model.entity;

/**
 * ユーザ情報クラス
 *
 * @author Torigoe
 * @version 1.00
 *
 */

public class UserBean {

	private String userId;  //　ユーザID
	private String password;  //　パスワード
	private String sectionName; //　所属部署名

	public String getUserId() {
		return userId;
	}
	public String getPassword() {
		return password;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

}
