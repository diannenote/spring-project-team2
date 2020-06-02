package oracle.java.s20200502.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200502.board.model.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<Reply> replyList(Reply reply) {
		return session.selectList("replyList", reply);
	}
	
}
