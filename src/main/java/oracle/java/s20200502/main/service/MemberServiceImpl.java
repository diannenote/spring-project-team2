package oracle.java.s20200502.main.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200502.main.dao.MemberDao;
import oracle.java.s20200502.main.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	
	@Override
	//로그인 체크 Service
	public Member login(Member member, HttpSession session) {
		System.out.println("MemberServiceImpl login()=>" + member);
		return memberDao.login(member, session);
	}
	@Override
	public int memberShip(Member member) {
		System.out.println("MemberServiceImpl memberShipImpl=>" + member);
		return memberDao.memberShip(member);
	}
	@Override
	public Member duplicateCheck(Member member) {
		System.out.println("MemberServiceImpl duplicateCheck=>" + member);
		return memberDao.duplicateCheck(member);
	}
	@Override
	public Member myInfoSave(Member member) {
		System.out.println("MemberServiceImpl myInfoSave=>" + member);
		return memberDao.myInfoSave(member);
	}
	@Override
	public Member nickNameCheck(Member member) {
		System.out.println("MemberServiceImpl nickNameCheck=>" + member);
		return memberDao.nickNameCheck(member);
	}
}
