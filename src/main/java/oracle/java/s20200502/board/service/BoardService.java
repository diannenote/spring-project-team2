package oracle.java.s20200502.board.service;

import java.util.List;

import oracle.java.s20200502.board.model.Board;

public interface BoardService {

	List<Board> boardList(Board board);
	List<Board> noticeList(Board board);
	List<Board> studyBoardList(Board board);

}
