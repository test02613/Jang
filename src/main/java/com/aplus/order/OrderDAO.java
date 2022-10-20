package com.aplus.order;

import com.aplus.item.ItemAttrVO;
import com.aplus.model.MemberVO;

public interface OrderDAO {
	
	//상품 정보 가져오기
	public ItemAttrVO order_item(Integer code) throws Exception;
	
	//고객 정보 가져오기
	public MemberVO member(String id) throws Exception;
	
	//주문 실행
	public void order_insert(OrderVO vo) throws Exception;
	
	//주문번호 가져오기
	public OrderVO ordernum(Integer ordernum) throws Exception;
	
	//포인트 업데이트
	public MemberVO point_update(MemberVO vo) throws Exception;

	//리뷰 업데이트 ajax
	public OrderVO review_update(OrderVO vo) throws Exception;
}