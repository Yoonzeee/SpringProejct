package com.myspring.bookshop.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Configuration;

import com.myspring.bookshop.entity.MemberVO;

@Configuration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface MemberDAO {
	
	// 회원가입
	public void joinMember(MemberVO memberVO);
	
	// 아이디 중복 검사
	public int idCheck(String uid);
	
	// 로그인
	public MemberVO loginMember(MemberVO memberVO);

	
	// 회원정보 상세보기(마이페이지?)
	MemberVO selectView(String uid);

	// 회원 목록 보기
	List<MemberVO> listMembers();
	
	// 회원정보 수정
	public void updateMember(MemberVO memberVO);

	// 회원탈퇴
	public void deleteMember(@Param("uid")String uid, @Param("pwd") String pwd);
	
	
	// 아이디 찾기
	public MemberVO idSearch(MemberVO memberVO);
	

	
	
}
