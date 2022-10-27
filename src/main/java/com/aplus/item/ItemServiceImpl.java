package com.aplus.item;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.item.ItemDAO;
import com.aplus.model.MemberVO;
import com.aplus.review.ReviewVO;

@Service
public class ItemServiceImpl implements ItemService {
	@Autowired
	ItemDAO dao;

	/* 상품 목록 대분류 */
	@Override
	public List<ItemVO> itemListL(Integer cat) throws Exception {

		return dao.itemListL(cat);
	}

	/* 상품 목록 중분류 */
	@Override
	public List<ItemVO> itemList(Integer cat) throws Exception {

		return dao.itemList(cat);
	}

	/* 상품 상세페이지 */
	@Override
	public ItemVO itemDetail(Integer num) throws Exception {

		return dao.itemDetail(num);
	}

	/* 가격 받아오는 ajax */
	@Override
	public List<ItemAttrVO> itemAttr(Integer num) throws Exception {

		return dao.itemAttr(num);
	}

	/* 상품 옵션박스 ajax */
	@Override
	public ItemAttrVO itemOp(ItemAttrVO vo) throws Exception {

		return dao.itemOp(vo);
	}

	/* 상품 리뷰 목록 */
	@Override
	public List<ReviewVO> itemreviewlist(Integer itemnum) throws Exception {

		return dao.itemreviewlist(itemnum);
	}

	/* 상품 리뷰 상세 */
	@Override
	public ReviewVO itemreviewdetail(Integer itemnum) throws Exception {

		return dao.itemreviewdetail(itemnum);
	}

	/*-----------상품검색 구현중----------*/
	@Override
	public ItemVO itemSearch(String itemname) throws Exception {

		return dao.itemSearch(itemname);
	}
}
