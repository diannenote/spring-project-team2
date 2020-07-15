package oracle.java.s20200502.room.model;

public class Payment {
	private String u_id;
	private String t_id;
	private int amount;
	private String app_num;
	private int m_num;
	
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getT_id() {
		return t_id;
	}
	public void setT_id(String t_id) {
		this.t_id = t_id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getApp_num() {
		return app_num;
	}
	public void setApp_num(String app_num) {
		this.app_num = app_num;
	}
	
	
}
