package com.aplus.my;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aplus.model.MemberVO;

@Repository
public class MyDAOimpl implements MyDAO{
	@Autowired SqlSession sql;

	//회원정보 가져오기
	@Override
	public MemberVO member(String memInfo) throws Exception {

		return sql.selectOne("mapper.My_SQL.member", memInfo);
	}
	
	//회원정보 수정
	@Override
	public MemberVO myUpdate(MemberVO vo) throws Exception {

		return sql.selectOne("mapper.My_SQL.my_update", vo);
	}

}
