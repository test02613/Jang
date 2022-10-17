package com.aplus.my;

import com.aplus.model.MemberVO;

public interface MyDAO {
	
	//회원 정보 가져오기
	public MemberVO member(String memInfo) throws Exception;
	
	//회원정보 수정
	public MemberVO myUpdate(MemberVO vo) throws Exception;
}
