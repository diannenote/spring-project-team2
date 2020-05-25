package oracle.java.s20200502.board.service;

import java.util.List;

import oracle.java.s20200502.board.model.Board;
import oracle.java.s20200502.board.model.Paging;

public interface BoardService {

	List<Board> boardList(Paging paging);
	List<Board> noticeList(Paging paging);
	
	int boardtotal();
	int noticetotal();
	
	

}
