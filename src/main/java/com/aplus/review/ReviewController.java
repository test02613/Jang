package com.aplus.review;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.aplus.controller.MemberController;


@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private ReviewService reviewservice;

}