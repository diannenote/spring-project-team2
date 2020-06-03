package oracle.java.s20200502.board.dao;

import java.util.List;

import oracle.java.s20200502.board.model.Reply;

public interface ReplyDao {

	List<Reply> replyList(Reply reply);
	void replyWrite(Reply reply);
	Reply replyContent(Reply reply);
	void replyUpdate(Reply reply);
	void replyDelete(Reply reply);
	void reReplyWrite(Reply reply);

}
