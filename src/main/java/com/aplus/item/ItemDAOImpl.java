package com.aplus.item;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aplus.model.MemberVO;
import com.aplus.review.ReviewVO;

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

		return sql.selectList("mapper.Item_SQL.item_attr",num);
	}
	
	//상품 옵션박스 ajax
	@Override
	public ItemAttrVO itemOp(ItemAttrVO vo) throws Exception {
	
		return sql.selectOne("mapper.Item_SQL.item_op", vo);
	}

	//상품 리뷰 목록
	@Override
	public List<ReviewVO> itemreviewlist(Integer itemnum) throws Exception {

		return sql.selectList("mapper.Item_SQL.itemreview_list", itemnum);
	}

	//상품 리뷰 상세
	@Override
	public ReviewVO itemreviewdetail(Integer itemnum) throws Exception {

		return sql.selectOne("mapper.Item_SQL.itemreview_detail", itemnum);
	}
}
