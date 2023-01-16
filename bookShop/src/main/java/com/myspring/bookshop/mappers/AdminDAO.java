package com.myspring.bookshop.mappers;

import java.util.List;

import com.myspring.bookshop.entity.AttachImageVO;
import com.myspring.bookshop.entity.BookVO;
import com.myspring.bookshop.entity.Criteria;
import com.myspring.bookshop.entity.GoodsVO;
import com.myspring.bookshop.entity.MemberVO;

public interface AdminDAO {
	// 회원 목록
	public List<MemberVO> memberGetList(Criteria cri);
	
	/* 상품 등록 */
	public void bookEnroll(BookVO bookVO);

	// 상품 목록
	public List<GoodsVO> goodsManage();
	
	// 상품 조회 페이지 
	public BookVO goodsGetDetail(int bookId);
	
	/* 상품 수정 */
	public void goodsModify(BookVO vo);
	
	/* 상품 정보 삭제 */
	public int goodsDelete(int bookId);
	
	/* 이미지 등록 */
//	public void imageEnroll(AttachImageVO attachImagevo);
//	public void imageEnroll(List<AttachImageVO> imageList);
//	public void imageEnroll(Map newGoodsMap);
	public void imageEnroll(AttachImageVO image);


}
