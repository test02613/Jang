package com.aplus.item;
import java.util.List;
import java.util.Map;

import com.aplus.item.ItemVO;
import com.aplus.model.MemberVO;

public interface ItemDAO {
	
	//상품 목록 대분류
	public List<ItemVO> itemListL(Integer cat) throws Exception;
	
	//상품 목록 중분류
	public List<ItemVO> itemList(Integer cat) throws Exception;
	
	//상품상세페이지 item
	public ItemVO itemDetail(Integer num) throws Exception;
	
	//가격 받아오는 ajax
	public List<ItemAttrVO> itemAttr(Integer num) throws Exception;
	
	//상품상세페이지(옵션 박스)itemattr
	public ItemAttrVO itemOp(ItemAttrVO vo) throws Exception;

	public ItemAttrVO insert_cart(Integer code);

	public MemberVO member(String id);
	
/*	//상품금액
	public ItemVO  itemCost(Integer cost) throws Exception;
	
	//itemcode
	public ItemVO itemCode(Integer itemcode) throws Exception;

	//상세페이지에서 장바구니 추가
	public void insertCart(Integer itemcode) throws Exception;*/
}
