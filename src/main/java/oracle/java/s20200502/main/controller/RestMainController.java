package oracle.java.s20200502.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import oracle.java.s20200502.main.model.Member;
import oracle.java.s20200502.main.service.MemberService;

@RestController
public class RestMainController {
	@Autowired
	private MemberService memberService;
	//이메일 중복체크
	@RequestMapping(value="duplicateCheck",produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String duplicateCheck(Model model,Member member) {
		String resultMsg = "";
		memberService.duplicateCheck(member);
		System.out.println("RestMainContoller duplicateCheck member.getM_newMemberResult()=>" + member.getM_newMemberResult());
		if(member.getM_newMemberResult() == 1) {
			return "1";
		}else{
			return "0";
		}
	}
	//닉네임 중복체크
	@RequestMapping(value="nickNameCheck",produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String nickNameCheck(Model model,Member member) {
		String resultMsg = "";
		memberService.nickNameCheck(member);
		System.out.println("RestMainContoller NickNameCheck member.getM_newMemberResult()=>" + member.getM_newMemberResult());
		if(member.getM_newMemberResult() == 1) {
			return "1";
		}else{
			return "0";
		}
	}
}
