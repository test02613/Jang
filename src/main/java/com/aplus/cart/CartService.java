package com.aplus.cart;

import java.util.List;

public interface CartService {

	public List<CartVO> cart(String id) throws Exception;
	
	/*//장바구니 목록
	public List<CartVO> cartList()throws Exception;

	//장바구니 추가
	public void cartInsert()throws Exception;
	
	//장바구니 수정
	public void cartUpdate()throws Exception;
	
	//장바구니 삭제
	public void cartDelete()throws Exception;*/
}
