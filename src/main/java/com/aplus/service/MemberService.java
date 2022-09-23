package com.aplus.service;

import com.aplus.model.MemberVO;

public interface MemberService {

	public void memberJoin(MemberVO member) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String memberId) throws Exception;
	
	public void loginAction(MemberVO member) throws Exception;

}
