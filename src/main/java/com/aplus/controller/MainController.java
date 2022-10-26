package com.aplus.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	/* 홈 진입 */
	@RequestMapping("/")
	public String homeGet() {

		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>home 진입");
		return "redirect:/main";

	}

	/* 메인 페이지 진입 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPageGet() {

		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>mainPage 진입");
		return "main/main";
	}
}
