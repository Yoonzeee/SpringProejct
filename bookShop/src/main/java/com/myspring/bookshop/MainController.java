package com.myspring.bookshop;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myspring.bookshop.entity.AttachImageVO;
import com.myspring.bookshop.mappers.AttachDAO;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private AttachDAO attachDAO;
	
	//메인 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET() {
		
		logger.info("메인 페이지 진입");
		
	}

	
	/* 이미지 정보 반환 */
	@RequestMapping(value="/getAttachList", method = RequestMethod.GET)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int bookId){
		
		logger.info("getAttachList.........." + bookId);
		
		return new ResponseEntity<List<AttachImageVO>>(attachDAO.getAttachList(bookId), HttpStatus.OK);
		
	}
	
	
	// 상품 이미지출력
//	@RequestMapping(value="/display", method = RequestMethod.GET)
//	public ResponseEntity<byte[]> getImage(@RequestParam(value="fileName", required = true)String fileName, 
//										   HttpServletResponse response){
//		
//		File file = new File("/Users/yoonz/Documents/download/" + fileName);
//		
//		System.out.println("fileName: [" + file.getAbsolutePath() + "]");
//		
//		ResponseEntity<byte[]> result = null;
//		
//		try {
//			
//			HttpHeaders header = new HttpHeaders();
//			
//			header.add("Content-type", Files.probeContentType(file.toPath()));
//			
//			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
//			
//		}catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		System.out.println("result 값 : " + result);
//		
//		return result;
//	}
	
	// 업로드 이미지 출력하기
//	@RequestMapping(value="/display", method = RequestMethod.GET)
//    public ResponseEntity<byte[]> getFile(String fileName){
//
//       ResponseEntity<byte[]> result = null;
//
//       try{
//           String srcFileName = URLDecoder.decode(fileName,"UTF-8");
//           logger.info("filename : "+srcFileName);
//           File file = new File(uploadPath + File.separator + srcFileName);
//           logger.info("file : "+file);
//           HttpHeaders header = new HttpHeaders();
//
//           //MIME 타입 처리
//           header.add("Content-Type", Files.probeContentType(file.toPath()));
//           //File객체를 Path로 변환하여 MIME 타입을 판단하여 HTTPHeaders의 Content-Type에  값으로 들어갑니다.
//
//           //파일 데이터 처리 *FileCopyUtils.copy 아래에 정리
//           //new ResponseEntity(body,header,status)
//           result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
//           
//       }catch (Exception e){
//           log.error(e.getMessage());
//           return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//       }
//       return result;
//	
       
       
       
       
       
//	@Autowired
//	private GoodsService goodsservice;
//	
	// 메인 페이지 (상품목록)
//	@RequestMapping(value = "/main", method = { RequestMethod.POST, RequestMethod.GET })
//    public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		
//		logger.info("메인 페이지 진입");
//		
//		HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		
//		String viewName = (String) request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		session = request.getSession();
//		
//		Map<String, List<GoodsVO>> goodsList = goodsservice.listGoods();
//		mav.addObject("goodsList", goodsList);
//		
//		// 데이터 들어오는지 확인
//		System.out.println(goodsList);
//		
//		return mav;
//	}
//	
//	
//	// 썸네일
//    private static String CURR_IMAGE_REPO_PATH = "/Users/yoonz/Desktop/file_repo";
//
//	@RequestMapping("/thumbnails.do")
//	protected void thumbnails(@RequestParam("fileName") String fileName, @RequestParam("goods_id") String goods_id,
//			HttpServletResponse response) throws Exception {
//		OutputStream out = response.getOutputStream();
//		
//		String filePath = CURR_IMAGE_REPO_PATH + "/" + goods_id + "/" + fileName;
//		File image = new File(filePath);
//
//		if (image.exists()) {
//			Thumbnails.of(image).size(121, 154).outputFormat("png").toOutputStream(out);
//		}
//		byte[] buffer = new byte[1024 * 8];
//		
//		out.write(buffer);
//		out.close();
//	}
//	
//	// 상품 상세보기 (사진 여러개~)
//	@RequestMapping("/download")
//	protected void download(@RequestParam("fileName") String fileName, @RequestParam("goods_id") String goods_id,
//			HttpServletResponse response) throws Exception {
//		OutputStream out = response.getOutputStream();
//		String filePath = CURR_IMAGE_REPO_PATH + "/" + goods_id + "/" + fileName;
//		File image = new File(filePath);
//
//		response.setHeader("Cache-Control", "no-cache");
//		response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
//		FileInputStream in = new FileInputStream(image);
//		byte[] buffer = new byte[1024 * 8];
//		while (true) {
//			int count = in.read(buffer); // 버퍼에 읽어들인 문자개수
//			if (count == -1) // 버퍼의 마지막에 도달했는지 체크
//				break;
//			out.write(buffer, 0, count);
//		}
//		in.close();
//		out.close();
//	}
//
//	
//    // 상품 상세보기 서비스 기능
//    @RequestMapping(value = "/goodsDetail.do", method = RequestMethod.GET)
//	public ModelAndView goodsDetailPost(@RequestParam(value="goods_id", required = true) String goods_id, 
//										@RequestParam(value="fileName", required=true) String fileName, Model model,
//										HttpServletRequest request, HttpServletResponse response) throws Exception {
//    	
//    	String viewName = (String)request.getAttribute("viewName");
//    	HttpSession session = request.getSession();
//    	
//    	Map goodsMap = goodsservice.goodsDetail(goods_id);
//    	ModelAndView mav = new ModelAndView(viewName);
//    	
//    	model.addAttribute("fileName",fileName);
//    	
//    	mav.addObject("goodsMap", goodsMap);
//    	
//    	GoodsVO goodsVO = (GoodsVO)goodsMap.get("goodsVO");
//    	
//		return mav;
//	}
    
    


}
