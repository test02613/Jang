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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.aplus.item.ItemAttrVO;
import com.aplus.item.ItemController;
import com.aplus.item.ItemVO;
import com.aplus.model.MemberVO;
import com.aplus.review.ReviewVO;

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
		mem = orderService.member(id);//고객 정보 가져오기
		model.addAttribute("member", mem);
		
		logger.info("mem"+mem);
		logger.info("id"+id);
		logger.info("vo"+vo);
		
		return "order/order";
	}
	
	//주문서 넘기기
	@RequestMapping(value = "/orderAction", method = RequestMethod.POST)
	public String orderAction(OrderVO vo, Model model, HttpSession session, MemberVO mem,Integer ordernum, SessionStatus status) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>orderAction");
		
		String id = (String) session.getAttribute("id");//세션 id가져오기
		mem = orderService.member(id);//고객 정보 가져오기
		
		vo.setId(id);
		orderService.order_insert(vo);
		Integer num = vo.getOrdernum();
			
		//status.setComplete(); // 중복 submit 방지(안하면 새로고침 할 때마다 데이터 계속 넘어감)
		
		return "redirect:/orderFinish?num=" + num;
	}
	
	//포인트 업데이트
	@RequestMapping(value = "/pointUp", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String getPoint(@RequestParam("getpoint") String getpoint,HttpSession session,MemberVO vo) throws Exception {
		
		int point = Integer.parseInt(getpoint); //ajax에서 포인트 가져오기
		
		String id = (String) session.getAttribute("id");//세션 id 가져오기
				
		vo.setPoint(point);//포인트 저장
		vo.setId(id);//id 저장
		
		orderService.point_update(vo);
		
		return "point";
	}
	
	//주문확인 페이지
	@RequestMapping(value = "/orderFinish", method = RequestMethod.GET)
	public String orderFinish(Model model, HttpSession session, Integer num, SessionStatus status) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> orderFinish");
		
		OrderVO vo = orderService.ordernum(num);
		model.addAttribute("order", vo);
	
		return "order/orderFinish";
	}
	
	//리뷰 작성여부 업데이트
	//리뷰 작성시 review컬럼 1로 업데이트 ajax
	@RequestMapping(value = "/getReview", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public int getReview(@RequestParam("reviewchk1") String reviewchk1, HttpSession session, OrderVO vo) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  진입");
		
		int review = Integer.parseInt(reviewchk1); //ajax에서 1가져오기
		String id = (String) session.getAttribute("id");//세션 id 가져오기
		
		vo.setReview(review);
		vo.setId(id);
		
		orderService.review_update(vo); //review컬럼 1로 업데이트
		logger.info("OrderVO" + vo);
		
		return review;
	}	
}