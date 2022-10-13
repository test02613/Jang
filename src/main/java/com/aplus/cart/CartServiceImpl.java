package com.aplus.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class CartServiceImpl implements CartService{
	@Autowired CartDAO dao;
	
	@Override
	public List<CartVO> cart(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.cart(id);
	}
	
	/*//장바구니 목록
	@Override
	public List<CartVO> cartList() throws Exception {
		// TODO Auto-generated method stub
		return dao.cartList();
	}

	//장바구니 추가
	@Override
	public void cartInsert() throws Exception {
		// TODO Auto-generated method stub
		dao.cartInsert();
	}

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
