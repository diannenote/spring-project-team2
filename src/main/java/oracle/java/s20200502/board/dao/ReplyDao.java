package oracle.java.s20200502.board.dao;

import java.util.List;

import oracle.java.s20200502.board.model.Reply;

public interface ReplyDao {

	List<Reply> replyList(Reply reply);

}
