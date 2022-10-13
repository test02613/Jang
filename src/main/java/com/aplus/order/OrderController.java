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

import com.aplus.item.ItemAttrVO;
import com.aplus.item.ItemController;
import com.aplus.item.ItemVO;
import com.aplus.model.MemberVO;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	@Autowired
	private OrderService orderService;
	
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
	
}