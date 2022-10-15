package com.aplus.event;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aplus.controller.MemberController;
import com.aplus.service.MemberService;
@Controller
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private EventDAO eventdao;
	@Autowired
	private EventService eventService;
	
	//이벤트 페이지 진입 (글 목록)
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String eventGET(EventVO vo, Model model) throws Exception {
		
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 이벤트 페이지 진입");
		
		logger.info("---------------글 목록 확인---------"+vo);
		model.addAttribute("list", eventService.list());
		return "event/event";
	}

	//이벤트 글 작성 페이지 진입
	@RequestMapping(value = "/eventCreate", method = RequestMethod.GET)
	public String eventCreate() {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 이벤트 글 작성 페이지 진입");
		return "event/eventCreate";
	}
	
	//상세페이지 진입
	@RequestMapping(value = "/eventDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String eventDetailGET(Integer num, Model model) throws Exception {
		
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 디테일 진입");
		
		EventVO vo = eventService.eventDetail(num);
		 model.addAttribute("detail", vo);
		 logger.info("vo"+vo);
		return "event/eventDetail";
	}
	
	//이벤트 글 작성 실행
	@RequestMapping(value = "/eventCreateAction", method = RequestMethod.POST)
	public String eventCreateAction(EventVO event) throws Exception {
		
		logger.info("이벤트 글 작성 페이지 진입"+event);
		eventService.EventCreate(event);

		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 이벤트 글 작성 페이지 진입"+event);

		return "redirect:/event";
	} 
	
	// 글 수정 페이지 진입
	@RequestMapping(value ="/eventUpdate", method = RequestMethod.GET)
	public String eventUpdate(Integer num, Model model) throws Exception {
		
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 이벤트 글 수정 페이지  진입");	
		
		EventVO vo = eventService.eventDetail(num);
		 model.addAttribute("detail", vo);
		 
		return "event/eventCreate";
	}
	
	// 글 수정 실행
	@RequestMapping(value ="/eventUpdateAction", method = RequestMethod.POST)
	public String eventUpdateAction(EventVO vo, Integer num, Model model) throws Exception {
		
		eventService.eventDetail(num);
		vo.setEventnum(num);
		
		eventService.eventUpdate(vo);

		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 이벤트 글 수정 실행");
		
		return "redirect:/eventDetail?num="+num;
	}
	
	//글 삭제 실행
	@RequestMapping(value ="/eventDeleteAction", method = RequestMethod.GET)
	public String eventDeleteAction(Integer num, Model model) throws Exception {

		eventService.eventDelete(num);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 이벤트 글 삭제 실행");
		
		return "redirect:/event";
	}
}
