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
		System.out.println("BoardServiceImpl boardList start");
		return boardDao.boardList(paging);
	}

	@Override
	public List<Board> noticeList(Paging paging) {
		System.out.println("BoardServiceImpl noticeBoard start");
		return boardDao.noticeList(paging);
	}

	@Override
	public int boardtotal() {
		System.out.println("BoardServiceImpl boardtotal start");
		return boardDao.boardtotal();
	}

	@Override
	public int noticetotal() {
		System.out.println("BoardServiceImpl noticetotal start");
		return boardDao.noticetotal();
	}

	@Override
	public Board boardContent(int b_num) {
		System.out.println("BoardServiceImpl boardContent start");
		return boardDao.boardContent(b_num);
	}

	@Override
	public int boardInsert(Board board) {
		System.out.println("BoardServiceImpl boardInsert start");
		return boardDao.boardInsert(board);
	}

}
