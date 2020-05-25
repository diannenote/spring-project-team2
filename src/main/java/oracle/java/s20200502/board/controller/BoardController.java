package oracle.java.s20200502.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.java.s20200502.board.model.Board;
import oracle.java.s20200502.board.service.BoardService;
import oracle.java.s20200502.board.service.Paging;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("boardList")
	public String boardList(Board board, Model model, String currentPage) {
		System.out.println("boardList Controller start");
		
		int boardtotal = boardService.boardtotal();
		Paging paging = new Paging(boardtotal, currentPage);
		board.setStart(paging.getStart());
		board.setEnd(paging.getEnd());
		
		System.out.println("EmpController list boardtotal->"+boardtotal);
		System.out.println("EmpController list currentPage->"+currentPage);
		
		List<Board> boardList = boardService.boardList(board);
		model.addAttribute("boardList", boardList);
		model.addAttribute("paging", paging);
		
		
		return "board/boardList";
	}
	
	@RequestMapping("noticeList")
	public String noticeBoard (Board board, String currentPage, Model model) {
		System.out.println("noticeBoard Controller start");
		
		int noticetotal = boardService.noticetotal();
		Paging paging = new Paging(noticetotal, currentPage);
		
		board.setStart(paging.getStart());
		board.setEnd(paging.getEnd());
		
		System.out.println("EmpController list noticetotal->"+noticetotal);
		System.out.println("EmpController list currentPage->"+currentPage);
		
		List<Board> noticeList = boardService.noticeList(board);
		model.addAttribute("boardList", noticeList);
		model.addAttribute("paging", paging);
		
		return "board/boardList";
	}
	
}
