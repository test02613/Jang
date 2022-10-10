package com.aplus.item;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ItemController {
private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@Autowired
	private ItemService itemService;
	
	// 아이템 페이지 진입
	@RequestMapping(value = "/itemList", method = RequestMethod.GET)
	public String itemList(ItemVO vo, Model model, HttpServletResponse response, Integer cat) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 이벤트 페이지 진입");
		
		List<ItemVO> list = itemService.itemList(cat);
		logger.info("---------------글 목록 확인---------" + list);
		model.addAttribute("itemlist", list);
		
		return "item/itemList";
	}
	
	
}
