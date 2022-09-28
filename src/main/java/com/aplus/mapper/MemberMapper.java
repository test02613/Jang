package com.aplus.mapper;

import javax.servlet.http.HttpSession;

import com.aplus.model.MemberVO;

public interface MemberMapper {

	public void memberJoin(MemberVO member);

	// 아이디 중복 검사
	public int idCheck(String memberId);
	
	public String loginAction(MemberVO vo, HttpSession session);

}