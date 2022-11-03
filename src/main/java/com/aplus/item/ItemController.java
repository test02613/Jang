package com.aplus.item;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aplus.cart.CartVO;
import com.aplus.model.MemberVO;
import com.aplus.review.ReviewService;
import com.aplus.review.ReviewVO;

@Controller
public class ItemController {
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@Autowired
	private ItemService itemService;
	@Autowired
	private ReviewService reviewservice;

	// 상품 리스트 페이지 (카테고리-대분류
	@RequestMapping(value = "/itemListL", method = RequestMethod.GET)
	public String itemListL(ItemVO vo, Model model, Integer cat) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 리스트 페이지 진입");

		List<ItemVO> list = itemService.itemListL(cat);
		logger.info("------------------------------글 목록 확인------------------------" + list);
		model.addAttribute("itemlist", list);

		return "item/itemList";
	}

	// 상품 리스트 페이지 (카테고리-중분류)
	@RequestMapping(value = "/itemList", method = RequestMethod.GET)
	public String itemList(Model model, Integer cat) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 리스트 페이지 진입");

		List<ItemVO> list = itemService.itemList(cat);
		logger.info("------------------------------글 목록 확인------------------------------" + list);
		model.addAttribute("itemlist", list);

		return "item/itemList";
	}

	// 상품 목록&상세&리뷰
	@RequestMapping(value = "/itemDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String itemDetail(HttpSession session, Model model, Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 상세 페이지 진입");

		// 세션 아이디 vo에 저장
		String id = (String) session.getAttribute("id");
		model.addAttribute("loginMember", id);

		ItemVO vo = itemService.itemDetail(num);
		model.addAttribute("detail", vo);

		List<ItemAttrVO> list = itemService.itemAttr(num);
		model.addAttribute("list1", list);

		List<ReviewVO> review = itemService.itemreviewlist(num);
		model.addAttribute("review", review);
		return "item/itemDetail";
	}

	// 상품 상세페이지 option 선택 ajax
	@RequestMapping(value = "/itemOp", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String itemOp(ItemAttrVO vo, Model model, @RequestParam("color") String color,
			@RequestParam("num") Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> itemOp ajax진입");

		vo.setItemoption(color);
		vo.setItemnum(num);
		vo = itemService.itemOp(vo);

		Integer cost = vo.getItemcost();
		String to = Integer.toString(cost);

		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> cost" + cost);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> vo" + vo);

		return to;
	}

	// 상품 상세페이지 옵션 선택시 가격 표시 ajax
	@RequestMapping(value = "/itemCode", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String itemCodeGET(ItemAttrVO vo, Model model, @RequestParam("color") String color,
			@RequestParam("num") Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> itemCode ajax진입");
		vo.setItemoption(color);
		vo.setItemnum(num);

		vo = itemService.itemOp(vo);

		Integer cost = vo.getItemcode();
		String to = Integer.toString(cost);

		logger.info("itemCode.cost" + cost);
		logger.info("vo" + vo);

		return to;
	}

}