package com.aplus.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aplus.item.ItemAttrVO;
import com.aplus.item.ItemVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	@Autowired SqlSession sql;
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
