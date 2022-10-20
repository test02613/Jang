package com.aplus.item;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.aplus.item.ItemVO;
import com.aplus.model.MemberVO;
import com.aplus.review.ReviewVO;

public interface ItemService {
	
	//상품 목록 대분류
	public List<ItemVO> itemListL(Integer cat) throws Exception;
	
	//상품 목록 중분류
	public List<ItemVO> itemList(Integer cat) throws Exception;	
	
	//상품 상세페이지 item
	public ItemVO itemDetail(Integer num) throws Exception;
	
	//가격 받아오는 ajax
	public List<ItemAttrVO> itemAttr(Integer num) throws Exception;
	
	//상품 옵션박스 ajax
	public ItemAttrVO itemOp(ItemAttrVO vo) throws Exception;

	//상품 리뷰 목록
	public List<ReviewVO> itemreviewlist(Integer itemnum) throws Exception;
	
	//상품 리뷰 상세
	public ReviewVO itemreviewdetail(Integer itemnum) throws Exception;
}
