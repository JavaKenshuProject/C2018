/**
 * employeeManagement
 * EmployeeBean.java
 *
 * Cteam
 */
package model.entity;

import java.sql.Date;

/**
 * 従業員情報クラス
 *
 * @author Torigoe
 * @version 1.00
 *
 */

public class EmployeeBean {

	private String empCode;  //従業員コード
	private String lKanji;  //氏
	private String fKangji;  //名
	private String lKana;  //氏（フリガナ）
	private String fKana;  //名（フリガナ）
	private byte sex;  //性別
	private Date birthday;  //生年月日
	private String sectionName;  //所属部署名
	private Date empDate;  //入社日
	private String licenseName;  //保有資格

	public String getEmpCode() {
		return empCode;
	}
	public String getlKanji() {
		return lKanji;
	}
	public String getfKangji() {
		return fKangji;
	}
	public String getlKana() {
		return lKana;
	}
	public String getfKana() {
		return fKana;
	}
	public byte getSex() {
		return sex;
	}
	public java.sql.Date getBirthday() {
		return birthday;
	}
	public String getSectionName() {
		return sectionName;
	}
	public java.sql.Date getEmpDate() {
		return empDate;
	}
	public String getLicenseName() {
		return licenseName;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	public void setlKanji(String lKanji) {
		this.lKanji = lKanji;
	}
	public void setfKangji(String fKangji) {
		this.fKangji = fKangji;
	}
	public void setlKana(String lKana) {
		this.lKana = lKana;
	}
	public void setfKana(String fKana) {
		this.fKana = fKana;
	}
	public void setSex(byte sex) {
		this.sex = sex;
	}
	public void setBirthday(java.sql.Date birthday) {
		this.birthday = birthday;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public void setEmpDate(java.sql.Date empDate) {
		this.empDate = empDate;
	}
	public void setLicenseName(String licenseName) {
		this.licenseName = licenseName;
	}


}
