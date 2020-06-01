package oracle.java.s20200502.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.java.s20200502.board.model.Board;
import oracle.java.s20200502.board.model.Paging;
import oracle.java.s20200502.board.service.BoardService;
import oracle.java.s20200502.board.service.LikeService;
import oracle.java.s20200502.main.model.Member;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private LikeService likeService;
	
	@RequestMapping("boardList")
	public String boardList(Paging paging, Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("memberInfo"); 
		if(member != null) {
			int m_type = member.getM_type();
			System.out.println("m_type->>>" + m_type);
			model.addAttribute("m_type", m_type);
		}
		int boardtotal = boardService.boardtotal();
		paging.setTotal(boardtotal);
		List<Board> boardList = boardService.boardList(paging);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("paging", paging);
		
		
		
		return "board/boardList";
	}
	
	@RequestMapping("noticeList")
	public String noticeBoard(Paging paging, Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("memberInfo"); 
		if(member != null) {
			int m_type = member.getM_type();
			System.out.println("m_type->>>" + m_type);
			model.addAttribute("m_type", m_type);
		}
		
		int noticetotal = boardService.noticetotal();
		paging.setTotal(noticetotal);
		List<Board> noticeList = boardService.noticeList(paging);
		
		model.addAttribute("boardList", noticeList);
		model.addAttribute("paging", paging);

		return "board/boardList";
	}
	
	@RequestMapping("boardContent")
	public String boardContent(Board board, Paging paging, Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("memberInfo");
		if (member != null) {
			int count = likeService.likeCount(board.getB_num(), member.getM_num());
			int m_num = member.getM_num();
			model.addAttribute("m_num",m_num);
			model.addAttribute("likeCnt", count);
		}
		if(member == null && board.getB_type() == 1) {
			return "main/loginForm";
		} 
		
		board = boardService.boardContent(board.getB_num());
		boardService.boardHitUp(board.getB_num());
		
		model.addAttribute("paging", paging);
		model.addAttribute("board", board);
		
		return "board/boardContent";
		
	}
	
	@RequestMapping("boardWriteForm")
	public String boardWriteForm (Model model, Board board, HttpSession session) {
		
		Member member = (Member) session.getAttribute("memberInfo");
		if(member == null) {
			return "main/loginForm";
		}
		board.setM_num(member.getM_num());
		model.addAttribute("board", board);
		
		return "board/boardWriteForm";
	}
	
	@RequestMapping(value="boardWrite", method=RequestMethod.POST)
	public String boardWrite(Board board, Paging paging, Model model) {
		
		model.addAttribute("paging", paging);
		model.addAttribute("board", board);
		int result = boardService.boardInsert(board);
		if(result > 0 && board.getB_type() == 0) {
			return "redirect:noticeList";
		} else {
			return "redirect:boardList";
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
	
	@RequestMapping(value="boardLike", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> boardLike (@RequestParam int b_num, HttpSession session) {
		
		Member member = (Member) session.getAttribute("memberInfo");
		
		Map<String, Object> result = new HashMap<>();
		boolean isLike;
		int count = likeService.likeCount(b_num, member.getM_num());
		System.out.println(count);
		
		if (count == 0) {
			boardService.plusLike(b_num);
			likeService.insertLike(b_num, member.getM_num());
			isLike = true;
		} else {
			boardService.minusLike(b_num);
			likeService.deleteLike(b_num, member.getM_num());
			isLike = false;
		}
		int likeCnt = boardService.selectLikeCnt(b_num);
		result.put("isLike", isLike);
		result.put("likeCnt", likeCnt);
		
		return result;
	}
	
}




