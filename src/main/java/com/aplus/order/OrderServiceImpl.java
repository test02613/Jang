package com.aplus.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.item.ItemAttrVO;
import com.aplus.model.MemberVO;


@Service
public class OrderServiceImpl implements OrderService {

	@Autowired OrderDAO dao;

	//상품 정보 가져오기
	@Override
	public ItemAttrVO order_item(Integer code) throws Exception {

		return dao.order_item(code);
	}

	//고객 정보 가져오기
	@Override
	public MemberVO member(String id) throws Exception {
	
		return dao.member(id);
	}
	
	//주문 실행
	@Override
	public void order_insert(OrderVO vo) throws Exception {

		dao.order_insert(vo);
	}

	//주문번호 가져오기
	@Override
	public OrderVO ordernum(Integer ordernum) throws Exception {

		return dao.ordernum(ordernum);
	}
	
	//포인트 업데이트
	@Override
	public MemberVO point_update(MemberVO vo) throws Exception {

		return dao.point_update(vo);
	}
	
}