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
import org.springframework.web.bind.support.SessionStatus;

import com.aplus.item.ItemAttrVO;
import com.aplus.item.ItemService;
import com.aplus.item.ItemVO;
import com.aplus.model.MemberVO;
import com.aplus.order.OrderService;
import com.aplus.order.OrderVO;

@Controller
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private ItemService itemService;

	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderService orderService;
	// 장바구니 추가
	@RequestMapping(value = "/cartInsertAction", method = RequestMethod.GET)
	public String cartInsert(HttpSession session, CartVO vo, Model model, Integer code, ItemAttrVO attr)
			throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>장바구니 insert 진입");

		// 세션 아이디 vo에 저장
		String id = (String) session.getAttribute("id");
		vo.setId(id);

		// 상품 정보 가져오기
		attr.setItemcode(code);
		attr = cartService.cart_item(attr);
		String color = attr.getItemoption();
		Integer cost = attr.getItemcost();
		String name = attr.getItemname();

		// 사진 가져오기
		Integer num = attr.getItemnum();
		ItemVO vo1 = itemService.itemDetail(num);
		String itemimg = vo1.getItemimg();
		vo.setItemimg(itemimg);

		// CartVO에 정보 저장
		vo.setItemcode(code);
		vo.setItemcost(cost);
		vo.setItemname(name);
		vo.setItemoption(color);

		// insert
		cartService.cartInsert(vo);

		return "redirect:/cart";
	}

	// 장바구니 목록
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartGet(Model model, HttpSession session, Integer code) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>장바구니 목록");

		String id = (String) session.getAttribute("id"); // 세션에서 아이디 가져와서 CartVO에 저장

		List<CartVO> vo = cartService.cart(id);
		model.addAttribute("cartlist", vo); // 세션id 장바구니 목록 들고오기

		return "cart/cart";
	}

	// 장바구니 삭제
	@RequestMapping(value = "/cartDeleteAction", method = RequestMethod.GET)
	public String cartDeleteGet(Integer code) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 장바구니 삭제");

		cartService.cartDelete(code);
		return "redirect:/cart";
	}

	// 해당 회원 장바구니 전체삭제
	@RequestMapping(value = "/cartDeleteAllAction", method = RequestMethod.GET)
	public String cartDeleteAllGet(HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 장바구니 삭제");
		String id = (String) session.getAttribute("id"); // 세션에서 아이디 가져와서 CartVO에 저장 

		cartService.cartDeleteAll(id);
		return "redirect:/cart";
	}
	
	@RequestMapping(value = "/cartOrder", method = RequestMethod.GET)
	public String cartOrder(CartVO vo, Model model, String id,HttpSession session,ItemAttrVO attr, Integer code, MemberVO mem ) throws Exception {

		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 장바구니 주문");
		id = (String) session.getAttribute("id");
		List<CartVO> list = cartService.cart(id);
		model.addAttribute("list",list);
		code=list.get(0).getItemcode();
		attr = orderService.order_item(code);// item 정보 가져오기
		attr.setItemcode(code); 
		model.addAttribute("item", attr);
		Integer num = attr.getItemnum();
		ItemVO itemvo = itemService.itemDetail(num);
		model.addAttribute("items", itemvo);
		mem = orderService.member(id);// 고객 정보 가져오기
		model.addAttribute("member", mem);

		return "order/cartorder";
	}
	
	@RequestMapping(value = "/cartOrderAction", method = { RequestMethod.GET, RequestMethod.POST })
	public String cartOrderAction(OrderVO vo, Model model, HttpSession session, MemberVO mem, SessionStatus status) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>카트주문 등록");
		String id = (String) session.getAttribute("id");//세션 id가져오기
		List<CartVO> list = cartService.cart(id);
		Integer code=list.get(0).getItemcode();
		ItemAttrVO attr = orderService.order_item(code);// item 정보 가져오기
		attr.setItemcode(code); 
		mem = orderService.member(id);// 고객 정보 가져오기

		int size = list.size();
		
		for (int i = 0; i<size; i++ ) {
				
		Integer ordercost = list.get(i).getItemcost();
		String postcode =  mem.getPostcode();
		String address = mem.getAddress();
		String addressdetail = mem.getAddressDetail();
		String name = mem.getName();
		Integer itemcode = list.get(i).getItemcode();
				
		vo.setId(id);
		vo.setOrdercost(ordercost);
		vo.setPostcode(postcode);
		vo.setAddress(address);
		vo.setAddressdetail(addressdetail);
		vo.setName(name);
		vo.setItemcode(itemcode);

		orderService.order_insert(vo);
		cartService.cartDelete(itemcode);
		}
		
		

		
		model.addAttribute("order", vo);//주문번호 가져올 용도 -> 새로고침하면 시퀀스는 올라가기 때문에 주문번호를 다르게 해야하나?
		status.setComplete(); // 중복 submit 방지(안하면 새로고침 할 때마다 데이터 계속 넘어감)
		
		logger.info("vo = "+vo);
		
		
		return "order/orderFinish";
	}
}
