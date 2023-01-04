package com.myspring.bookshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.bookshop.entity.MemberVO;
import com.myspring.bookshop.mappers.MemberDAO;

@Service
public class MemberService {
	@Autowired
	MemberDAO memberDAO;
	
	//회원가입
	public void joinMember(MemberVO memberVO) throws Exception{
		memberDAO.joinMember(memberVO);
	}

	// 아이디 중복검사
	public int idCheck(String uid) throws Exception {
		return memberDAO.idCheck(uid);
	};
}
