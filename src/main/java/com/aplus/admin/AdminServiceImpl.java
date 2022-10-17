package com.aplus.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.dao.MemberDAO;
import com.aplus.item.ItemAttrVO;
import com.aplus.item.ItemVO;
import com.aplus.service.MemberService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired AdminDAO dao;
	//-----------------------------------------미완성------------------------------------------- 
	//상품등록
	@Override
	public void itemInsert(ItemVO item) throws Exception {
		dao.itemInsert(item);
		
	}

	//상품상세 등록
	@Override
	public void itemattrInsert(ItemAttrVO itemattr) throws Exception {
		dao.itemattrInsert(itemattr);
		
	}


}