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


@Controller
public class CartController {
private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired	
	private CartService cartService;

	//장바구니 추가
	@RequestMapping(value = "/cartInsertAction", method = RequestMethod.GET)
	public String cartInsert(HttpSession session,CartVO vo, Model model, Integer code) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 장바구니 추가");
		
		ItemAttrVO attr = cartService.cart_item(code); //code로 해당 item 정보 가져오기
		model.addAttribute("item", attr);
		
		String id = (String) session.getAttribute("id"); //세션에서 아이디 가져와서 CartVO에 저장
		vo.setId(id);
		vo.setItemcode(code);
		cartService.cartInsert(vo);
		 
		//model.addAttribute("cartlist", cartService.cartlist());
		return "redirect:/cart";
	}
	
	//장바구니 목록
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartGet( Model model,HttpSession session,Integer code) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>장바구니 진입");
		
		String id = (String) session.getAttribute("id"); //세션에서 아이디 가져와서 CartVO에 저장
	
		List<CartVO> vo = cartService.cart(id);
		model.addAttribute("cartlist", vo); //세션id 장바구니 목록 들고오기
		
		logger.info("list" + vo);
		
		return "cart/cart";
	}

	/*@RequestMapping(value = "/addCartAction", method = RequestMethod.GET)
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
	}*/
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
