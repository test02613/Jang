package com.aplus.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aplus.controller.LoginController;
import com.aplus.dao.MemberDAO;
import com.aplus.model.MemberVO;

@Repository
public class MemberDAOimpl implements MemberDAO {
	@Autowired
	SqlSession sql;

	// 회원가입
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		sql.insert("mapper.Member_SQL.memberJoin", member);
	}

	// 로그인
	@Override
	public String loginAction(MemberVO member) throws Exception {

		return sql.selectOne("mapper.Member_SQL.loginAction", member);
	}

	// 관리자 로그인
	@Override
	public int loginAction_admin(MemberVO member) throws Exception {

		return sql.selectOne("mapper.Member_SQL.loginAction_admin", member);
	}

	// 아이디 중복 검사
	@Override
	public int idCheck(String id) throws Exception {
		int result = sql.selectOne("mapper.Member_SQL.idCheck", id);
		return result;
	}

	// 아이디 찾기
	@Override
	public String findId(MemberVO vo) throws Exception {
		String result = sql.selectOne("mapper.Member_SQL.findId", vo);
		return result;
	}

	// 비밀번호 찾기
	@Override
	public String findPw(MemberVO vo) throws Exception {
		String result = sql.selectOne("mapper.Member_SQL.findPw", vo);
		return result;
	}

	// 비밀번호 변경
	@Override
	public String updatePw(MemberVO vo) throws Exception {

		return sql.selectOne("mapper.Member_SQL.updatePw", vo);
	}
}
