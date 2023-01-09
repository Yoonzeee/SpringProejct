package com.myspring.bookshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myspring.bookshop.entity.MemberVO;
import com.myspring.bookshop.mappers.MemberDAO;

@Service
public class MemberService {
	@Autowired
	MemberDAO memberDAO;
	
	// 회원가입
	public void joinMember(MemberVO memberVO) throws Exception{
		memberDAO.joinMember(memberVO);
	}

	// 아이디 중복검사
	public int idCheck(String uid) throws Exception {
		return memberDAO.idCheck(uid);
	}

	// 로그인
	public MemberVO loginMember(MemberVO memberVO) {
		return memberDAO.loginMember(memberVO);
	};
	
	// 아이디 찾기
	public MemberVO idSearch(MemberVO memberVO) {
		return memberDAO.idSearch(memberVO);
	}

	// 마이페이지
	public Object view(String uid) {
		return memberDAO.selectView(uid);
	}
	
	// 회원목록(관리자페이지)
	public List<MemberVO> listMembers() {
		return memberDAO.listMembers();
	}
	
	// 회원정보수정
	public void updateMember(MemberVO memberVO) throws Exception{
		memberDAO.updateMember(memberVO);
	}

	// 회원탈퇴
	public void deleteMember(String uid, String pwd) {
		memberDAO.deleteMember(uid, pwd);
		
	}
	
	// 비밀번호 찾기
}
