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

	@Override
	public void replyWrite(Reply reply) {
		session.insert("replyWrite", reply);
	}

	@Override
	public Reply replyContent(Reply reply) {
		return session.selectOne("replyContent", reply);
	}

	@Override
	public void replyUpdate(Reply reply) {
		session.update("replyUpdate", reply);
	}

	@Override
	public void replyDelete(Reply reply) {
		session.update("replyDelete", reply);
	}

	@Override
	public void reReplyWrite(Reply reply) {
		session.insert("reReplyWrite", reply);
	}

	@Override
	public void plusReplyCnt(Reply reply) {
		session.update("plusReplyCnt", reply);
	}

	@Override
	public void minusReplyCnt(Reply reply) {
		session.update("minusReplyCnt", reply);
	}
	
}
