package oracle.java.s20200502.main.model;

public class SearchRoomList extends RoomList {
	
	private String searchType = "";
	private String keyword = "";
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
	
	@Override
	public String toString(){
		return super.toString() + " SearchRoomList [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}
