package com.myspring.bookshop;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.bookshop.entity.GoodsVO;
import com.myspring.bookshop.entity.MemberVO;
import com.myspring.bookshop.service.GoodsService;
import com.myspring.bookshop.service.MemberService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	@Autowired
	private GoodsService goodsservice;
	
	
	// 관리자 페이지 이동
    @RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public void adminMainGET() {
		
		logger.info("관리자 페이지 진입");
    }

    // 회원목록 
    @RequestMapping(value = "/listMembers", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView listMembersmain(HttpServletRequest request, HttpServletResponse response) throws Exception {
       
    	logger.info("회원목록 페이지 진입");
    	
        HttpSession session;
        ModelAndView mav = new ModelAndView();
       
        String viewName = (String) request.getAttribute("viewName");
        mav.setViewName(viewName);
        session = request.getSession();
       
        List<MemberVO> listMap = memberservice.listMembers();
        mav.addObject("list", listMap);
       
        return mav;
    }
    
	// 메인 페이지 (상품목록)
	@RequestMapping(value = "/listGoods", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView listGoodsmain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.info("상품목록 페이지 진입");
		
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		session = request.getSession();
		
		Map<String, List<GoodsVO>> goodsList = goodsservice.listGoods();
		mav.addObject("goodsList", goodsList);
		
		// 데이터 들어오는지 확인
//		System.out.println(goodsList);
		
		return mav;
	}

}
