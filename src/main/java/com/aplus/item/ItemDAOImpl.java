package com.aplus.item;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDAOImpl implements ItemDAO {
	@Autowired SqlSession sql;
	
	//상품 목록
	@Override
	public List<ItemVO> itemList(Integer cat) throws Exception {

		return sql.selectList("mapper.Item_SQL.item_list", cat);
	}

}
