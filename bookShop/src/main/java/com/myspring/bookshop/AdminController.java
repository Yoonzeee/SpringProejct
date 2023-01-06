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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.bookshop.entity.MemberVO;
import com.myspring.bookshop.service.MemberService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	
	// 관리자 페이지 이동
    @RequestMapping(value = "/main", method = RequestMethod.GET)
	public void adminMainGET() {
		
		logger.info("관리자 페이지 진입");
    }

    // 회원목록 
    @RequestMapping(value = "/listMembers", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
       HttpSession session;
       ModelAndView mav = new ModelAndView();
       
       String viewName = (String) request.getAttribute("viewName");
       mav.setViewName(viewName);
       session = request.getSession();
       List<MemberVO> listMap = memberservice.listMembers();
       mav.addObject("list", listMap);
       return mav;
    }

}
