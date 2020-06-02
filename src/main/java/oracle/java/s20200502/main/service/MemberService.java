package oracle.java.s20200502.main.service;

import javax.servlet.http.HttpSession;

import oracle.java.s20200502.main.model.Member;

public interface MemberService {
	Member login(Member member, HttpSession session);//로그인 체크 Service
	int memberShip(Member member);//회원가입 처리 Service
	Member duplicateCheck(Member member);//이메일 중복체크
	Member nickNameCheck(Member member);//닉네임 중복체크
	Member myInfoSave(Member member);//회원정보수정
}
