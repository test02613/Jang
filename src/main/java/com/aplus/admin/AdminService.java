package com.aplus.admin;

import java.util.List;

import com.aplus.item.ItemAttrVO;
import com.aplus.item.ItemVO;
import com.aplus.model.MemberVO;
import com.aplus.order.OrderVO;
import com.aplus.review.ReviewVO;

public interface AdminService {
	
	//회원관리 리스트
	public List<MemberVO> memberList() throws Exception;
	
	//회원 블랙처리
	public MemberVO memberBlack(MemberVO vo) throws Exception; 
	
	//주문관리
	public List<OrderVO> orderAdmin() throws Exception;
	
	//리뷰관리
	public List<ReviewVO> reviewAdmin() throws Exception;
	
	//-----------------------------------------미완성------------------------------------------- 
	//상품등록
	public void itemInsert(ItemVO item) throws Exception;
	
	//상품상세 등록
	public void itemattrInsert(ItemAttrVO itemattr) throws Exception;
}