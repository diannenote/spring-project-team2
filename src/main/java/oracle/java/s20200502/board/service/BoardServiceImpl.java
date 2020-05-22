package oracle.java.s20200502.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200502.board.dao.BoardDao;
import oracle.java.s20200502.board.model.Board;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;

	@Override
	public List<Board> boardList(Board board) {
		System.out.println("BoardServiceImpl boardList start");
		return boardDao.boardList(board);
		
	}

	@Override
	public List<Board> noticeList(Board board) {
		System.out.println("BoardServiceImpl noticeBoard start");
		return boardDao.noticeList(board);
	}

	@Override
	public List<Board> studyBoardList(Board board) {
		System.out.println("BoardServiceImpl studyBoardList start");
		return boardDao.studyBoardList(board);
	}
	

}
