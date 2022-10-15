package com.aplus.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aplus.item.ItemAttrVO;
import com.aplus.model.MemberVO;



@Repository
public class OrderDAOImpl implements OrderDAO{

	@Autowired SqlSession sql;

	//상품 정보 가져오기
	@Override
	public ItemAttrVO order_item(Integer code) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("mapper.Order_SQL.order_item",code);
	}
	
	//고객 정보 가져오기
	@Override
	public MemberVO member(String id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("mapper.Order_SQL.order_member",id);
	}

	//주문 실행
	@Override
	public void order_insert(OrderVO vo) throws Exception {
		 sql.insert("mapper.Order_SQL.order_insert", vo);
		
	}
}