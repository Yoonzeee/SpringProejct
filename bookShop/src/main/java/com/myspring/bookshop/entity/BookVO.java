package com.myspring.bookshop.entity;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BookVO {
//	/* 경로 */
//	private String uploadPath;
//	/* uuid */
//	private String uuid;
//	/* 파일 이름 */
//	private String fileName;
//	/* 이미지 정보 */
//	private List<AttachImageVO> imageList;
	
	// 상품 아이디
	private int bookId;
	// 상품 이름
	private String bookName;
	// 작가 이름
	private String authorName;
	// 출판일
	private String publeYear;
	// 출판사 
	private String publisher;
	// 카테고리 코드 
	private String cateCode;
	// 상품 가격
	private int bookPrice;
	// 상품 재고
	private int bookStock;
	// 할인가격
	private int bookDiscount;
	// 책 소개
	private String bookIntro;
	// 책 목차
	private String bookContents;
	
	private Date regDate;
	private Date updateDate;

	
}
