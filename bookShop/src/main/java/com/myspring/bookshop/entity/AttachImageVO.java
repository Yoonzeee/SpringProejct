package com.myspring.bookshop.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AttachImageVO {
	private String uploadPath;
	private String uuid;
	private String fileName;
	private int bookId;
}
