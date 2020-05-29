package oracle.java.s20200502.main.model;

import java.sql.Date;

public class Member {
	private int m_num;	private String m_email;
	private String m_password;
	private String m_nickname; private String m_phone;
	private int m_ban; private Date m_regdate;
	private String m_biznum; private String m_bizname;
	private int m_type;
	//회원가입 결과값을 가져오기위함
	private int m_newMemberResult;
	
	public int getM_num() {return m_num;}
	public void setM_num(int m_num) {this.m_num = m_num;}
	public String getM_email() {return m_email;}
	public void setM_email(String m_email) {this.m_email = m_email;}
	public String getM_nickname() {	return m_nickname;}
	public void setM_nickname(String m_nickname) {this.m_nickname = m_nickname;}
	public String getM_phone() {return m_phone;}
	public void setM_phone(String m_phone) {this.m_phone = m_phone;}
	public int getM_ban() {	return m_ban;}
	public void setM_ban(int m_ban) {this.m_ban = m_ban;}
	public Date getM_regdate() {return m_regdate;}
	public void setM_regdate(Date m_regdate) {this.m_regdate = m_regdate;}
	public String getM_biznum() {return m_biznum;}
	public void setM_biznum(String m_biznum) {this.m_biznum = m_biznum;}
	public String getM_bizname() {return m_bizname;}
	public void setM_bizname(String m_bizname) {this.m_bizname = m_bizname;}
	public int getM_type() {return m_type;}
	public void setM_type(int m_type) {this.m_type = m_type;}
	public String getM_password() {return m_password;}
	public void setM_password(String m_password) {this.m_password = m_password;}
	public int getM_newMemberResult() {return m_newMemberResult;}
	public void setM_newMemberResult(int m_newMemberResult) {this.m_newMemberResult = m_newMemberResult;}
	
	
}
