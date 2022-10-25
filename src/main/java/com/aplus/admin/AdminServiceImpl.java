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
	
	//회원 블랙처리
	@Override
	public MemberVO blackReturn(MemberVO vo) throws Exception {
	
		return dao.blackReturn(vo);
	}
	
	//주문관리
	@Override
	public List<OrderVO> orderAdmin() throws Exception {

		return dao.orderAdmin();
	}

	//주문-배송상태 변경
	@Override
	public OrderVO stateChange(OrderVO vo) throws Exception {

		return dao.stateChange(vo);
	}
	
	//리뷰관리
	@Override
	public List<ReviewVO> reviewAdmin() throws Exception {

		return dao.reviewAdmin();
	}
	
	//리뷰삭제
	@Override
	public ReviewVO reviewDeleteAdmin(Integer reviewnum) throws Exception {

		return dao.reviewDeleteAdmin(reviewnum);
	}
	
	//상품등록
	@Override
	public void itemInsert(ItemVO item) throws Exception {
		
		dao.itemInsert(item);
	}

	//상품상세 등록
	@Override
	public void itemattrInsert(ItemAttrVO attr) throws Exception {
		dao.itemattrInsert(attr);
		
	}

	//상품(대분류)수정
	@Override
	public ItemVO itemUpdate(ItemVO vo) throws Exception {

		return dao.itemUpdate(vo);
	}

	//상품상세(중분류)수정
	@Override
	public ItemAttrVO attrUpdate(ItemAttrVO attr) throws Exception {

		return dao.attrUpdate(attr);
	}

	//상품 구분
	@Override
	public List<ItemVO> itemSelect(ItemVO vo) throws Exception {

		return dao.itemSelect(vo);
	}

	//상품상세 등록시(대분류)값 들고오기
	@Override
	public ItemVO itemInfo(ItemVO vo) throws Exception {

		return dao.itemInfo(vo);
	}

	//상품상세 수정시 값 들고오기
	@Override
	public ItemAttrVO attrInfo(ItemAttrVO attr) throws Exception {

		return dao.attrInfo(attr);
	}









}