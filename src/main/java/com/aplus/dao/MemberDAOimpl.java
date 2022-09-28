package com.aplus.dao;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aplus.dao.MemberDAO;
import com.aplus.model.MemberVO;
@Repository
public class MemberDAOimpl implements MemberDAO {

	@Autowired SqlSession sql;
	
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		sql.insert("com.aplus.mapper.MemberMapper.memberJoin",member);
	}


	@Override
	public String loginAction(MemberVO member) throws Exception {
		return sql.selectOne("com.aplus.mapper.MemberMapper.loginAction",member);
	}


	@Override
	public int idCheck(String memberId) throws Exception {
		int result = sql.selectOne("com.aplus.mapper.MemberMapper.idCheck", memberId);
		return result;
	}
	
	
	
}
