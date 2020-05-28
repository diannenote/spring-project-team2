package oracle.java.s20200502.board.dao;

import java.util.List;

import oracle.java.s20200502.board.model.Board;
import oracle.java.s20200502.board.model.Paging;


public interface BoardDao {

	int boardtotal();
	int noticetotal();
	
	List<Board> boardList(Paging paging);
	List<Board> noticeList(Paging paging);
	
	Board boardContent(int b_num);
	int boardInsert(Board board);
	int boardDelete(int b_num);
	int boardUpdate(Board board);
	int boardHitUp(int b_num);
	int plusLike(int b_num);
	int minusLike(int b_num);
	int selectLikeCnt(int b_num);
}
