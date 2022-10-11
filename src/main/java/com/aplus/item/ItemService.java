package com.aplus.item;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.aplus.item.ItemVO;

public interface ItemService {
	
	//상품 목록 대분류
	public List<ItemVO> itemListL(Integer cat) throws Exception;
	
	//상품 목록 중분류
	public List<ItemVO> itemList(Integer cat) throws Exception;	
	
	//상세페이지
	public ItemVO itemDetail(Integer num) throws Exception;
	
	//
	public List<ItemAttrVO> itemAttr(Integer num) throws Exception;
}
