package com.aplus.my;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.model.MemberVO;


@Service
public class MyServiceimpl implements MyService{
	@Autowired MyDAO dao;

	//회원정보 가져오기
	@Override
	public MemberVO member(String memInfo) throws Exception {
		// TODO Auto-generated method stub
		return dao.member(memInfo);
	}
	
	//회원정보 수정
	@Override
	public MemberVO myUpdate(MemberVO vo) throws Exception {
		
		return dao.myUpdate(vo);
	}

}
