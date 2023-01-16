package com.myspring.bookshop.mappers;

import java.util.List;

import com.myspring.bookshop.entity.GoodsVO;
import com.myspring.bookshop.entity.ImageFileVO;

public interface GoodsDAO {

	// 메인페이지 책 목록 보여주기
	public List<GoodsVO> selectGoodsList(String goodsStatus);
	
	// 관리자페이지 책 목록 보여주기
	public List<GoodsVO> adminGoodsList();
	
	// 상품 상세보기
	public GoodsVO selectGoodsDetail(String goods_id);
	
	public List<ImageFileVO> selectGoodsDetailImage(String goods_id);
	
	// 상품 등록
	public void adminInsertGoods(GoodsVO goodsVO);

//	// 상품목록 보기
//	public List<GoodsVO> goodsManage();
}
