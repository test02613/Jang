package com.aplus.dao;

import com.aplus.model.MemberVO;

public interface MemberDAO {
	public void memberJoin(MemberVO member) throws Exception;

	// 아이디 중복 검사
	
	
	public String loginAction(MemberVO member) throws Exception;

	public int idCheck(String memberId) throws Exception;;

}
