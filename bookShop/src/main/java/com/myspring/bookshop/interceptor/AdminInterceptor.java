package com.myspring.bookshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.bookshop.entity.MemberVO;

public class AdminInterceptor implements HandlerInterceptor{

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
		HttpSession session = request.getSession();
	        
	    MemberVO vo = (MemberVO)session.getAttribute("member");
        
        // 
	    if (vo == null || vo.getAdmin() == 0) {
	    	response.sendRedirect("/bookshop/main");
	    	return false;
	    }
	    
	    return true;
    }

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}
}
