package oracle.java.s20200502.main.service;
public class SearchPaging extends Paging {
	public SearchPaging(int total, String currentPage1) {
		super(total, currentPage1);
		// TODO Auto-generated constructor stub
	}
	private int perPageNum;
	private String searchType;
	private String keyword;
	
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}