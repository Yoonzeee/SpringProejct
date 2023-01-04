package com.myspring.bookshop.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	private String uid;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private String address1;
	private String address2;
	private String address3;
	private Date joinDate;
	private int available;
	private int admin;
}
