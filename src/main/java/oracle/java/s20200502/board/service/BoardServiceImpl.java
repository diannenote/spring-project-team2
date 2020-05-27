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
	public int boardtotal() {
		return boardDao.boardtotal();
	}

	@Override
	public int noticetotal() {
		return boardDao.noticetotal();
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
		System.out.println("BoardServiceImpl delete start...");
		return boardDao.boardDelete(b_num);
		
	}

}
