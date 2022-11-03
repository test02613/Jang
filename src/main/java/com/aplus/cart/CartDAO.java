package com.aplus.cart;

import java.util.List;

import com.aplus.item.ItemAttrVO;

public interface CartDAO {

	// 장바구니 목록
	public List<CartVO> cart(String id) throws Exception;

	// 상품 정보 가져오기
	public ItemAttrVO cart_item(ItemAttrVO attr) throws Exception;

	// 장바구니 추가
	public void cartInsert(CartVO vo) throws Exception;

	// 장바구니 삭제
	public CartVO cartDelete(Integer itemcode) throws Exception;

	// 해당 회원 장바구니 전체삭제
	public CartVO cartDeleteAll(String id) throws Exception;

	// 결제완료시 장바구니에서 삭제
	public CartVO cartOrderDelete(CartVO vo) throws Exception;
}
