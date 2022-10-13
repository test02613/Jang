package com.aplus.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.item.ItemAttrVO;
import com.aplus.model.MemberVO;


@Service
public class OrderServiceImpl implements OrderService {

	@Autowired OrderDAO dao;

	@Override
	public ItemAttrVO order_item(Integer code) throws Exception {
		// TODO Auto-generated method stub
		return dao.order_item(code);
	}

	@Override
	public MemberVO member(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.member(id);
	}
	
}