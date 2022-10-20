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
import com.aplus.item.ItemAttrVO;

@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	private ReviewService reviewservice;

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
	public String reviewCreate(Model model, Integer order, Integer item) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 리뷰작성 페이지 진입");

		model.addAttribute("item", item);
		model.addAttribute("order", order);

		return "review/reviewCreate";
	}

	// 리뷰작성 실행
	@RequestMapping(value = "/reviewCreateAction", method = RequestMethod.POST)
	public String reviewCreateAction(Model model, HttpSession session, ReviewVO vo) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 리뷰작성 실행");

		String id = (String) session.getAttribute("id");// 세션 id가져오기
		vo.setId(id);

		reviewservice.reviewCreate(vo);

		return "redirect:/myorder";
	}
}