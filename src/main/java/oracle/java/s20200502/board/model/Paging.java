package oracle.java.s20200502.board.model;
public class Paging {
	private int currentPage;	
	private int start, end;
	private int startPage, endPage;
	private int total, totalPage;
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_BLOCK   = 3;
	private boolean before;
	private boolean next;
	
	
	public boolean isBefore() {
		if(this.getStartPage() > PAGE_BLOCK) return true;
		return false;
	}

	public void setBefore(boolean before) {
		this.before = before;
	}

	public boolean isNext() {
		if(this.getEndPage() < this.totalPage) return true;
		return false;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Paging() {
	}
	
	public int getCurrentPage() {
		if (currentPage != 0) {
			return currentPage;
		}
		return 1;
		
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStart() {
		if(this.getCurrentPage() == 1) {
			return 0;
		}
		this.start = (this.currentPage - 1) * PAGE_SIZE + 1;
		return this.start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		if (this.getStart() == 0) {
			this.end = PAGE_SIZE;
		}
		else {
			this.end = start + PAGE_SIZE - 1;
		}
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getStartPage() {
		this.startPage = this.currentPage - (this.currentPage - 1) % PAGE_BLOCK;
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		int endPage = this.getStartPage() + PAGE_BLOCK - 1;
		if (endPage > getTotalPage()) {
			return this.getTotalPage();
		}		
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getTotalPage() {
		this.totalPage = (int) Math.ceil((double)this.total / PAGE_SIZE);
		return totalPage;
	}
	
}