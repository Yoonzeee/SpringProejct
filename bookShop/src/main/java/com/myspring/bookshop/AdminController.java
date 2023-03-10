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
	
	

	
	
	// ????????? ????????? ??????
    @RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public void adminMainGET() {
		
		logger.info("????????? ????????? ??????");
    }

    // ???????????? 
    @RequestMapping(value = "/listMembers", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView listMembersmain(HttpServletRequest request, HttpServletResponse response) throws Exception {
       
    	logger.info("???????????? ????????? ??????");
    	
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
    
	// ????????????
	@RequestMapping(value = "/adminListGoods", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView listGoodsmain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.info("????????? ???????????? ????????? ??????");
		
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		session = request.getSession();
		
		List<GoodsVO> goodsList = goodsservice.adminGoodsList();
		mav.addObject("goodsList", goodsList);
		
		// ????????? ??????????????? ??????
//		System.out.println(goodsList);
		
		return mav;
	}
	
	// ?????? ?????? ?????????
//	@RequestMapping(value = "/adminInsertGoods")
//	public void adminInsertGoodsGET() {
//		
//		logger.info("???????????? ????????? ??????");
//	}
//	
//	// ?????? ?????? ?????????
//	@RequestMapping(value="/adminInsertGoods.do", method=RequestMethod.POST)
//	public String adminInsertGoodsPOST(GoodsVO goodsVO) throws Exception{
//			
//		logger.info("adminInsertGoods ????????? ??????");
//			
//		// ?????? ?????? ????????? ??????
//		goodsservice.adminInsertGoods(goodsVO);
//		logger.info("adminInsertGoods Service ??????");
//		return "redirect:/admin/adminListGoods";
//			
//	}
	
	
	
	// ????????????
	@RequestMapping(value = "/goodsManage", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView goodsManagemain(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		logger.info("???????????? ??????");
			
			HttpSession session;
			ModelAndView mav = new ModelAndView();
			
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			session = request.getSession();
			
			List<GoodsVO> goodsList = adminservice.goodsManage();
			mav.addObject("goodsList", goodsList);
			
			// ????????? ??????????????? ??????
			System.out.println(goodsList);
			
			return mav;
		}
	

    

    
//    private static String CURR_IMAGE_REPO_PATH = "/Users/yoonz/Documents/download";
//    
//    
//    // ??????2
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
//              if (!file.exists()) { 					// ???????????? ????????? ???????????? ?????? ??????
//                 if (file.getParentFile().mkdirs()) { 	// ????????? ???????????? ?????????????????? ??????
//                    file.createNewFile(); 				// ?????? ?????? ??????
//                 }
//              }
//              mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + originalFileName)); // ????????? ?????????
//                                                                                   						// multipartFile???
//                                                                                   						// ?????? ????????? ??????
//           }
//        }
//        return fileList;
//     }
    
    
    // ?????? 
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
//                // ???????????? ???????????? 
//                File srcFile = new File(CURR_IMAGE_REPO_PATH + "/" + bookId + "/" + imageFileName);
//                File destDir = new File(CURR_IMAGE_REPO_PATH + "/" + bookId);
//                org.apache.commons.io.FileUtils.moveFileToDirectory(srcFile, destDir, true);
//             }
//          }
//          message = "<script>";
//          message += " alert('???????????? ??????????????????.');";
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
//          message += " alert('????????? ??????????????????. ?????? ????????? ?????????');";
//          message += " location.href='" + multipartRequest.getContextPath() + "/admin/goodsManage';";
//          message += ("</script>");
//          e.printStackTrace();
//       }
//       resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
//       
//       return resEntity;
//    }
    
    
    
	
	

    
    
    
	// ?????? ?????? ?????????
	@RequestMapping({"/goodsGetDetail", "/goodsModify"})
	public void goodsGetInfoGET(int bookId, Model model) {
		
		logger.info("goodsGetInfo()........." + bookId);
		
		/* ?????? ????????? ?????? */
		model.addAttribute("goodsInfo", adminservice.goodsGetDetail(bookId));
		
	}
	
	// ?????? ?????? ??????
	@RequestMapping("/goodsModify.do")
	public String goodsModifyPOST(BookVO vo, HttpServletRequest request) throws Exception{
		
		logger.info("goodsModifyPOST.........." + vo);
		
		adminservice.goodsModify(vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("goodsInfo", vo);
		
		logger.info("update Service ??????");
		
		return "redirect:/admin/goodsManage";		
		
	}
	
	// ?????? ?????? ??????
	@RequestMapping(value="/goodsDelete", method=RequestMethod.POST)
	public String goodsDeletePOST(int bookId, HttpServletRequest request) throws Exception{
		
		logger.info("delete ??????");
		
		// ????????? ?????? ????????? ??????
		adminservice.goodsDelete(bookId);
		
		return "redirect:/admin/goodsManage";
		
	}
	
	
	
	
	// ?????? ?????? ?????????
	@RequestMapping(value="/uploadAjaxAction", method=RequestMethod.POST)
	public @ResponseBody ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile uploadFile) {
		
		logger.info("uploadAjaxActionPOST..........");
		
		logger.info("?????? ?????? : " + uploadFile.getOriginalFilename());
		logger.info("?????? ?????? : " + uploadFile.getContentType());
		logger.info("?????? ?????? : " + uploadFile.getSize());
		
		/* ????????? ?????? ?????? */
		File checkfile = new File(uploadFile.getOriginalFilename());
		String type = null;
			
		try {
			type = Files.probeContentType(checkfile.toPath());
			logger.info("MIME TYPE : " + type);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// image?????? ????????? ??????
		if(!type.startsWith("image")) {
			
			List<AttachImageVO> list = null;
			return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			
		}
			
		
		String uploadFolder = "/Users/yoonz/Documents/download";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		
		// ?????? ??????
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		// ????????? ?????? ?????? ??????
		List<AttachImageVO> list = new ArrayList();
		AttachImageVO vo = new AttachImageVO();
		
		
		// ?????? ??????
		String uploadFileName = uploadFile.getOriginalFilename();	
		vo.setFileName(uploadFileName);
		vo.setUploadPath(datePath);
		
		/* uuid ?????? ?????? ?????? */
		String uuid = UUID.randomUUID().toString();
		vo.setUuid(uuid);
		
		uploadFileName = uuid + "_" + uploadFileName;
		
		// ?????? ??????, ?????? ????????? ?????? File ?????? 
		File saveFile = new File(uploadPath, uploadFileName);
		
		// ?????? ??????
		try {
			uploadFile.transferTo(saveFile);
			
			File thumbnailFile = new File(uploadPath, "thum_" + uploadFileName);
			
			BufferedImage bo_image = ImageIO.read(saveFile);
			
			/* ?????? */
			double ratio = 3;
			/*?????? ??????*/
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
	
	
    // ???????????? ????????? ??????
    @RequestMapping(value="/goodsEnroll", method=RequestMethod.GET)
    public void goodsEnrollGET(){
        logger.info("???????????? ????????? ??????");
    }
	
	// ???????????? ?????????
	@RequestMapping(value="/goodsEnroll.do", method=RequestMethod.POST)
	public String goodsEnrollPOST(BookVO bookVO) throws Exception{

		logger.info("???????????? ????????? ??????");
		System.out.println(bookVO);
		// ???????????? ????????? ??????
		adminservice.bookEnroll(bookVO);				// ??? ?????????
			
		logger.info("???????????? ????????? ??????");
		return "redirect:/admin/adminMain";
	}
}
