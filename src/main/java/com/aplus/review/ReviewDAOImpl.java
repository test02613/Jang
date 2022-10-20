package com.aplus.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	@Autowired SqlSession sql;

	//리뷰 등록
	@Override
	public void reviewCreate(ReviewVO vo) throws Exception {
		sql.insert("mapper.Review_SQL.review_insert", vo);
		
	}

	//로그인 회원 리뷰 목록
	@Override
	public List<ReviewVO> reviewList(String id) throws Exception {
	
		return sql.selectList("mapper.Review_SQL.myreview_list", id);
	}
	
	//로그인 회원 리뷰 상세
	@Override
	public ReviewVO reviewDetail(String id) throws Exception {
	
		return sql.selectOne("mapper.Review_SQL.myreview_list", id);
	}
}