package oracle.java.s20200502.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.java.s20200502.board.model.Board;
import oracle.java.s20200502.board.model.Paging;
import oracle.java.s20200502.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("boardList")
	public String boardList(Paging paging, Model model) {
		System.out.println("boardList Controller start");
		
		int boardtotal = boardService.boardtotal();
		paging.setTotal(boardtotal);
		
		System.out.println("BoardController list boardtotal->"+boardtotal);
		System.out.println("BoardController list currentPage->" + paging.getCurrentPage());
		
		List<Board> boardList = boardService.boardList(paging);
		model.addAttribute("boardList", boardList);
		model.addAttribute("paging", paging);
		
		return "board/boardList";
	}
	
	@RequestMapping("noticeList")
	public String noticeBoard(Paging paging, Model model) {
		System.out.println("noticeBoard Controller start");
		
		int noticetotal = boardService.noticetotal();
		paging.setTotal(noticetotal);
		
		List<Board> noticeList = boardService.noticeList(paging);
		model.addAttribute("boardList", noticeList);
		model.addAttribute("paging", paging);
		
		return "board/boardList";
	}
	
	@RequestMapping("boardContent")
	public String boardContent(int b_num, Paging paging, Model model) {
		
		Board board = boardService.boardContent(b_num);
		System.out.println("currentPage->"+ paging.getCurrentPage());
		
		model.addAttribute("board",board);
		model.addAttribute("paging",paging);
		
		return "board/boardContent";
		
	}
	
	@RequestMapping("boardWriteForm")
	public String boardWriteForm (Paging paging, Model model) {
		System.out.println(paging.getCurrentPage());
		model.addAttribute("paging",paging);
		
		return "board/boardWriteForm";
	}
	
	@RequestMapping(value="boardWrite", method=RequestMethod.POST)
	public String boardWrite(Board board, Paging paging, Model model) {
		System.out.println("boardWrite controller start..");
		System.out.println("boardWrite controller b_num ->" + board.getB_num());
		
		model.addAttribute("paging", paging);
		int result = boardService.boardInsert(board);
		if(result > 0) {
			return "redirect:board/boardList";
		} else {
			model.addAttribute("msg", "입력실패");
			return "forward:board/boardWriteForm";
		}
	}
	
}
