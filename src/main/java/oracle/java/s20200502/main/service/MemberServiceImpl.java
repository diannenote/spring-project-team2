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
	//회원가입 Service
	@Override
	public int memberShip(Member member) {
		System.out.println("MemberServiceImpl memberShipImpl=>" + member);
		return memberDao.memberShip(member);
	}
	//이메일 중복체크
	@Override
	public Member duplicateCheck(Member member) {
		System.out.println("MemberServiceImpl duplicateCheck=>" + member);
		return memberDao.duplicateCheck(member);
	}
	//회원정보 재설정
	@Override
	public Member myInfoSave(Member member) {
		System.out.println("MemberServiceImpl myInfoSave=>" + member);
		return memberDao.myInfoSave(member);
	}
	//닉네임 중복체크
	@Override
	public Member nickNameCheck(Member member) {
		System.out.println("MemberServiceImpl nickNameCheck=>" + member);
		return memberDao.nickNameCheck(member);
	}
	//회원탈퇴
	@Override
	public Member memberDelete(Member member) {
		System.out.println("MemberServiceImpl memberDelete=>" + member);
		return memberDao.memberDelete(member);
	}
	//패스워드 바꾸기
	@Override
	public Member pwChange(Member member) {
		System.out.println("MemberServiceImpl pwChage=>" + member);
		return memberDao.pwChange(member);
	}
	//
	@Override
	public Member emailNumSearch(Member member) {
		System.out.println("MemberServiceImpl emailNumSearch=>" + member);
		return memberDao.emailNumSearch(member);
	}
	//패스워드 검색
	@Override
	public Member PassSearch(Member member) {
		System.out.println("MemberServiceImpl PassSearch=>" + member);
		return memberDao.PassSearch(member);
	}
	//아이디검색
	@Override
	public Member idExistenceChk(Member member) {
		System.out.println("MemberServiceImpl idExistenceChk Start=>" + member.getM_name());
		System.out.println("MemberServiceImpl idExistenceChk Start=>" + member.getM_phone());
		return memberDao.idExistenceChk(member);
	}
	@Override
	public Member myIfoUpdate(Member member,HttpSession session) {
		System.out.println("MemberServiceImpl imyIfoUpdate Start=>" + member.getM_nickname());
		System.out.println("MemberServiceImpl myIfoUpdate Start=>" + member.getM_phone());
		return memberDao.myIfoUpdate(member,session);
	}
	
}
