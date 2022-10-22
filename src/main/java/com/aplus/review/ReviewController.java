package com.aplus.review;

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

import com.aplus.controller.MemberController;
import com.aplus.event.EventVO;
import com.aplus.item.ItemAttrVO;
import com.aplus.order.OrderService;
import com.aplus.order.OrderVO;

@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	private ReviewService reviewservice;
	
	@Autowired
	private OrderService orderservice;

	// 로그인 회원 리뷰 목록 페이지
	@RequestMapping(value = "/myreview", method = { RequestMethod.GET, RequestMethod.POST })
	public String myreviewGET(ReviewVO vo, Model model, HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 리뷰관리 페이지 진입");

		String id = (String) session.getAttribute("id");// 세션 id가져오기
		vo.setId(id); // ReviewVO에 로그인 정보 저장

		model.addAttribute("myreview", reviewservice.reviewList(id));

		return "my/myReview";
	}

	// 리뷰작성 페이지
	@RequestMapping(value = "/reviewCreate", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewCreateGET(Model model, Integer order, Integer item) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 리뷰작성 페이지 진입");

		model.addAttribute("item", item);
		model.addAttribute("order", order);

		return "review/reviewCreate";
	}

	// 리뷰작성 실행
	@RequestMapping(value = "/reviewCreateAction", method = RequestMethod.POST)
	public String reviewCreateAction(Model model, HttpSession session, ReviewVO vo, Integer order) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 리뷰작성 실행");

		String id = (String) session.getAttribute("id");// 세션 id가져오기
		vo.setId(id);
		//order = 1;
		model.addAttribute("order", order);
		reviewservice.reviewCreate(vo);

		return "redirect:/myorder";
	}

	//리뷰 작성시 리뷰 컬럼 1로 변경 ajax
	@RequestMapping(value = "/reviewUp", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void reviewUp(OrderVO vo, Model model, @RequestParam("num") String num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  진입");
		
		Integer ordernum =Integer.parseInt(num);
		vo.setOrdernum(ordernum);
		reviewservice.review_up(vo);

	}

	//상세페이지 진입
	@RequestMapping(value = "/reviewDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewDetailGET(Integer num, Model model) throws Exception {

		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 리뷰 상세페이지 진입");

		ReviewVO vo = reviewservice.reviewDetail(num); //ordernum으로 리뷰 가져옴
		model.addAttribute("detail", vo);
		logger.info("vo" + vo);
		return "review/reviewDetail";
	}
	
	//리뷰 수정 페이지
	@RequestMapping(value = "/reviewUpdate", method = RequestMethod.GET)
	public String reviewUpdateGET(ReviewVO vo,Model model,HttpSession session,Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 리뷰작성 페이지 진입");
		
		vo.setReviewnum(num);
		vo = reviewservice.reviewnum(vo);
		model.addAttribute("list", vo);
		
		return "review/reviewCreate";
	}
	
	//리뷰 수정 실행
	@RequestMapping(value = "/reviewUpdateAction", method = RequestMethod.POST)
	public String reviewUpdateAction(ReviewVO vo, Model model, HttpSession session, Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 리뷰작성 페이지 진입");
		
		vo.setReviewnum(num);
		vo = reviewservice.reviewUpdate(vo);
		model.addAttribute("list", vo);
		
		return "redirect:/myreview";
	}
	
	//리뷰 삭제
	@RequestMapping(value = "/reviewDeleteAction", method = RequestMethod.GET)
	public String reviewDeleteAction(ReviewVO vo,Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 리뷰작성 페이지 진입");
		
		reviewservice.reviewDelete(num);
		
		return "redirect:/myreview";
	}
}