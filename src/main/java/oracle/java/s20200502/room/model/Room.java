package oracle.java.s20200502.room.model;

public class Room {
	private int ro_num;
	private int m_num;
	private String ro_title;
	private String ro_content;
	private int ro_hit;
	private String ro_spot1;
	private String ro_spot2;
	private String ro_img;
	private int ro_mReservation;
	private int ro_aftReservation;
	private int ro_nitReservation;	
	private String pageNum;
	private String ro_loc;
	private int start; 		     private int end;
	
	public String getRo_loc() {
		return ro_loc;
	}
	public void setRo_loc(String ro_loc) {
		this.ro_loc = ro_loc;
	}
	
	public int getRo_hit() {
		return ro_hit;
	}
	public void setRo_hit(int ro_hit) {
		this.ro_hit = ro_hit;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
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
	public String getRo_title() {
		return ro_title;
	}
	public void setRo_title(String ro_title) {
		this.ro_title = ro_title;
	}
	public String getRo_content() {
		return ro_content;
	}
	public void setRo_content(String ro_content) {
		this.ro_content = ro_content;
	}
	public String getRo_spot1() {
		return ro_spot1;
	}
	public void setRo_spot1(String ro_spot1) {
		this.ro_spot1 = ro_spot1;
	}
	public String getRo_spot2() {
		return ro_spot2;
	}
	public void setRo_spot2(String ro_spot2) {
		this.ro_spot2 = ro_spot2;
	}
	public String getRo_img() {
		return ro_img;
	}
	public void setRo_img(String ro_img) {
		this.ro_img = ro_img;
	}
	public int getRo_mReservation() {
		return ro_mReservation;
	}
	public void setRo_mReservation(int ro_mReservation) {
		this.ro_mReservation = ro_mReservation;
	}
	public int getRo_aftReservation() {
		return ro_aftReservation;
	}
	public void setRo_aftReservation(int ro_aftReservation) {
		this.ro_aftReservation = ro_aftReservation;
	}
	public int getRo_nitReservation() {
		return ro_nitReservation;
	}
	public void setRo_nitReservation(int ro_nitReservation) {
		this.ro_nitReservation = ro_nitReservation;
	}
}
