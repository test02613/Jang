package com.aplus.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.item.ItemAttrVO;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	CartDAO dao;

	/* 장바구니 목록 */
	@Override
	public List<CartVO> cart(String id) throws Exception {

		return dao.cart(id);
	}

	/* 상품 정보 가져오기 */
	@Override
	public ItemAttrVO cart_item(ItemAttrVO attr) throws Exception {

		return dao.cart_item(attr);
	}

	/* 장바구니 추가 */
	@Override
	public void cartInsert(CartVO vo) throws Exception {

		dao.cartInsert(vo);
	}

	/* 장바구니 삭제 */
	@Override 
	  public CartVO cartDelete(Integer itemcode) throws Exception {
		
		return dao.cartDelete(itemcode); 
	  }

   	/*해당 회원 장바구니 전체삭제*/
	@Override
	public CartVO cartDeleteAll(String id) throws Exception {

		return dao.cartDeleteAll(id); 
	}

	/* 결제완료시 장바구니에서 삭제 */
	@Override
	public CartVO cartOrderDelete(CartVO vo) throws Exception {

		return dao.cartOrderDelete(vo); 
	}
}
