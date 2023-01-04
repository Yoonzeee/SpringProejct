package com.myspring.bookshop.mappers;

import java.util.List;

import org.springframework.context.annotation.Configuration;

import com.myspring.bookshop.entity.MemberVO;

@Configuration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface MemberDAO {
	
	public void joinMember(MemberVO memberVO);
	
	// 아이디 중복 검사
	public int idCheck(String uid);
	
	MemberVO selectView(String uid);

	List<MemberVO> listMembers();
	
}
