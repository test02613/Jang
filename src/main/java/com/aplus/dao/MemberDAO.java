package com.aplus.dao;

import com.aplus.model.MemberVO;

public interface MemberDAO {
	public void memberJoin(MemberVO member) throws Exception;

	// 아이디 중복 검사
	
	
	public String loginAction(MemberVO member) throws Exception;
	
	public int loginAction_admin(MemberVO member) throws Exception;

	public int idCheck(String id) throws Exception;
	
	public String findId(MemberVO vo) throws Exception;
		
	public String findPw(MemberVO vo) throws Exception;
	
	public String updatePw(MemberVO vo) throws Exception;
	

}
