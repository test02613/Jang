package com.aplus.admin;

import java.util.List;

import com.aplus.item.ItemAttrVO;
import com.aplus.item.ItemVO;

public interface AdminService {
	//-----------------------------------------미완성------------------------------------------- 
	//상품등록
	public void itemInsert(ItemVO item) throws Exception;
	
	//상품상세 등록
	public void itemattrInsert(ItemAttrVO itemattr) throws Exception;
}