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

import com.aplus.model.MemberVO;

@Controller
public class ItemController {
private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@Autowired
	private ItemService itemService;
	
	//상품 리스트 페이지 (카테고리-대분류)
	@RequestMapping(value = "/itemListL", method = RequestMethod.GET)
	public String itemListL(ItemVO vo, Model model, HttpServletResponse response, Integer cat) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 리스트 페이지 진입");
		
		List<ItemVO> list = itemService.itemListL(cat);
		logger.info("---------------글 목록 확인---------" + list);
		model.addAttribute("itemlist", list);
		
		return "item/itemList";
	}
	
	//상품 리스트 페이지 (카테고리-중분류)
	@RequestMapping(value = "/itemList", method = RequestMethod.GET)
	public String itemList(ItemVO vo, Model model, HttpServletResponse response, Integer cat) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 리스트 페이지 진입");
		
		List<ItemVO> list = itemService.itemList(cat);
		logger.info("---------------글 목록 확인---------" + list);
		model.addAttribute("itemlist", list);
		
		return "item/itemList";
	}
	
	//상품 상세페이지
	@RequestMapping(value = "/itemDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String itemDetail(Model model, Integer num, HttpServletResponse response) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 상세 페이지 진입");
		
		ItemVO vo = itemService.itemDetail(num);
		model.addAttribute("detail", vo);
		
		List<ItemAttrVO> list = itemService.itemAttr(num);
		model.addAttribute("list1", list);
	
		return "item/itemDetail";
	}
	
	//상품 상세페이지 option ajax
	@RequestMapping(value = "/itemOp", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String itemOp(ItemAttrVO vo, Model model,@RequestParam("color") String color , @RequestParam("num") Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  진입");
		vo.setItemcolor(color);
		vo.setItemnum(num);
		
		/*List<ItemAttrVO> list = itemservice.colorChk(vo);*/
		vo = itemService.itemOp(vo);
		
		Integer cost = vo.getItemcost();
		Integer code = vo.getItemcode();
		String to = Integer.toString(cost);
		String tt = Integer.toString(code);
		
		logger.info("itemOp.cost"+cost);
		logger.info("vo"+vo);
		
		return to;
	}
	
	
	//상품 상세페이지 옵션 선택시 가격 표시 ajax
	@RequestMapping(value = "/itemCode", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String itemCodeGET(ItemAttrVO vo, Model model,@RequestParam("color") String color , @RequestParam("num") Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  진입");
		vo.setItemcolor(color);
		vo.setItemnum(num);
		
		/*List<ItemAttrVO> list = itemservice.colorChk(vo);*/
		vo = itemService.itemOp(vo);
		
		Integer cost = vo.getItemcode();
		String to = Integer.toString(cost);
		
		logger.info("itemCode.cost"+cost);
		logger.info("vo"+vo);
		
		return to;
	}
	
	
	
	//상품 상세페이지에서 장바구니 추가
	@RequestMapping(value = "/insertCartAction", method = RequestMethod.POST)
	public String insertCart(Model model, Integer code, HttpSession session, MemberVO mem) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 주문 페이지 진입");
		
		ItemAttrVO vo =itemService.insert_cart(code);//item 정보 가져오기
		model.addAttribute("item",vo);
		
		String id = (String) session.getAttribute("id");//세션 id가져오기
		mem=itemService.member(id);//고객 정보 가져오기
		model.addAttribute("member", mem);
		
		return "cart/cart";
		
	}	

}