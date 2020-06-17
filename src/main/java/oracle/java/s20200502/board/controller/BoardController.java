package oracle.java.s20200502.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.helper.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
import oracle.java.s20200502.main.service.MemberService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private LikeService likeService;
	@Autowired
	private MemberService memberService;
	
	//스터디 게시판
	@RequestMapping("boardList")
	public String boardList(Paging paging, Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("memberInfo"); 
		if(member != null) {
			int m_type = member.getM_type();
			System.out.println("m_type->>>" + m_type);
			model.addAttribute("m_type", m_type);
		}
		int boardtotal = boardService.boardtotal(paging);
		paging.setTotal(boardtotal);
		List<Board> boardList = boardService.boardList(paging);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("paging", paging);
		model.addAttribute("total", boardtotal);
		
		return "board/boardList";
	}
	
	//공지사항 게시판
	@RequestMapping("noticeList")
	public String noticeBoard(Paging paging, Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("memberInfo"); 
		if(member != null) {
			int m_type = member.getM_type();
			System.out.println("m_type->>>" + m_type);
			model.addAttribute("m_type", m_type);
		}
		int noticetotal = boardService.noticetotal(paging);
		paging.setTotal(noticetotal);
		List<Board> noticeList = boardService.noticeList(paging);
		
		model.addAttribute("boardList", noticeList);
		model.addAttribute("paging", paging);
		model.addAttribute("total",noticetotal);

		return "board/boardList";
	}
	
	//게시글 내용
	@RequestMapping("boardContent")
	public String boardContent(Board board, Paging paging, Model model,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		Member member = (Member) session.getAttribute("memberInfo");
		if (member != null) {
			int count = likeService.likeCount(board.getB_num(), member.getM_num());
			int m_num = member.getM_num();
			boolean isCookie = false;
			Cookie[] cookies = request.getCookies();
			if(cookies != null){   
				System.out.println("쿠키있음");
				for(int i =0; i < cookies.length; i++){  
					if(cookies[i].getName().equals("cookie"+board.getB_num()+member.getM_num())){
				    	isCookie = true; 
					}
				}
			}
			if(!isCookie) {
				System.out.println("쿠키없음");
				boardService.boardHitUp(board.getB_num());//조회수증가
				Cookie addCookie = new Cookie("cookie" + board.getB_num()+member.getM_num(), String.valueOf(board.getB_num()));
				addCookie.setMaxAge(1*24*60*60);//하루저장
				response.addCookie(addCookie);    
			}
				  
			model.addAttribute("m_num",m_num);
			model.addAttribute("likeCnt", count);
		}
		if(member == null && board.getB_type() == 1) {
			return "redirect:/loginForm";
		} 
		
		board = boardService.boardContent(board.getB_num());
		
		model.addAttribute("paging", paging);
		model.addAttribute("board", board);
		
		return "board/boardContent";
		
	}
	//글등록 폼
	@RequestMapping("boardWriteForm")
	public String boardWriteForm (Model model, Board board, HttpSession session) {
		
		Member member = (Member) session.getAttribute("memberInfo");
		if(member == null) {
			return "redirect:/loginForm";
		}
		board.setM_num(member.getM_num());
		model.addAttribute("board", board);
		
		return "board/boardWriteForm";
	}
	
	//글등록 
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
	
	//게시글 삭제
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
	
	//게시글 수정 폼
	@RequestMapping("boardUpdateForm")
	public String boardUpdateForm(Board board, Paging paging, Model model) {
		
		board = boardService.boardContent(board.getB_num());
		model.addAttribute("board",board);
		model.addAttribute("paging",paging);
		
		return "board/boardUpdateForm";
		
	}
	
	
	//게시글 수정
	@RequestMapping("boardUpdate")
	public String boardUpdate(Board board, Paging paging, Model model) {
		
		boardService.boardUpdate(board);
		model.addAttribute("paging",paging);
		model.addAttribute("board",board);
		
		return "forward:boardContent";
		
	}
	
	//좋아요 기능
	@RequestMapping(value="boardLike", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> boardLike (@RequestParam int b_num, HttpSession session) {
		
		Member member = (Member) session.getAttribute("memberInfo");
		
		Map<String, Object> result = new HashMap<String, Object>();
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




