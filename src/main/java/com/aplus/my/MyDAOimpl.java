package com.aplus.my;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aplus.model.MemberVO;
import com.aplus.order.OrderVO;

@Repository
public class MyDAOimpl implements MyDAO{
	@Autowired SqlSession sql;

	//회원정보 가져오기
	@Override
	public MemberVO member(String memInfo) throws Exception {

		return sql.selectOne("mapper.My_SQL.member", memInfo);
	}
	
	//회원정보 수정
	@Override
	public MemberVO myUpdate(MemberVO vo) throws Exception {

		return sql.selectOne("mapper.My_SQL.my_update", vo);
	}

	//주문조회
	@Override
	public List<OrderVO> myOrder(String id) throws Exception {
	
		return sql.selectList("mapper.My_SQL.my_order", id);
	}

	//포인트 충전
	@Override
	public MemberVO pointUpdate(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("mapper.My_SQL.mypoint_update", vo);
	}

}
