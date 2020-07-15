package oracle.java.s20200502.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200502.board.dao.ReplyDao;
import oracle.java.s20200502.board.model.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDao replyDao;

	@Override
	public List<Reply> replyList(Reply reply) {
		return replyDao.replyList(reply);
	}

	@Override
	public void replyWrite(Reply reply) {
		if(reply.getBr_num() != 0 ) reply.setBr_indent(50);
		replyDao.replyWrite(reply);
	}

	@Override
	public Reply replyContent(Reply reply) {
		return replyDao.replyContent(reply);
	}

	@Override
	public void replyUpdate(Reply reply) {
		replyDao.replyUpdate(reply);
	}

	@Override
	public void replyDelete(Reply reply) {
		replyDao.replyDelete(reply);
	}

	@Override
	public void plusReplyCnt(Reply reply) {
		replyDao.plusReplyCnt(reply);
	}

	@Override
	public void minusReplyCnt(Reply reply) {
		replyDao.minusReplyCnt(reply);
		
	}
	

}
