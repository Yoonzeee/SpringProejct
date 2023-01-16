package com.myspring.bookshop;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.bookshop.entity.AttachImageVO;
import com.myspring.bookshop.entity.BookVO;
import com.myspring.bookshop.entity.GoodsVO;
import com.myspring.bookshop.entity.ImageFileVO;
import com.myspring.bookshop.entity.MemberVO;
import com.myspring.bookshop.service.AdminService;
import com.myspring.bookshop.service.AttachService;
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
	@Autowired
	private AdminService adminservice;
	@Autowired
	private AttachService attachservice;
	
	

	
	
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
        
        System.out.println(listMap);
        
        mav.addObject("listMap", listMap);
       
        return mav;
    }
    
	// 상품목록
	@RequestMapping(value = "/adminListGoods", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView listGoodsmain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.info("관리자 상품목록 페이지 진입");
		
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		session = request.getSession();
		
		List<GoodsVO> goodsList = goodsservice.adminGoodsList();
		mav.addObject("goodsList", goodsList);
		
		// 데이터 들어오는지 확인
//		System.out.println(goodsList);
		
		return mav;
	}
	
	// 상품 등록 페이지
//	@RequestMapping(value = "/adminInsertGoods")
//	public void adminInsertGoodsGET() {
//		
//		logger.info("상품등록 페이지 진입");
//	}
//	
//	// 상품 등록 서비스
//	@RequestMapping(value="/adminInsertGoods.do", method=RequestMethod.POST)
//	public String adminInsertGoodsPOST(GoodsVO goodsVO) throws Exception{
//			
//		logger.info("adminInsertGoods 서비스 진입");
//			
//		// 상품 등록 서비스 실행
//		goodsservice.adminInsertGoods(goodsVO);
//		logger.info("adminInsertGoods Service 성공");
//		return "redirect:/admin/adminListGoods";
//			
//	}
	
	
	
	// 상품목록
	@RequestMapping(value = "/goodsManage", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView goodsManagemain(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		logger.info("상품목록 진입");
			
			HttpSession session;
			ModelAndView mav = new ModelAndView();
			
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			session = request.getSession();
			
			List<GoodsVO> goodsList = adminservice.goodsManage();
			mav.addObject("goodsList", goodsList);
			
			// 데이터 들어오는지 확인
			System.out.println(goodsList);
			
			return mav;
		}
	

    

    
//    private static String CURR_IMAGE_REPO_PATH = "/Users/yoonz/Documents/download";
//    
//    
//    // 유진2
//    protected List<ImageFileVO> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
//        List<ImageFileVO> fileList = new ArrayList<ImageFileVO>();
//        Iterator<String> fileNames = multipartRequest.getFileNames();
//        
//        while (fileNames.hasNext()) {
//           ImageFileVO imageFileVO = new ImageFileVO();
//           String fileName = fileNames.next();
//           
//           imageFileVO.setFileType(fileName);
//           
//           MultipartFile mFile = multipartRequest.getFile(fileName);
//           String originalFileName = mFile.getOriginalFilename();
//           
//           imageFileVO.setFileName(originalFileName);
//           fileList.add(imageFileVO);
//
//           File file = new File(CURR_IMAGE_REPO_PATH + "/" + fileName);
//           if (mFile.getSize() != 0) { 					// File Null Check
//              if (!file.exists()) { 					// 경로상에 파일이 존재하지 않을 경우
//                 if (file.getParentFile().mkdirs()) { 	// 경로에 해당하는 디렉토리들을 생성
//                    file.createNewFile(); 				// 이후 파일 생성
//                 }
//              }
//              mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + originalFileName)); // 임시로 저장된
//                                                                                   						// multipartFile을
//                                                                                   						// 실제 파일로 전송
//           }
//        }
//        return fileList;
//     }
    
    
    // 유진 
//    @RequestMapping(value = "/goodsEnroll.do", method = { RequestMethod.POST })
//    public ResponseEntity goodsEnroll(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
//          throws Exception {
//       multipartRequest.setCharacterEncoding("utf-8");
//       response.setContentType("text/html; charset=UTF-8");
//       
//       String imageFileName = null;
//
//       Map newGoodsMap = new HashMap();
//       Enumeration enu = multipartRequest.getParameterNames();
//       while (enu.hasMoreElements()) {
//          String name = (String) enu.nextElement();
//          String value = multipartRequest.getParameter(name);
//          newGoodsMap.put(name, value);
//       }
//
//       HttpSession session = multipartRequest.getSession();
//       MemberVO memberVO = (MemberVO) session.getAttribute("member");
////       String reg_id = memberVO.getUid();
//
//       List<ImageFileVO> imageFileList = upload(multipartRequest);
//       if (imageFileList != null && imageFileList.size() != 0) {
////          for (ImageFileVO imageFileVO : imageFileList) {
////             imageFileVO.setReg_id(reg_id);
////          }
//          newGoodsMap.put("imageFileList", imageFileList);
//       }
//
//       String message = null;
//       ResponseEntity resEntity = null;
//       
//       HttpHeaders responseHeaders = new HttpHeaders();
//       responseHeaders.add("Content-Type", "text/html; charset=utf-8");
//       try {
//          int bookId = adminservice.bookEnroll(newGoodsMap);
//          if (imageFileList != null && imageFileList.size() != 0) {
//             for (ImageFileVO imageFileVO : imageFileList) {
//                imageFileName = imageFileVO.getFileName();
//                
//                // 업로드한 이미지를 
//                File srcFile = new File(CURR_IMAGE_REPO_PATH + "/" + bookId + "/" + imageFileName);
//                File destDir = new File(CURR_IMAGE_REPO_PATH + "/" + bookId);
//                org.apache.commons.io.FileUtils.moveFileToDirectory(srcFile, destDir, true);
//             }
//          }
//          message = "<script>";
//          message += " alert('새상품을 추가했습니다.');";
//          message += " location.href='" + multipartRequest.getContextPath() + "/admin/goodsManage';";
//          message += ("</script>");
//       } catch (Exception e) {
//          if (imageFileList != null && imageFileList.size() != 0) {
//             for (ImageFileVO imageFileVO : imageFileList) {
//                imageFileName = imageFileVO.getFileName();
//                File srcFile = new File(CURR_IMAGE_REPO_PATH  + imageFileName);
//                srcFile.delete();
//             }
//          }
//
//          message = "<script>";
//          message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
//          message += " location.href='" + multipartRequest.getContextPath() + "/admin/goodsManage';";
//          message += ("</script>");
//          e.printStackTrace();
//       }
//       resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
//       
//       return resEntity;
//    }
    
    
    
	
	

    
    
    
	// 상품 조회 페이지
	@RequestMapping({"/goodsGetDetail", "/goodsModify"})
	public void goodsGetInfoGET(int bookId, Model model) {
		
		logger.info("goodsGetInfo()........." + bookId);
		
		/* 조회 페이지 정보 */
		model.addAttribute("goodsInfo", adminservice.goodsGetDetail(bookId));
		
	}
	
	// 상품 정보 수정
	@RequestMapping("/goodsModify.do")
	public String goodsModifyPOST(BookVO vo, HttpServletRequest request) throws Exception{
		
		logger.info("goodsModifyPOST.........." + vo);
		
		adminservice.goodsModify(vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("goodsInfo", vo);
		
		logger.info("update Service 성공");
		
		return "redirect:/admin/goodsManage";		
		
	}
	
	// 상품 정보 삭제
	@RequestMapping(value="/goodsDelete", method=RequestMethod.POST)
	public String goodsDeletePOST(int bookId, HttpServletRequest request) throws Exception{
		
		logger.info("delete 진입");
		
		// 게시물 삭제 서비스 실행
		adminservice.goodsDelete(bookId);
		
		return "redirect:/admin/goodsManage";
		
	}
	
	
	
	
	// 첨부 파일 업로드
	@RequestMapping(value="/uploadAjaxAction", method=RequestMethod.POST)
	public @ResponseBody ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile uploadFile) {
		
		logger.info("uploadAjaxActionPOST..........");
		
		logger.info("파일 이름 : " + uploadFile.getOriginalFilename());
		logger.info("파일 타입 : " + uploadFile.getContentType());
		logger.info("파일 크기 : " + uploadFile.getSize());
		
		/* 이미지 파일 체크 */
		File checkfile = new File(uploadFile.getOriginalFilename());
		String type = null;
			
		try {
			type = Files.probeContentType(checkfile.toPath());
			logger.info("MIME TYPE : " + type);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// image인지 아닌지 체크
		if(!type.startsWith("image")) {
			
			List<AttachImageVO> list = null;
			return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			
		}
			
		
		String uploadFolder = "/Users/yoonz/Documents/download";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		
		// 폴더 생성
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		// 이미지 정보 담는 객체
		List<AttachImageVO> list = new ArrayList();
		AttachImageVO vo = new AttachImageVO();
		
		
		// 파일 이름
		String uploadFileName = uploadFile.getOriginalFilename();	
		vo.setFileName(uploadFileName);
		vo.setUploadPath(datePath);
		
		/* uuid 적용 파일 이름 */
		String uuid = UUID.randomUUID().toString();
		vo.setUuid(uuid);
		
		uploadFileName = uuid + "_" + uploadFileName;
		
		// 파일 위치, 파일 이름을 합친 File 객체 
		File saveFile = new File(uploadPath, uploadFileName);
		
		// 파일 저장
		try {
			uploadFile.transferTo(saveFile);
			
			File thumbnailFile = new File(uploadPath, "thum_" + uploadFileName);
			
			BufferedImage bo_image = ImageIO.read(saveFile);
			
			/* 비율 */
			double ratio = 3;
			/*넓이 높이*/
			int width = (int) (bo_image.getWidth() / ratio);
			int height = (int) (bo_image.getHeight() / ratio);	
			
			BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = bt_image.createGraphics();
			graphic.drawImage(bo_image, 0, 0,width,height, null);
				
			ImageIO.write(bt_image, "jpeg", thumbnailFile);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		list.add(vo);
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
		
		adminservice.imageEnroll(list);
		
		logger.info("list : " + list);
		for(AttachImageVO image:list) {
			System.out.println(image.getBookId());
		}
		logger.info("result.getBody(): " + result.getBody());
		
		logger.info("result : " + result);
		
		return result;
	}
	
	
    // 상품등록 페이지 접속
    @RequestMapping(value="/goodsEnroll", method=RequestMethod.GET)
    public void goodsEnrollGET(){
        logger.info("상품등록 페이지 접속");
    }
	
	// 상품등록 서비스
	@RequestMapping(value="/goodsEnroll.do", method=RequestMethod.POST)
	public String goodsEnrollPOST(BookVO bookVO) throws Exception{

		logger.info("상품등록 서비스 진입");
		System.out.println(bookVO);
		// 상품등록 서비스 실행
		adminservice.bookEnroll(bookVO);				// 책 데이터
			
		logger.info("상품등록 서비스 성공");
		return "redirect:/admin/adminMain";
	}
}
