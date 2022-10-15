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


@Controller
public class CartController {
private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired	
	private CartDAO cartdao;
	@Autowired	
	private CartService cartService;


	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartGet(Model model,HttpSession session,CartVO vo) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>장바구니 진입");
		
		//세션에서 아이디 가져와서 list에 저장
		String id = (String) session.getAttribute("id");
		List<CartVO> list = cartService.cart(id);
		
		model.addAttribute("list", list);
		logger.info("list" + list);
		
		
		return "cart/cart";
	}

	
	@RequestMapping(value = "/addCartAction", method = RequestMethod.GET)
	public String addCartAction(Model model,HttpSession session,CartVO vo) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>장바구니 진입");
		
		//세션에서 아이디 가져와서 list에 저장
		String id = (String) session.getAttribute("id");
		List<CartVO> list = cartService.cart(id);
		
		model.addAttribute("list", list);
		logger.info("list" + list);
		
		
		return "cart/cart";
	}
	
	@RequestMapping(value = "/basketPopUp", method = RequestMethod.GET)
	public String addCartAction() throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>장바구니 진입");
		
		
		
		return "item/basketPopUp";
	}
	/*	
	//장바구니 목록
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartList(CartVO vo,HttpSession session, Model model) throws Exception {
		
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 장바구니 페이지 진입");
		String id = (String) session.getAttribute("id");
		
		List<CartVO> list = cartService.cart(id);
		model.addAttribute("list", list);
		logger.info("list"+list);
		
		return "cart/cart";
	}
	
	//장바구니 추가
	@RequestMapping(value = "/cartInsert", method = RequestMethod.GET)
	public String cartInsert(CartVO vo, Model model) throws Exception {
		
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 장바구니 페이지 진입");
		
		//model.addAttribute("cartlist", cartService.cartlist());
		return "redirect:/cartList";
	}
	
	//장바구니 삭제
	@RequestMapping(value = "/cartDelete", method = RequestMethod.GET)
	public String cartDelete(CartVO vo, Model model) throws Exception {
		
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 장바구니 페이지 진입");
		
		//model.addAttribute("cartlist", cartService.cartlist());
		return "redirect:/cartList";
	}
	
	//장바구니 수정
	@RequestMapping(value = "/cartUpdate", method = RequestMethod.GET)
	public String cartUpdate(CartVO vo, Model model) throws Exception {
		
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 장바구니 페이지 진입");
		
		//model.addAttribute("cartlist", cartService.cartlist());
		return "redirect:/cartList";
	}*/
}
