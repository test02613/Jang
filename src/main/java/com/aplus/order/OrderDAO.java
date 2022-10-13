package com.aplus.order;

import com.aplus.item.ItemAttrVO;
import com.aplus.model.MemberVO;

public interface OrderDAO {
	
	
	public ItemAttrVO order_item(Integer code) throws Exception;
	
	public MemberVO member(String id) throws Exception;

}