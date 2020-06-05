package oracle.java.s20200502.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200502.board.dao.BoardDao;
import oracle.java.s20200502.board.model.Board;
import oracle.java.s20200502.board.model.Paging;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;

	@Override
	public List<Board> boardList(Paging paging) {
		return boardDao.boardList(paging);
	}

	@Override
	public List<Board> noticeList(Paging paging) {
		return boardDao.noticeList(paging);
	}

	@Override
	public int boardtotal(Paging paging) {
		return boardDao.boardtotal(paging);
	}

	@Override
	public int noticetotal(Paging paging) {
		return boardDao.noticetotal(paging);
	}

	@Override
	public Board boardContent(int b_num) {
		return boardDao.boardContent(b_num);
	}

	@Override
	public int boardInsert(Board board) {
		return boardDao.boardInsert(board);
	}

	@Override
	public int boardDelete(int b_num) {
		return boardDao.boardDelete(b_num);
		
	}

	@Override
	public int boardUpdate(Board board) {
		return boardDao.boardUpdate(board);
	}

	@Override
	public int boardHitUp(int b_num) {
		return boardDao.boardHitUp(b_num);
	}

	@Override
	public int plusLike(int b_num) {
		return boardDao.plusLike(b_num);
	}

	@Override
	public int minusLike(int b_num) {
		return boardDao.minusLike(b_num);
	}

	@Override
	public int selectLikeCnt(int b_num) {
		return boardDao.selectLikeCnt(b_num);
	}


}
