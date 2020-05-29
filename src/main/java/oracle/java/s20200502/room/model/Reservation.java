package oracle.java.s20200502.room.model;

import java.util.Date;

public class Reservation {
	private int re_num;
	private int ro_num;
	private int m_num;
	private Date re_rvDate;
	private int re_totalCost;
	private int re_morning;
	private int re_afternoon;
	private int re_night;
	private int re_endTime;
	
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
	public Date getRe_rvDate() {
		return re_rvDate;
	}
	public void setRe_rvDate(Date re_rvDate) {
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
	public int getRe_endTime() {
		return re_endTime;
	}
	public void setRe_endTime(int re_endTime) {
		this.re_endTime = re_endTime;
	}
}
