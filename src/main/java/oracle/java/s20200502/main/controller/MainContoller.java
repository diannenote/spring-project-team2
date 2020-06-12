package oracle.java.s20200502.main.controller;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import oracle.java.s20200502.board.model.Board;
import oracle.java.s20200502.main.model.Member;
import oracle.java.s20200502.main.model.RoomList;
import oracle.java.s20200502.main.model.SearchRoomList;
import oracle.java.s20200502.main.service.MemberService;
import oracle.java.s20200502.main.service.Paging;
import oracle.java.s20200502.main.service.RoomListService;
import oracle.java.s20200502.room.model.Room;

@Controller
public class MainContoller {
	private static final Logger logger = LoggerFactory.getLogger(MainContoller.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private	RoomListService ls;
	//메일 셋팅
	@Autowired
	private JavaMailSender mailSender;
	
	//리스트 + 검색   ■■■■■■■■■■■■■■■■■■■■■■■■■■■ 페이징 처리 해야 함.	
	@RequestMapping(value="listSearch")
	public String listSearch(@ModelAttribute("srl") SearchRoomList srl, String currentPage, String currentBlock, Model model) {
		System.out.println("listSearch start... ");
		System.out.println("listSearch currentPage->"+ currentPage);
		System.out.println("listSearch currentBlock->"+ currentBlock);

	    int searchTotal = ls.getST(srl);
		int bSearchTotal = ls.getBT(srl);
		String calPage1 = null;
		String calPage2 = null;
		if (currentBlock == null) {
			currentBlock = "1";
		}
		// currentBlock1,  currentPage2

		if (currentBlock.equalsIgnoreCase("1")) {
			calPage1 = currentPage;
			calPage2 = "1";

		}else {
			calPage1 = "1";
			calPage2 = currentPage;
		}
		System.out.println("나는 리스트서치의 srl.getKeyword() -> " +  srl.getKeyword());
		System.out.println("나는 리스트서치의 서치토탈 -> " +  searchTotal);
		System.out.println("나는 리스트서치의 보드토탈 -> " +  bSearchTotal);
		System.out.println("나는 리스트서치의 currentPage -> " +  calPage1);

		// 1번 페이지
		Paging roomListPG = new Paging(searchTotal, calPage1);
		System.out.println("나는 리스트서치의 roomListPG 수행.. ");
	
		srl.setStart1(roomListPG.getStart());
		srl.setEnd1(roomListPG.getEnd());
		// 1번 사진
		System.out.println("나는 리스트서치의  ls.listSearch 수행전.. ");
		List<RoomList> list = ls.listSearch(srl);
		System.out.println("나는 리스트서치의  ls.listSearch 수행후.. ");
		for(int i =0; i<list.size(); i++) {
			list.get(i).setKeyword(srl.getKeyword());
		}
		
		
		// 2번 커뮤니티 게시판
		// 2번 커뮤니티 페이지
		Paging boardListPG = new Paging(bSearchTotal, calPage2);
		srl.setStart2(boardListPG.getStart());
		srl.setEnd2(boardListPG.getEnd());

		
		List<Board> boardSearchList = ls.boardSearchList(srl);
		
		model.addAttribute("keyword", srl.getKeyword());
		model.addAttribute("listSearch", list);
		model.addAttribute("boardSearchList", boardSearchList);
		model.addAttribute("roomListPG", roomListPG);  		//1번 페이징
		model.addAttribute("boardListPG", boardListPG);		//2번 페이징
		
		return "main/listSearch";
	}	
	@RequestMapping("main")
	public String main(Model model) {
		System.out.println("Open Main");
		List<Room> bestList = ls.getBestList();
		
		model.addAttribute("bestList", bestList);
		return "main/main";
	}
	//로그인폼
	@RequestMapping(value="loginForm")
	public String login(Model model) {
		System.out.println("MainController login()...");
		return "main/loginForm";
	}
	//로그인 체크
	@RequestMapping(value="loginChk", method=RequestMethod.POST)
	public String loginChk(Model model,Member member,HttpSession session,String error) {
		System.out.println("MainController loginChk()...");
			Member members = memberService.login(member, session);
			if(members != null) {
				session.setAttribute("memberInfo", members);
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
	//로그아웃
	@RequestMapping(value="logout")
	public String logout(Model model,Member member,HttpSession session) {
		System.out.println("MainController logout()...");
			session.removeAttribute("memberInfo");
			return "main/main";
		}
	//회원정보 수정 창
	@RequestMapping(value="myInfo")
	public String myInfo(Model model,Member member) {
			System.out.println("MainController myInfo()..");
			return "main/myInfoForm";
		}
	//회원정보 수정 실행
	@RequestMapping(value="myInfoSave", method=RequestMethod.POST)
	public String myInfoSave(Model model,Member member, HttpSession session,@RequestParam("m_reNum") String num) {
			System.out.println("MainController myInfoSave()..");
			System.out.println("myInfoSave=>" + member.getM_nickname());
			System.out.println("myInfoSave=>" + member.getM_phone());
			System.out.println("myInfoSave=>" + member.getM_bizname());
			System.out.println("myInfoSave=>" + member.getM_biznum());
			System.out.println("myInfoSave=>" + member.getM_num());
			System.out.println("myInfoSave=>"  + num);
			memberService.myInfoSave(member);
			session.removeAttribute("memberInfo");
			member.setM_num(Integer.parseInt(num));
			Member members = memberService.myIfoUpdate(member,session);
			session.setAttribute("memberInfo", members);
			return "main/main";
		}
	//회원 비밀번호 변경창
	@RequestMapping(value="pwChange")
	public String pwChange(Model model,Member member) {
			System.out.println("MainController pwChange()..");
			return "main/pwChangeForm";
	}
	//비밀번호 변경 실행
	@RequestMapping(value="pwChangeStart", method=RequestMethod.POST)
		public String pwChangeStart(Model model,Member member,HttpSession session) {
			System.out.println("MainController pwChangeStart()=>" + member.getM_password());
			memberService.pwChange(member);
			session.removeAttribute("memberInfo");
			return "main/loginForm";
	}
	//회원정보 탈퇴
	@RequestMapping(value="memberDelete", method=RequestMethod.POST)
	public String memberDelete(Model model, Member member) {
		System.out.println("MainController memberDelete()=>" + member.getM_num());
		memberService.memberDelete(member);
		return "main/loginForm";
	}
	//회원가입 폼
	@RequestMapping(value="memberShip")
	public String memberShipForm(Model model) {
		System.out.println("MainController login()...");
		model.addAttribute("actionPass", "memberInsert");
		return "main/memberShipForm";
	}
	//회원가입 인증 처리
	@RequestMapping(value="sertification", method=RequestMethod.POST)
	public String sertification(Model model, Member member,String m_email,@RequestParam("actionPass") String actionPass) {
		//리스트 및 랜덤선언
		HashSet<Integer> number = new HashSet<Integer>();
		String numberStr = "";
		while(number.size() < 6) {
			number.add((int)(Math.random() * 9)+1);
		}
		 Iterator<Integer> iter = number.iterator();
		 while(iter.hasNext()) {
			 String str = Integer.toString(iter.next());
			 numberStr += str;
		 }
		//메일 보내기
		System.out.println("mailSending");
		String tomail = m_email;
		System.out.println(tomail);
		String setfrom = m_email;
		String title = "공부하랑 인증번호입니다.";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText("공부하랑 회원가입 인증번호는("+numberStr+")입니다");
			mailSender.send(message);
			model.addAttribute("check",1);
			model.addAttribute("numberStr",numberStr);
		}catch(Exception e) {
			System.out.println(e);
			model.addAttribute("check",2);
		}
		model.addAttribute("sertificationNum",numberStr);
		if(actionPass.equals("memberInsert")) {
			model.addAttribute("actionPass", "memberInsert");
			model.addAttribute("member",member);
		}else {
			model.addAttribute("actionPass", "PassSearch");
			model.addAttribute("member",member);
		}
		return "main/sertification";
	}
	//회원가입 처리
			@RequestMapping(value="memberInsert", method=RequestMethod.POST)
			public String memberShip(Model model,Member member,
					@RequestParam("m_bizname") String m_bizname,
					@RequestParam("m_biznum") String m_biznum) {
					System.out.println("MainController memberShip()=>" + member.getM_email());
					System.out.println("MainController memberShip()=>" + member.getM_bizname());
					System.out.println("MainController memberShip()=>" + member.getM_biznum());
			try {
				if(m_bizname.equals("") && m_biznum.equals("")){member.setM_type(0);}
				else if(m_bizname != null && m_biznum != null){member.setM_type(1);}
					memberService.memberShip(member);
					System.out.println("member.m_membership result=>" + member.getM_newMemberResult());
					return "main/loginForm";
			}catch(Exception e) {
					e.printStackTrace();
					return "main/loginForm";
				}
			}
	//비밀번호 찾기 폼 이동
		@RequestMapping(value="PassSearchForm")
		public String PassSearchForm(Model model, Member member) {
			System.out.println("MainController PassSearchForm()..");
			model.addAttribute("actionPass","PassSearch");
			model.addAttribute("resultNum","0");
			return "main/PassSearchForm";
		}
	//비밀번호 재설정창이동
	@RequestMapping(value="PassSearch", method=RequestMethod.POST)
	public String PassSearch(Model model, Member member) {
		System.out.println("MainController PassSearch()=>" + member.getM_num());
		model.addAttribute("member",member);
		model.addAttribute("resultNum","1");
		return "main/PassSearchForm";
	}
	//패스워드 변경 실행
	@RequestMapping(value="PassSearchStart", method=RequestMethod.POST)
	public String PassSearchStart(Model model, Member member) {
		System.out.println("MainController PassSearch()..");
		try {
		memberService.PassSearch(member);
		return "main/mainForm";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "main/mainForm";
		}
	}
	//아이디 찾기 폼 이동
		@RequestMapping(value="idSearchForm")
		public String idSearchForm(Model model, Member member) {
			System.out.println("MainController idSearchForm()..");
			return "main/idSearchForm";
		}
}
