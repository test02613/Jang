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
	
	//상품 상세페이지
	@Override
	public ItemVO itemDetail(Integer num) throws Exception {
		
		return dao.itemDetail(num);
	}

	//가격 받아오는 ajax
	@Override
	public List<ItemAttrVO> itemAttr(Integer num) throws Exception {
	
		return dao.itemAttr(num);
	}
	
	//상품 상세페이지 (옵션)
	@Override
	public ItemAttrVO itemOp(ItemAttrVO vo) throws Exception {
		
		return dao.itemOp(vo);
	}

	/*//가격
	@Override
	public ItemVO itemCost(Integer cost) throws Exception {
		// TODO Auto-generated method stub
		return dao.itemCost(cost);
	}

	//상세페이지에서 장바구니 추가
	@Override
	public void insertCart(Integer itemcode) throws Exception {
		dao.insertCart(itemcode);
		
	}

	@Override
	public ItemVO itemCode(Integer itemcode) throws Exception {
		// TODO Auto-generated method stub
		return dao.itemCode(itemcode);
	}*/


}
