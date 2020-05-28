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
		return session.selectList("boardList", paging);
	}

	@Override
	public List<Board> noticeList(Paging paging) {
		return session.selectList("noticeList", paging);
	}

	@Override
	public int boardtotal() {
		return session.selectOne("boardtotal");
	}

	@Override
	public int noticetotal() {
		return session.selectOne("noticetotal");
	}

	@Override
	public Board boardContent(int b_num) {
		return session.selectOne("boardContent",b_num);
	}

	@Override
	public int boardInsert(Board board) {
		return session.insert("boardInsert", board);
	}

	@Override
	public int boardDelete(int b_num) {
		return session.delete("boardDelete",b_num);
	}

	@Override
	public int boardUpdate(Board board) {
		return session.update("boardUpdate", board);
	}

	@Override
	public int boardHitUp(int b_num) {
		return session.update("boardHitUp", b_num);
	}

	@Override
	public int plusLike(int b_num) {
		return session.update("plusLike", b_num);
	}

	@Override
	public int minusLike(int b_num) {
		return session.update("minusLike", b_num);
	}

}
