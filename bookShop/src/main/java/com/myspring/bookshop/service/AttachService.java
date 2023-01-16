package com.myspring.bookshop.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.bookshop.MemberController;
import com.myspring.bookshop.entity.AttachImageVO;
import com.myspring.bookshop.entity.ImageFileVO;
import com.myspring.bookshop.mappers.AttachDAO;


@Service
public class AttachService {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	AttachDAO attachDAO;
	
	/* 이미지 데이터 반환 */
	public List<AttachImageVO> getAttachList(int bookId) {
		
		logger.info("getAttachList.........");
		
		return attachDAO.getAttachList(bookId);
	}

	// 이미지 파일 
//	public void imageEnroll(ImageFileVO imageFileVO) {
//		
//	}

}
