package oracle.java.s20200502.main.model;

public class RoomList {
	//룸 테이블 내 컬럼
	private int ro_num;
	private int m_num;
	private String ro_title;
	private String ro_content;
	private int ro_hit;
	private String ro_spot1;
	private String ro_spot2;
	private String ro_img;
	private int ro_mreservateion;
	private int ro_aftreservation;
	private int ro_nitreservation;
	private String ro_loc;
	
	//조회용
	private String search;		private String keyword;
	private String pageNum;
	private int start1;			private int end1;
	private int start2;			private int end2;
	
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	
	public int getStart1() {
		return start1;
	}
	public void setStart1(int start1) {
		this.start1 = start1;
	}
	public int getEnd1() {
		return end1;
	}
	public void setEnd1(int end1) {
		this.end1 = end1;
	}
	public int getStart2() {
		return start2;
	}
	public void setStart2(int start2) {
		this.start2 = start2;
	}
	public int getEnd2() {
		return end2;
	}
	public void setEnd2(int end2) {
		this.end2 = end2;
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
	public int getRo_hit() {
		return ro_hit;
	}
	public void setRo_hit(int ro_hit) {
		this.ro_hit = ro_hit;
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
	public int getRo_mreservateion() {
		return ro_mreservateion;
	}
	public void setRo_mreservateion(int ro_mreservateion) {
		this.ro_mreservateion = ro_mreservateion;
	}
	public int getRo_aftreservation() {
		return ro_aftreservation;
	}
	public void setRo_aftreservation(int ro_aftreservation) {
		this.ro_aftreservation = ro_aftreservation;
	}
	public int getRo_nitreservation() {
		return ro_nitreservation;
	}
	public void setRo_nitreservation(int ro_nitreservation) {
		this.ro_nitreservation = ro_nitreservation;
	}
	public String getRo_loc() {
		return ro_loc;
	}
	public void setRo_loc(String ro_loc) {
		this.ro_loc = ro_loc;
	}

}
