package com.myspring.bookshop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.bookshop.entity.GoodsVO;
import com.myspring.bookshop.mappers.GoodsDAO;

@Service
public class GoodsService {

	@Autowired
	GoodsDAO goodsDAO;
	
//	@Autowired
//	private SqlSession sqlSession;
//	
//	public List<GoodsVO> selectGoodsList(String goodsStatus ) throws DataAccessException {
//		List<GoodsVO> goodsList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsList",goodsStatus);
//	   return goodsList;	
//     
//	}
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
	
	// 상품목록(메인페이지)
//	public Map<String, List<GoodsVO>> listGoods() {
//		return goodsDAO.listGoods();
//	}


	
	
	

}
