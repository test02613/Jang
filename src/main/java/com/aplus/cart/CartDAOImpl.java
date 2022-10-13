package com.aplus.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO{
	@Autowired SqlSession sql;
	
	@Override
	public List<CartVO> cart(String id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("mapper.Cart_SQL.cart",id);
	}
	
	/*//장바구니 목록
	@Override
	public List<CartVO> cartList() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("mapper.Cart_SQL.cart_list");
	}

	//장바구니 추가
	@Override
	public void cartInsert() throws Exception {
		
		sql.insert("mapper.Cart_SQL.cart_insert");
	}

	//장바구니 수정
	@Override
	public void cartUpdate() throws Exception {
	
		sql.insert("mapper.Cart_SQL.cart_update");
	}

	//장바구니 삭제
	@Override
	public void cartDelete() throws Exception {

		sql.insert("mapper.Cart_SQL.cart_delete");
	}*/

}
