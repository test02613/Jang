package com.aplus.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aplus.item.ItemAttrVO;

@Repository
public class CartDAOImpl implements CartDAO {
	@Autowired
	SqlSession sql;

	// 장바구니 목록
	@Override
	public List<CartVO> cart(String id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("mapper.Cart_SQL.cart", id);
	}

	// 상품 정보 가져오기
	@Override
	public ItemAttrVO cart_item(ItemAttrVO attr) throws Exception {

		return sql.selectOne("mapper.Cart_SQL.cart_item", attr);
	}

	// 장바구니 추가
	@Override
	public void cartInsert(CartVO vo) throws Exception {

		sql.insert("mapper.Cart_SQL.cart_insert", vo);
	}

	// 장바구니 삭제
	@Override
	public CartVO cartDelete(Integer itemcode) throws Exception {

		return sql.selectOne("mapper.Cart_SQL.cart_delete", itemcode);
	}

	// 해당 회원 장바구니 전체삭제
	@Override
	public CartVO cartDeleteAll(String id) throws Exception {

		return sql.selectOne("mapper.Cart_SQL.cart_deleteall", id);
	}

	// 결제완료시 장바구니에서 삭제
	@Override
	public CartVO cartOrderDelete(CartVO vo) throws Exception {

		return sql.selectOne("mapper.Cart_SQL.cart_OrderDelete", vo);
	}
}
