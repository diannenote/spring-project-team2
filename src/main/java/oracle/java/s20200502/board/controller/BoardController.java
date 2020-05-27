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
		
		int boardtotal = boardService.boardtotal();
		paging.setTotal(boardtotal);
		List<Board> boardList = boardService.boardList(paging);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("paging", paging);
		
		return "board/boardList";
	}
	
	@RequestMapping("noticeList")
	public String noticeBoard(Paging paging, Model model) {
		
		int noticetotal = boardService.noticetotal();
		paging.setTotal(noticetotal);
		List<Board> noticeList = boardService.noticeList(paging);
		
		model.addAttribute("boardList", noticeList);
		model.addAttribute("paging", paging);

		return "board/boardList";
	}
	
	@RequestMapping("boardContent")
	public String boardContent(Board board, Paging paging, Model model) {
		
		board = boardService.boardContent(board.getB_num());
		boardService.boardHitUp(board.getB_num());
		System.out.println("currentPage->"+ paging.getCurrentPage());
		
		model.addAttribute("paging",paging);
		model.addAttribute("board", board);
		
		return "board/boardContent";
		
	}
	
	@RequestMapping("boardWriteForm")
	public String boardWriteForm (Model model, Board board) {
		
		System.out.println("b_type->" + board.getB_type());
		model.addAttribute("board", board);
		
		return "board/boardWriteForm";
	}
	
	@RequestMapping(value="boardWrite", method=RequestMethod.POST)
	public String boardWrite(Board board, Paging paging, Model model) {
		
		System.out.println("boardWrite controller b_type ->" + board.getB_type());
		
		model.addAttribute("paging", paging);
		int result = boardService.boardInsert(board);
		if(result > 0) {
			return "redirect:boardList";
		} else {
			model.addAttribute("msg", "입력실패");
			return "forward:boardWriteForm";
		}
	}
	
	@RequestMapping("boardDelete")
	public String boardDelete(Board board, Paging paging, Model model) {
		
		System.out.println("b_num->" + board.getB_num());
		System.out.println("b_type->" + board.getB_type());
		
		boardService.boardDelete(board.getB_num());
		model.addAttribute("paging",paging);
		model.addAttribute("board",board);
		
		if(board.getB_type() == 0) {
			return "redirect:noticeList";
		}
		return "redirect:boardList";
	}
	
	@RequestMapping("boardUpdateForm")
	public String boardUpdateForm(Board board, Paging paging, Model model) {
		
		System.out.println("b_type->" + board.getB_type());
		board = boardService.boardContent(board.getB_num());
		model.addAttribute("board",board);
		model.addAttribute("paging",paging);
		
		return "board/boardUpdateForm";
		
	}
	
	@RequestMapping("boardUpdate")
	public String boardUpdate(Board board, Paging paging, Model model) {
		
		System.out.println("b_num->" + board.getB_num());
		int update = boardService.boardUpdate(board);
		model.addAttribute("paging",paging);
		model.addAttribute("board",board);
		
		return "forward:boardContent";
		
	}
	
}




