package oracle.java.s20200502.main.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200502.main.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession sqlSession;
	@Override
	//로그인 체크 Dao
	public Member login(Member member, HttpSession session) {	
		System.out.println("MemberDaoImpl login Start()=>" + member.getM_email());
		System.out.println("MemberDaoImpl login Start()=>" + member.getM_password());
		System.out.println("MemberDaoImpl memberShip Start()=>" + member.getM_ban());
			return sqlSession.selectOne("loginSelect", member);
			
	}
	//회원가입 처리 Dao
	@Override
	public int memberShip(Member member) {
		System.out.println("MemberDaoImpl memberShipDao Start()=>" + member.getM_email());
		System.out.println("MemberDaoImpl memberShipDao Start()=>" + member.getM_password());
		System.out.println("MemberDaoImpl memberShipDao Start()=>" + member.getM_nickname());
		System.out.println("MemberDaoImpl memberShipDao Start()=>" + member.getM_phone());
		System.out.println("MemberDaoImpl memberShipDao Start()=>" + member.getM_bizname());
		System.out.println("MemberDaoImpl memberShipDao Start()=>" + member.getM_biznum());
		return sqlSession.selectOne("memberShipInsert", member);
	}
	@Override
	public Member duplicateCheck(Member member) {
		System.out.println("MemberDaoImpl duplicateCheck Start eamil()=>" + member.getM_email());
		return sqlSession.selectOne("duplicateCheck", member);
	}
	@Override
	public Member myInfoSave(Member member) {
		System.out.println("MemberDaoImpl myInfoSave Start=>" + member.getM_num());
		return sqlSession.selectOne("myInfoSave", member);
	}
	@Override
	public Member nickNameCheck(Member member) {
		System.out.println("MemberDaoImpl nickNameCheck Start=>" + member.getM_nickname());
		return sqlSession.selectOne("nickNameCheck", member);
	}
}
