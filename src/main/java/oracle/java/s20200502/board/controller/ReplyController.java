package oracle.java.s20200502.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import oracle.java.s20200502.board.model.Reply;
import oracle.java.s20200502.board.service.ReplyService;

@RestController
@RequestMapping("reply")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("replyList")
	public List<Reply> replyList (Reply reply) {
		
		List<Reply> replyList = replyService.replyList(reply);
		return replyList;
	}
	
	@RequestMapping("replyWrite")
	public void replyWrite (Reply reply) {
		
		replyService.replyWrite(reply);
	}
	
	@RequestMapping("replyContent")
	public Reply replyContent (Reply reply) {
		
		return replyService.replyContent(reply);
	}
	
	@RequestMapping("replyUpdate")
	public void replyUpdate (Reply reply) {
		
		replyService.replyUpdate(reply);
	}
	
	@RequestMapping("replyDelete")
	public void replyDelete (Reply reply) {
		
		replyService.replyDelete(reply);
		
	}
	
}
