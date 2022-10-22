package com.aplus.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aplus.order.OrderVO;

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
	public ReviewVO reviewDetail(Integer num) throws Exception {
	
		return sql.selectOne("mapper.Review_SQL.myreview_detail", num);
	}
	
	//리뷰 작성여부 업데이트 ajax
	@Override
	public void review_up(OrderVO vo) throws Exception {

		sql.selectOne("mapper.Review_SQL.reveiw_up", vo);
	}
	
	//리뷰 수정 reviewnum 가져오기
	@Override
	public ReviewVO reviewnum(ReviewVO vo) throws Exception {

		return sql.selectOne("mapper.Review_SQL.review_num", vo);
	}
	
	//리뷰 수정
	@Override
	public ReviewVO reviewUpdate(ReviewVO vo) throws Exception {

		return sql.selectOne("mapper.Review_SQL.review_update", vo);
	}

	//리뷰 삭제
	@Override
	public ReviewVO reviewDelete(Integer num) throws Exception {
		
		return sql.selectOne("mapper.Review_SQL.review_delete", num);
	}
}