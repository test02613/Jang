package com.aplus.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired ReviewDAO dao;
	
	//리뷰 작성
	@Override
	public void reviewCreate(ReviewVO vo) throws Exception {
		
		dao.reviewCreate(vo);
	}
	
	//로그인 회원 리뷰 목록
	@Override
	public List<ReviewVO> reviewList(String id) throws Exception {

		return dao.reviewList(id);
	}

	//로그인 회원 리뷰 상세
	@Override
	public ReviewVO reviewDetail(String id) throws Exception {

		return dao.reviewDetail(id);
	}
}