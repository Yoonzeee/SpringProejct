package com.myspring.bookshop.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ImageFileVO {
	private String uuid;
	private int bookID;
	private String fileName;
	private String uploadPath;

}
