package com.aplus.my;

import java.util.List;

import com.aplus.model.MemberVO;
import com.aplus.order.OrderVO;

public interface MyService {
	
	//회원 정보 가져오기
	public MemberVO member(String memInfo) throws Exception;
	
	//회원정보 수정
	public MemberVO myUpdate(MemberVO vo) throws Exception;
	
	//주문조회
	public List<OrderVO> myOrder(String id) throws Exception;

	//포인트 충전
	public MemberVO pointUpdate(MemberVO vo) throws Exception;
}
