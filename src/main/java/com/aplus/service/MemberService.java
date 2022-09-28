package com.aplus.service;

import javax.servlet.http.HttpSession;

import com.aplus.dao.MemberDAO;
import com.aplus.model.MemberVO;

public interface MemberService {

	public void memberJoin(MemberVO member) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String memberId) throws Exception;
	
	public String loginAction(MemberVO vo, HttpSession session) throws Exception;

	

}
