package com.aplus.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aplus.dao.MemberDAO;
import com.aplus.model.MemberVO;

public interface MemberService {

	public void memberJoin(MemberVO member) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String id) throws Exception;
	
	public String loginAction(MemberVO vo, HttpSession session) throws Exception;
	
	public int loginAction_admin(MemberVO vo) throws Exception;
	
	public String findId(HttpServletResponse response, MemberVO vo) throws Exception;
	
	public String findPw(HttpServletResponse response, MemberVO vo) throws Exception;
	
	public String updatePw(HttpServletResponse response, MemberVO vo) throws Exception;

	/*public int loginAction_admin1(MemberVO vo);*/
	

}
