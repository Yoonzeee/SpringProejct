package com.myspring.bookshop.mappers;

import java.util.List;

import com.myspring.bookshop.entity.GoodsVO;

public interface GoodsDAO {

	// 메인페이지 책 목록 보여주기
	public List<GoodsVO> selectGoodsList(String goodsStatus);

}
