package com.aplus.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//이벤트 페이지 진입
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String eventGET() {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 이벤트 페이지 진입");
		return "board/event";
	}

}
