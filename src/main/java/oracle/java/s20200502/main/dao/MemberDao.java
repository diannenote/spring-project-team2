package oracle.java.s20200502.main.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import oracle.java.s20200502.main.model.Member;

public interface MemberDao {
	Member login(Member member, HttpSession session);//로그인 체크 Dao
	int memberShip(Member member);//회원가입 처리 Service
}
