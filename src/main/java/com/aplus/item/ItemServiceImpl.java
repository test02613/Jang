package com.aplus.item;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.item.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService {
	@Autowired ItemDAO dao;
	
	//상품 목록
	@Override
	public List<ItemVO> itemList(Integer cat) throws Exception {
		
		return dao.itemList(cat);
	}

}
