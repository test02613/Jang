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
	
	//회원 블랙처리
	public MemberVO blackReturn(MemberVO vo) throws Exception; 
	
	//주문관리
	public List<OrderVO> orderAdmin() throws Exception;
	
	//주문-배송상태 변경
	public OrderVO stateChange(OrderVO vo) throws Exception;
	
	//리뷰관리
	public List<ReviewVO> reviewAdmin() throws Exception;
	
	//상품등록
	public void itemInsert(ItemVO item) throws Exception;
	
	//상품상세 등록
	public void itemattrInsert(ItemAttrVO attr) throws Exception;
	
	//상품(대분류) 수정
	public ItemVO itemUpdate(ItemVO vo) throws Exception;
	
	//상품상세(중분류)수정
	public ItemAttrVO attrUpdate(ItemAttrVO attr) throws Exception;
	
	//상품 구분
	public List<ItemVO> itemSelect(ItemVO vo) throws Exception;
	
	//상품상세 등록시(대분류)값 들고오기
	public ItemVO itemInfo(ItemVO vo) throws Exception;
	
	//상품상세 수정시 값 들고오기
	public ItemAttrVO attrInfo(ItemAttrVO attr) throws Exception;
}