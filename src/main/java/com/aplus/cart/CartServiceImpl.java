package com.aplus.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.item.ItemAttrVO;



@Service
public class CartServiceImpl implements CartService{
	@Autowired CartDAO dao;
	
	//장바구니 목록
	@Override
	public List<CartVO> cart(String id) throws Exception {
 
		return dao.cart(id);
	}
	
	//상품 정보 가져오기
	@Override
	public ItemAttrVO cart_item(Integer code) throws Exception {
 
		return dao.cart_item(code);
	}
	
	//장바구니 추가
	@Override
	public void cartInsert(CartVO vo) throws Exception {
		 
		dao.cartInsert(vo);
	}
	
		/*
	

	//장바구니 수정
	@Override
	public void cartUpdate() throws Exception {
		// TODO Auto-generated method stub
		dao.cartUpdate();
	}

	//장바구니 삭제
	@Override
	public void cartDelete() throws Exception {
		// TODO Auto-generated method stub
		dao.cartDelete();
	}*/

}
