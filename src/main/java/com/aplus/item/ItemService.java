package com.aplus.item;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.aplus.item.ItemVO;

public interface ItemService {
	
	//상품 목록 대분류
	public List<ItemVO> itemListL(Integer cat) throws Exception;
	
	//상품 목록 중분류
	public List<ItemVO> itemList(Integer cat) throws Exception;	
	
	//상품 상세페이지 item
	public ItemVO itemDetail(Integer num) throws Exception;
	
	//가격 받아오는 ajax
	public List<ItemAttrVO> itemAttr(Integer num) throws Exception;
	
	//상품 상세페이지 itemattr
	public ItemAttrVO itemOp(ItemAttrVO vo) throws Exception;
/*	
	//상품금액
	public ItemVO itemCost(Integer cost) throws Exception;

	//상세페이지에서 장바구니 추가
	public void insertCart(Integer itemcode) throws Exception;

	//itemcode
	public ItemVO itemCode(Integer itemcode) throws Exception;*/
}
