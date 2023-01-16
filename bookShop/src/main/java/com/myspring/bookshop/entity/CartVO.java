package com.myspring.bookshop.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CartVO {

	// 아이디
	private String uid;
	// 상품 아이디
	private int bookId;
	// 상품 이름
	private String bookName;
	// 작가 이름
	private String authorName;
	// 출판사 
	private String publisher;
	// 상품 가격
	private int bookPrice;
	// 할인가격
	private int bookDiscount;

}