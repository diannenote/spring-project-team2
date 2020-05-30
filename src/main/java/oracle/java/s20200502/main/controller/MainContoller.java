package oracle.java.s20200502.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.java.s20200502.main.model.Member;
import oracle.java.s20200502.main.model.RoomList;
import oracle.java.s20200502.main.service.MemberService;
import oracle.java.s20200502.main.service.Paging;
import oracle.java.s20200502.main.service.RoomListService;

@Controller
public class MainContoller {
	private static final Logger logger = LoggerFactory.getLogger(MainContoller.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private RoomListService rls;
	
	@RequestMapping("main")
	public String main(Model model) {
		System.out.println("Open Main");
		return "main/main";
	}
	// 게시물 목록(with dubin)
	@RequestMapping(value = "list")
	public String getList(Model model, RoomList roomList, String currentPage) {
		System.out.println("Controller list start.. ");
		
		int total = rls.total();
		Paging pg = new Paging(total, currentPage);
		roomList.setStart(pg.getStart());
		roomList.setEnd(pg.getEnd());
		System.out.println("체크1");
		
		List<RoomList> listRoom = rls.listRoom(roomList);
		model.addAttribute("listRoom", listRoom);
		System.out.println("체크2");
		return "main/list";
	}
	
	//로그인폼
	@RequestMapping(value="loginForm")
	public String login(Model model) {
		System.out.println("MainController login()...");
		return "main/loginForm";
	}
	//로그인 체크
	@RequestMapping(value="loginChk", method=RequestMethod.POST)
	public String loginChk(Model model,Member member,HttpServletRequest request,String error) {
		System.out.println("MainController loginChk()...");
		HttpSession session = request.getSession();
			Member members = memberService.login(member);
			if(members != null) {
				session.setAttribute("member", members);
				if(members.getM_ban() == 1) {
					model.addAttribute("msg","정지된 계정입니다.");
					return "main/loginForm";
				}
				return "main/main";
			}else {
				model.addAttribute("msg","아이디 패스워드 오류입니다.");
				return "main/loginForm";
			}
		}
	
	//회원가입 폼
	@RequestMapping(value="memberShip")
	public String memberShipForm(Model model) {
		System.out.println("MainController login()...");
		return "main/memberShipForm";
	}
	//회원가입 처리
	@RequestMapping(value="memberInsert", method=RequestMethod.POST)
	public String memberShip(Model model,Member member) {
			System.out.println("MainController memberShip()=>" + member.getM_email());
			if(member.getM_bizname() !=  null && member.getM_biznum() != null) {
				member.setM_type(1);
			}else {
				member.setM_type(0);
			}
			int result = memberService.memberShip(member);
			if(result == 1) {
				model.addAttribute("msg","회원가입이 완료되었습니다.");
				return "main/main";
			}else{
				model.addAttribute("msg","회원가입에 실패하였습니다.");
				return "main/loginForm";
			}
		}
	}
