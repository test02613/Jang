package com.aplus.my;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.model.MemberVO;
import com.aplus.order.OrderVO;

@Service
public class MyServiceimpl implements MyService {
	@Autowired
	MyDAO dao;

	// 회원 정보 가져오기
	@Override
	public MemberVO member(String memInfo) throws IOException {

		return dao.member(memInfo);
	}

	// 회원정보 수정
	@Override
	public MemberVO myUpdate(MemberVO vo) throws Exception {

		return dao.myUpdate(vo);
	}

	// 회원탈퇴
	@Override
	public MemberVO memberLeave(MemberVO vo) throws Exception {

		return dao.memberLeave(vo);
	}

	// 주문조회
	@Override
	public List<OrderVO> myOrder(String id) throws Exception {

		return dao.myOrder(id);
	}

	// 포인트 충전
	@Override
	public MemberVO pointUpdate(MemberVO vo) throws IOException {

		return dao.pointUpdate(vo);
	}
}
