package com.aplus.cart;

import java.util.List;

import com.aplus.item.ItemAttrVO;

public interface CartService {

	//상품 정보 가져오기
	public ItemAttrVO cart_item(Integer code) throws Exception;
	
	//장바구니 목록
	public List<CartVO> cart(String id) throws Exception;

	//장바구니 추가
	public void cartInsert(CartVO vo)throws Exception;

	/*//장바구니 수정
	public void cartUpdate()throws Exception;
	
	//장바구니 삭제
	public void cartDelete()throws Exception;*/
}
