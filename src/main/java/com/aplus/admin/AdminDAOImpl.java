package com.aplus.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aplus.item.ItemAttrVO;
import com.aplus.item.ItemVO;
import com.aplus.model.MemberVO;
import com.aplus.order.OrderVO;
import com.aplus.review.ReviewVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	@Autowired SqlSession sql;
	
	//회원관리 리스트
	@Override
	public List<MemberVO> memberList() throws Exception {
		
		return sql.selectList("mapper.Admin_SQL.member_list");
	}

	//회원 블랙처리
	@Override
	public MemberVO memberBlack(MemberVO vo) throws Exception {
 
		return sql.selectOne("mapper.Admin_SQL.member_black", vo);
	}

	//주문관리
	@Override
	public List<OrderVO> orderAdmin() throws Exception {

		return sql.selectList("mapper.Admin_SQL.order_admin");
	}
	

	@Override
	public List<ReviewVO> reviewAdmin() throws Exception {

		return sql.selectList("mapper.Admin_SQL.review_admin");
	}
	
	
	//-----------------------------------------미완성------------------------------------------- 
	//상품등록
	@Override
	public void itemInsert(ItemVO item) throws Exception {
		sql.insert("mapper.Admin_SQL.item_insert", item);
	}

	//상품상세 등록
	@Override
	public void itemattrInsert(ItemAttrVO itemattr) throws Exception {
		sql.insert("mapper.Admin_SQL.itemattr_insert", itemattr);
		
	}


}
