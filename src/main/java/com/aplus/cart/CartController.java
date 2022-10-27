package com.aplus.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aplus.event.EventController;
import com.aplus.item.ItemAttrVO;
import com.aplus.item.ItemService;
import com.aplus.item.ItemVO;

@Controller
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	@Autowired
	private ItemService itemService;

	@Autowired
	private CartService cartService;

	/* 장바구니 추가 */
	@RequestMapping(value = "/cartInsertAction", method = RequestMethod.GET)
	public String cartInsert(HttpSession session, CartVO vo, Model model, Integer code, ItemAttrVO attr)
			throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>장바구니 insert 진입");
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		attr.setItemcode(code);
		attr = cartService.cart_item(attr);
		String color = attr.getItemcolor();
		Integer cost = attr.getItemcost();
		String name = attr.getItemname();
		Integer num=attr.getItemnum();
		ItemVO vo1 = itemService.itemDetail(num);
		String itemimg=vo1.getItemimg();
		vo.setItemimg(itemimg);
		vo.setItemcode(code);
		vo.setItemcost(cost);
		vo.setItemname(name);
		vo.setItemattr(color);

		cartService.cartInsert(vo);

		return "redirect:/cart";
	}

	/* 장바구니 목록 */
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartGet(Model model, HttpSession session, Integer code) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>장바구니 진입");

		String id = (String) session.getAttribute("id"); /* 세션에서 아이디 가져와서 CartVO에 저장 */

		List<CartVO> vo = cartService.cart(id);
		model.addAttribute("cartlist", vo); /* 세션id 장바구니 목록 들고오기 */

		logger.info("list" + vo);

		return "cart/cart";
	}

	/* 장바구니 삭제 */
	@RequestMapping(value = "/cartDeleteAction", method = RequestMethod.GET)
	public String cartDelete(HttpSession session,CartVO vo, Model model, Integer code) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 장바구니 삭제");
	
		cartService.cartDelete(code);
		return "redirect:/cart";
	}

	// 장바구니 수정
	/*
	 * @RequestMapping(value = "/cartUpdate", method = RequestMethod.GET) public
	 * String cartUpdate(CartVO vo, Model model) throws Exception {
	 * 
	 * logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 장바구니 페이지 진입");
	 * 
	 * //model.addAttribute("cartlist", cartService.cartlist()); return
	 * "redirect:/cartList"; }
	 */

}
