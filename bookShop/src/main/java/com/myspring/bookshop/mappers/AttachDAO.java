package com.myspring.bookshop.mappers;

import java.util.List;

import com.myspring.bookshop.entity.AttachImageVO;

public interface AttachDAO {
	/* 이미지 데이터 반환 */
	public List<AttachImageVO> getAttachList(int bookId);
}
