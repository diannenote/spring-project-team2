package oracle.java.s20200502.room.model;

import java.util.Date;

public class Reservation {
	private int re_num;
	private int ro_num;
	private int m_num;
	private String re_rvDate;
	private int re_totalCost;
	private int re_morning;
	private int re_afternoon;
	private int re_night;
	private Date re_date;
	private String ro_title;
	private String re_when;
	private String m_nickname;
	private String ro_img;
	
	public String getRo_img() {
		return ro_img;
	}
	public void setRo_img(String ro_img) {
		this.ro_img = ro_img;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getRe_when() {
		return re_when;
	}
	public void setRe_when(String re_when) {
		this.re_when = re_when;
	}
	public String getRo_title() {
		return ro_title;
	}
	public void setRo_title(String ro_title) {
		this.ro_title = ro_title;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getRo_num() {
		return ro_num;
	}
	public void setRo_num(int ro_num) {
		this.ro_num = ro_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getRe_rvDate() {
		return re_rvDate;
	}
	public void setRe_rvDate(String re_rvDate) {
		this.re_rvDate = re_rvDate;
	}
	public int getRe_totalCost() {
		return re_totalCost;
	}
	public void setRe_totalCost(int re_totalCost) {
		this.re_totalCost = re_totalCost;
	}
	public int getRe_morning() {
		return re_morning;
	}
	public void setRe_morning(int re_morning) {
		this.re_morning = re_morning;
	}
	public int getRe_afternoon() {
		return re_afternoon;
	}
	public void setRe_afternoon(int re_afternoon) {
		this.re_afternoon = re_afternoon;
	}
	public int getRe_night() {
		return re_night;
	}
	public void setRe_night(int re_night) {
		this.re_night = re_night;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	
}
