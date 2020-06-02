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

import oracle.java.s20200502.main.model.Member;
import oracle.java.s20200502.main.model.RoomList;
import oracle.java.s20200502.main.model.SearchRoomList;
import oracle.java.s20200502.main.service.MemberService;
import oracle.java.s20200502.main.service.Paging;
import oracle.java.s20200502.main.service.RoomListService;

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
	
	//리스트
	@RequestMapping(value="list")
	public String list(RoomList roomlist, String currentPage, Model model) throws Exception {
		System.out.println("maincontroller list Start...");
		int total = ls.total();
		System.out.println("total=>" + total);
		Paging pg = new Paging(total, currentPage);
		System.out.println("currentPage=>" + currentPage);
		roomlist.setStart(pg.getStart());
		roomlist.setEnd(pg.getEnd());
		System.out.println("체크1");
		
		List<RoomList> list = ls.list(roomlist);
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		System.out.println("체크2");
		return "main/list";
	}
	//리스트 + 검색   ■■■■■■■■■■■■■■■■■■■■■■■■■■■ 페이징 처리 해야 함.	
	@RequestMapping(value="listSearch")
	public String listSearch(@ModelAttribute("srl") SearchRoomList srl, String currentPage, Model model)
			throws Exception{
		logger.info("get list search");

		srl.setSearchType("SearchRoomList");
		System.out.println(srl.toString());
		
		
		int total = ls.total();
		System.out.println("total=>" + total);
		Paging pg = new Paging(total, currentPage);
		System.out.println("currentPage=>" + currentPage);
		/*int total = ls.total();*/
		/*Paging pg = new Paging(total, currentPage);*/
		/*pg.setRoomList(srl);*/
		
		
		List<RoomList> list = ls.listSearch(srl);
		model.addAttribute("list", list);
		return "main/listSearch";
	}	
	@RequestMapping("main")
	public String main(Model model) {
		System.out.println("Open Main");
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
			session.removeAttribute("memberinfo");
			return "main/mainForm";
		}
	//회원정보 수정 창
	@RequestMapping(value="myInfo")
	public String myInfo(Model model,Member member) {
			System.out.println("MainController myInfo()..");
			return "main/myInfoForm";
		}
	//회원정보 수정 실행
	@RequestMapping(value="myInfoSave", method=RequestMethod.POST)
	public String myInfoSave(Model model,Member member) {
			System.out.println("MainController myInfoSave()..");
			System.out.println("myInfoSave=>" + member.getM_nickname());
			System.out.println("myInfoSave=>" + member.getM_phone());
			System.out.println("myInfoSave=>" + member.getM_bizname());
			System.out.println("myInfoSave=>" + member.getM_biznum());
			System.out.println("myInfoSave=>" + member.getM_num());
			memberService.myInfoSave(member);
			return "main/mainForm";
		}
	//회원가입 폼
	@RequestMapping(value="memberShip")
	public String memberShipForm(Model model) {
		System.out.println("MainController login()...");
		return "main/memberShipForm";
	}
	//회원가입 인증 처리
	@RequestMapping(value="sertification", method=RequestMethod.POST)
	public String sertification(Model model, Member member,String m_email) {
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
		String title = "공부하랑 회원가입 인증번호입니다.";
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
}
