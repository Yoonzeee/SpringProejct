package com.myspring.bookshop.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.bookshop.MemberController;
import com.myspring.bookshop.entity.AttachImageVO;
import com.myspring.bookshop.entity.BookVO;
import com.myspring.bookshop.entity.Criteria;
import com.myspring.bookshop.entity.MemberVO;
import com.myspring.bookshop.entity.GoodsVO;
import com.myspring.bookshop.mappers.AdminDAO;
import com.myspring.bookshop.mappers.AttachDAO;

@Service
public class AdminService {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	AdminDAO adminDAO;
	@Autowired
	AttachDAO attachDAO;
	
	// 상품 등록
	public void bookEnroll(BookVO bookVO) throws Exception{
		
		adminDAO.bookEnroll(bookVO);
		
		System.out.println("등록된 VO : " + bookVO);
		
	} 

	// 이미지 등록 
	public void imageEnroll(List<AttachImageVO> list) {
		for(AttachImageVO image: list) {
			adminDAO.imageEnroll(image);
			System.out.println("AdminService image >>>>" + image);
		}
		
	}
	
	// 상품목록(관리자페이지)
	public List<GoodsVO> goodsManage() {
		return adminDAO.goodsManage();
	}
	
	// 상품 조회 페이지
	public BookVO goodsGetDetail(int bookId) {
		
		logger.info("상품 조회 페이지 > 조회한 책 아이디: " + bookId);
		return adminDAO.goodsGetDetail(bookId);
	}
	
	// 상품 정보 수정
	public void goodsModify(BookVO vo) {
		adminDAO.goodsModify(vo);
		
	}
	
	// 상품 정보 삭제
	public int goodsDelete(int bookId) {

		logger.info("goodsDelete..........");
		return adminDAO.goodsDelete(bookId);
	}

    // 회원 목록
    public List<MemberVO> memberGetList(Criteria cri) throws Exception {
        
        return adminDAO.memberGetList(cri);
    }
}
