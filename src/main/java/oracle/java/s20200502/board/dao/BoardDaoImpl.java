package oracle.java.s20200502.board.dao;

import java.util.List;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200502.board.model.Board;
import oracle.java.s20200502.board.model.Paging;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Board> boardList(Paging paging) {
		System.out.println("BoardDaoImpl boardList start");
		return session.selectList("boardList", paging);
	}

	@Override
	public List<Board> noticeList(Paging paging) {
		System.out.println("BoardDaoImpl noticeList start");
		return session.selectList("noticeList", paging);
	}

	@Override
	public int boardtotal() {
		System.out.println("BoardDaoImpl boardtotal start");
		return session.selectOne("boardtotal");
	}

	@Override
	public int noticetotal() {
		System.out.println("BoardDaoImpl noticetotal start");
		return session.selectOne("noticetotal");
	}

}
