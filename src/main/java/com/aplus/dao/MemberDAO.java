package com.aplus.dao;

import com.aplus.model.MemberVO;

public interface MemberDAO {

	// 회원가입
	public void memberJoin(MemberVO member) throws Exception;

	// 로그인
	public String loginAction(MemberVO member) throws Exception;

	// 관리자 로그인
	public int loginAction_admin(MemberVO member) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String id) throws Exception;

	// 아이디 찾기
	public String findId(MemberVO vo) throws Exception;

	// 비밀번호 찾기
	public String findPw(MemberVO vo) throws Exception;

	// 비밀번호 변경
	public String updatePw(MemberVO vo) throws Exception;

}
