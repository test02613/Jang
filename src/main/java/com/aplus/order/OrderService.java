package com.aplus.order;

import com.aplus.item.ItemAttrVO;
import com.aplus.model.MemberVO;

public interface OrderService {

	//상품 정보 가져오기
	public ItemAttrVO order_item(Integer code) throws Exception;
	
	//고객 정보 가져오기
	public MemberVO member(String id) throws Exception;

	//주문 실행
	public void order_insert(OrderVO vo) throws Exception;
}