package oracle.java.s20200502.main.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import oracle.java.s20200502.main.model.Member;

public interface MemberService {
	Member login(Member member);//로그인 체크 Service
	int memberShip(Member member);//회원가입 처리 Service
}
