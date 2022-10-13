package com.aplus.item;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDAOImpl implements ItemDAO {
	@Autowired SqlSession sql;
	
	//상품 목록 대분류
	@Override
	public List<ItemVO> itemListL(Integer cat) throws Exception {

		return sql.selectList("mapper.Item_SQL.item_listL", cat);
	}
	
	//상품 목록 중분류
	@Override
	public List<ItemVO> itemList(Integer cat) throws Exception {

		return sql.selectList("mapper.Item_SQL.item_list", cat);
	}
	
	//상품 상세
	@Override
	public ItemVO itemDetail(Integer num) throws Exception {
	
		return sql.selectOne("mapper.Item_SQL.item_detail", num);
	}
	
	//가격 받아오는 ajax
	@Override
	public List<ItemAttrVO> itemAttr(Integer num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("mapper.Item_SQL.item_attr",num);
	}
	
	//상품 옵션박스
	@Override
	public ItemAttrVO itemOp(ItemAttrVO vo) throws Exception {
	
		return sql.selectOne("mapper.Item_SQL.item_op", vo);
	}
/*
	//상품가격
	@Override
	public ItemVO  itemCost(Integer cost) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("mapper.Item_SQL.item_cost", cost);
	}

	//상품 상세페이지에서 장바구니 추가
	@Override
	public void insertCart(Integer itemcode) throws Exception {
		sql.insert("mapper.Item_SQL.insert_cart", itemcode);
		
	}

	//itemcode
	@Override
	public ItemVO itemCode(Integer itemcode) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("mapper.Item_SQL.item_code", itemcode);
	}*/

	



}
