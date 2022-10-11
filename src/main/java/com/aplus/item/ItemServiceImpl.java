package com.aplus.item;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.item.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService {
	@Autowired ItemDAO dao;
	
	//상품 목록 대분류
	@Override
	public List<ItemVO> itemListL(Integer cat) throws Exception {
		
		return dao.itemListL(cat);
	}
	
	//상품 목록 중분류
	@Override
	public List<ItemVO> itemList(Integer cat) throws Exception {
		
		return dao.itemList(cat);
	}
	
	//
	@Override
	public ItemVO itemDetail(Integer num) throws Exception {
		
		return dao.itemDetail(num);
	}

	//
	@Override
	public List<ItemAttrVO> itemAttr(Integer num) throws Exception {
		
		return dao.itemAttr(num);
	}
}
