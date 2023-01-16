package com.myspring.bookshop;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.bookshop.entity.CartVO;
import com.myspring.bookshop.entity.MemberVO;
import com.myspring.bookshop.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	@Autowired
    private JavaMailSender mailSender;

	
	
	
	
	
	
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/join")
	public void joinGET() {
		
		logger.info("회원가입 페이지 진입");
	}
	
	// 회원가입 서비스 진입
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String joinPOST(MemberVO memberVO) throws Exception{
			
		logger.info("join 진입");
			
		// 회원가입 서비스 실행
		memberservice.joinMember(memberVO);
		logger.info("join Service 성공");
		return "redirect:/member/login";
			
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String uid) throws Exception{
		logger.info("memberIdChk() 진입");
		
		int result = memberservice.idCheck(uid);
		
		logger.info("결과값 = " + result);
		
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
		}
			
	}
	
	 // 이메일 인증
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호 : " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        logger.info("인증번호 확인 : " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "[BookShop]dbswlehowl@naver.com";
        String toMail = email;
        String title = "📨회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
    }
    
    
    //로그인 페이지 이동
    @RequestMapping(value = "/login")
	public void loginGET() {
		
		logger.info("로그인 페이지 진입");
    }
    
	// 로그인 서비스 기능
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO memberVO, RedirectAttributes rttr) throws Exception {
    	logger.info("로그인 서비스 진입");
    	
    	HttpSession session = request.getSession();
		MemberVO vo = memberservice.loginMember(memberVO);
		
		if(vo == null) {
            int result = 0;
            rttr.addFlashAttribute("result", result);
            
            logger.info("login Service 성공");
            return "redirect:/member/login";
		}
		session.setAttribute("member", vo);
		return "redirect:/main";
	}
    
    
    // 로그아웃 기능
    @RequestMapping(value = "/logout.do", method = RequestMethod.POST)
	public String logoutMainPOST(HttpServletRequest request) throws Exception {
    	logger.info("로그아웃 서비스 진입");
    	
    	HttpSession session = request.getSession();
    	session.invalidate();
    	
		return "redirect:/main";
	}
     
    
    // 마이페이지 페이지?
    @RequestMapping(value = "/view")
	public void myPageGET() {
		
		logger.info("마이페이지 진입");
    }
    
    // 마이페이지 서비스 기능
    @RequestMapping(value = "/view.do", method = RequestMethod.POST)
	public String viewPost(@RequestParam(value="uid", required = true) String uid, Model model){
    	logger.info("authorDetail......." + uid);
    	
    	model.addAttribute("member", memberservice.view(uid));
		
		return "redirect:/member/view";
	}
    
    // 장바구니 페이지
    @RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void cartListGET(){
		logger.info("장바구니 페이지 진입");
    }
    
    // 장바구니 서비스 기능
    @RequestMapping(value = "/cartList.do", method = RequestMethod.POST)
	public String cartListPost(@RequestParam(value="uid", required = true) String uid, Model model){
    	logger.info("cartList.do......." + uid);
    	
    	model.addAttribute("cartList", memberservice.cartList(uid));
		
		return "redirect:/member/view";
	}
    
    // 회원정보수정 페이지 이동
 	@RequestMapping(value = "/update", method=RequestMethod.GET)
 	public void updateGET() {
 		
 		logger.info("회원정보수정 페이지 진입");
 	}
 	
 	// 회원정보수정 서비스 진입
 	@RequestMapping(value="/update.do", method=RequestMethod.POST)
 	public String updatePOST(MemberVO memberVO, HttpServletRequest request) throws Exception{
 			
 		logger.info("update 진입");
 		
 		// 회원정보수정 서비스 실행
 		memberservice.updateMember(memberVO);
 		
 		HttpSession session = request.getSession();
 		session.setAttribute("member", memberVO);
 		
 		logger.info("update Service 성공");
 		
 		
 		return "redirect:/member/view";
 	}
    
    // 회원탈퇴 페이지 이동
 	@RequestMapping(value = "/delete", method=RequestMethod.GET)
 	public void deleteGET() {
 		
 		logger.info("회원탈퇴 페이지 진입");
 	}
 	
 	// 회원탈퇴 서비스 진입
 	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
 	public String deletePOST(String uid, String pwd, HttpServletRequest request) throws Exception{
 			
 		logger.info("delete 진입");
 		
 		// 회원가입 서비스 실행
 		memberservice.deleteMember(uid, pwd);
 		
 		HttpSession session = request.getSession();
 		session.invalidate();
 		
 		logger.info("delete Service 성공");
 	
 		return "redirect:/main";
 	}
    
 	// 장바구니
 	@RequestMapping(value="/cart", method = RequestMethod.POST)
 	public String cartPOST(CartVO cartVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
 			
 		logger.info("장바구니 진입");
 			
 		memberservice.cartEnroll(cartVO);
 			
 		return "redirect:/admin/goodsManage";
 			
 	}
 	
 	
 	
 	
 	// 아이디 찾기
 	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	@ResponseBody
	public String findId(HttpServletRequest request, String name, String email) throws Exception {
		logger.info("아이디 찾기 페이지 진입");
		String uid = memberservice.findIdByPhone(name, email);
		
		HttpSession session = request.getSession();
 		session.setAttribute("findId", uid);
		
 		logger.info("아이디찾기: " + uid);
 		
		return uid;

	}
 	
 	
 	
 	
 // 이메일 인증
    @RequestMapping(value="/findIdMailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String findIdMailCheckGET(String name, String email) throws Exception{
    	logger.info("아이디 찾기 페이지 진입");
    	String userid = memberservice.findIdByPhone(name, email);
    	return userid;
    }
 	
    

    // 아이디 찾기 페이지 이동
    @RequestMapping(value = "/idSearch")
	public void idSearchGET() {
		
		logger.info("아이디 찾기 페이지 진입");
    }
    
    // 아이디 찾기 서비스 기능
    @RequestMapping(value = "/idSearch.do", method = RequestMethod.POST)
	public String idSearchPOST(HttpServletRequest request, MemberVO memberVO, RedirectAttributes rttr) throws Exception {
    	logger.info("아이디 찾기 서비스 진입");
    	
    	HttpSession session = request.getSession();
		MemberVO vo = memberservice.loginMember(memberVO);
		
		if(vo == null) {
            int result = 0;
            rttr.addFlashAttribute("result", result);
            
            logger.info("login Service 성공");
            return "redirect:/member/login";
		}
		session.setAttribute("member", vo);
		return "redirect:/main";
	}
   
}