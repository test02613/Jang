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
	@Autowired SqlSession sql;
	
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		sql.insert("mapper.Member_SQL.memberJoin",member);
	}


	@Override
	public String loginAction(MemberVO member) throws Exception {
		
		return sql.selectOne("mapper.Member_SQL.loginAction",member);
	}


	@Override
	public int idCheck(String id) throws Exception {
		int result = sql.selectOne("mapper.Member_SQL.idCheck", id);
		return result;
	}


	@Override
	public String findId(MemberVO vo) throws Exception {
		String result = sql.selectOne("mapper.Member_SQL.findId", vo);
		return result;
	}
	
	@Override
	public String findPw(MemberVO vo) throws Exception {
		String result = sql.selectOne("mapper.Member_SQL.findPw", vo);
		return result;
	}


	@Override
	public int loginAction_admin(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("mapper.Member_SQL.loginAction_admin",member);
	}


	@Override
	public String updatePw(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("mapper.Member_SQL.updatePw",vo);
	}
	
	
	
}
