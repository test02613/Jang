package com.aplus.order;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
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
import com.aplus.item.ItemController;
import com.aplus.item.ItemVO;
import com.aplus.model.MemberVO;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	@Autowired
	private OrderService orderService;
	
	//주문 페이지
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String orderLGET(Model model,Integer code,HttpSession session,MemberVO mem) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 주문 페이지 진입");
		
		ItemAttrVO vo =orderService.order_item(code);//item 정보 가져오기
		model.addAttribute("item",vo);
		
		String id = (String) session.getAttribute("id");//세션 id가져오기
		mem=orderService.member(id);//고객 정보 가져오기
		model.addAttribute("member", mem);
		
		logger.info("mem"+mem);
		logger.info("id"+id);
		logger.info("vo"+vo);
		
		return "order/order";
	}
	
	//주문서 넘기기
	@RequestMapping(value = "/orderAction", method = RequestMethod.POST)
	public String orderAction(OrderVO vo, Model model, HttpSession session, MemberVO mem, SessionStatus status) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>orderAction");
		
		String id = (String) session.getAttribute("id");//세션 id가져오기
		mem = orderService.member(id);//고객 정보 가져오기

		orderService.order_insert(vo);//주문 정보 담기
		model.addAttribute("order", vo);//주문번호 가져올 용도 -> 새로고침하면 시퀀스는 올라가기 때문에 주문번호를 다르게 해야하나?
		
		status.setComplete(); // 중복 submit 방지(안하면 새로고침 할 때마다 데이터 계속 넘어감)
		
		return "order/orderFinish";
	}
}