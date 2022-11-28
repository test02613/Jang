package com.aplus.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.order.OrderVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	ReviewDAO dao;

	// 리뷰 작성
	@Override
	public void reviewCreate(ReviewVO vo) throws Exception {

		dao.reviewCreate(vo);
	}

	// 로그인 회원 리뷰 목록
	@Override
	public List<ReviewVO> reviewList(String id) throws Exception {

		return dao.reviewList(id);
	}

	// 로그인 회원 리뷰 상세
	@Override
	public ReviewVO reviewDetail(Integer num) throws Exception {

		return dao.reviewDetail(num);
	}

	// 리뷰 작성여부 업데이트 ajax
	@Override
	public void review_up(OrderVO vo) throws Exception {

		dao.review_up(vo);
	}

	// 리뷰 수정 reviewnum 가져오기
	@Override
	public ReviewVO reviewnum(ReviewVO vo) throws Exception {

		return dao.reviewnum(vo);
	}

	// 리뷰 수정
	@Override
	public ReviewVO reviewUpdate(ReviewVO vo) throws Exception {

		return dao.reviewUpdate(vo);
	}

	// 리뷰 삭제
	@Override
	public ReviewVO reviewDelete(Integer num) throws Exception {

		return dao.reviewDelete(num);
	}


}