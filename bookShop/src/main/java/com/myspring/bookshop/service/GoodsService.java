package com.myspring.bookshop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.bookshop.entity.BookVO;
import com.myspring.bookshop.entity.GoodsVO;
import com.myspring.bookshop.entity.ImageFileVO;
import com.myspring.bookshop.mappers.GoodsDAO;

@Service
public class GoodsService {

	@Autowired
	GoodsDAO goodsDAO;

	
	// 상품목록(메인페이지)
	public Map<String,List<GoodsVO>> listGoods() throws Exception {
		Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
		List<GoodsVO> goodsList=goodsDAO.selectGoodsList("bestseller");
		goodsMap.put("bestseller",goodsList);
		goodsList=goodsDAO.selectGoodsList("newbook");
		goodsMap.put("newbook",goodsList);
		
		goodsList=goodsDAO.selectGoodsList("steadyseller");
		goodsMap.put("steadyseller",goodsList);
		return goodsMap;
	}
	
	// 상품 상세보기
	public Map<String, Object> goodsDetail(String goods_id) throws Exception {
		Map<String, Object> goodsMap = new HashMap<String, Object>();
		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(goods_id);
		List<ImageFileVO> imageList = imageList(goods_id);
		
		goodsMap.put("goodsVO", goodsVO);
		goodsMap.put("imageList", imageList);
		
		return goodsMap;
	}
	
	// 상품등록(관리자페이지)
		public void adminInsertGoods(GoodsVO goodsVO) {
			goodsDAO.adminInsertGoods(goodsVO);
			
		}

		public List<BookVO> goodsGetDetail(int bookId) {
			return null;
		}

	
	
	// 상품목록(관리자페이지)
	public List<GoodsVO> adminGoodsList() {
		return goodsDAO.adminGoodsList();
	}

	public List<ImageFileVO> imageList(String goods_id){
		return goodsDAO.selectGoodsDetailImage(goods_id);
	}

	
	
	
	
	


	

}
