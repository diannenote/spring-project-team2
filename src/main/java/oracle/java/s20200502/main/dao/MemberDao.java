package oracle.java.s20200502.main.dao;

import java.util.List;

import oracle.java.s20200502.main.model.Member;

public interface MemberDao {
	Member login(Member member);//로그인 체크 Dao
	int memberShip(Member member);//회원가입 처리 Service
}
