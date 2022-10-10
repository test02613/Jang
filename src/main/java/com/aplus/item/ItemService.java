package com.aplus.item;

import java.util.List;

import com.aplus.item.ItemVO;

public interface ItemService {
	
	//상품 목록
	public List<ItemVO> itemList(Integer cat) throws Exception;
}
