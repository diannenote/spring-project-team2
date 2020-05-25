package oracle.java.s20200502.board.dao;

import java.util.List;

import oracle.java.s20200502.board.model.Board;

public interface BoardDao {

	List<Board> boardList();
	List<Board> noticeList();
	
}
