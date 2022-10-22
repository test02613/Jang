package com.aplus.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.dao.MemberDAO;
import com.aplus.item.ItemAttrVO;
import com.aplus.item.ItemVO;
import com.aplus.model.MemberVO;
import com.aplus.order.OrderVO;
import com.aplus.review.ReviewVO;
import com.aplus.service.MemberService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired AdminDAO dao;
	
	//회원관리 리스트
	@Override
	public List<MemberVO> memberList() throws Exception {
 
		return dao.memberList();
	}

	//회원 블랙처리
	@Override
	public MemberVO memberBlack(MemberVO vo) throws Exception {

		return dao.memberBlack(vo);
	}

	//주문관리
	@Override
	public List<OrderVO> orderAdmin() throws Exception {

		return dao.orderAdmin();
	}

	//리뷰관리
	@Override
	public List<ReviewVO> reviewAdmin() throws Exception {

		return dao.reviewAdmin();
	}
	
	
	//-----------------------------------------미완성------------------------------------------- 
	//상품등록
	@Override
	public void itemInsert(ItemVO item) throws Exception {
		dao.itemInsert(item);
		
	}

	//상품상세 등록
	@Override
	public void itemattrInsert(ItemAttrVO itemattr) throws Exception {
		dao.itemattrInsert(itemattr);
		
	}




}