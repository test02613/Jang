package com.aplus.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aplus.dao.MemberDAO;
import com.aplus.model.MemberVO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberVO member) throws Exception;
	
	//로그인
	public String loginAction(MemberVO vo, HttpSession session) throws Exception;
	
	//관리자 로그인
	public int loginAction_admin(MemberVO vo) throws Exception;
	
	// 아이디 중복 검사
	public int idCheck(String id) throws Exception;
	
	//아이디 찾기
	public String findId(HttpServletResponse response, MemberVO vo) throws Exception;
	
	//비밀번호 찾기	
	public String findPw(HttpServletResponse response, MemberVO vo) throws Exception;
	
	//비밀번호 변경
	public String updatePw(HttpServletResponse response, MemberVO vo) throws Exception;


}
