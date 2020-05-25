package oracle.java.s20200502.board.dao;

import java.util.List;

import oracle.java.s20200502.board.model.Board;


public interface BoardDao {

	int boardtotal();
	int noticetotal();
	
	List<Board> boardList(Board board);
	List<Board> noticeList(Board board);
	
}
