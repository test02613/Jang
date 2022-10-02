package com.aplus.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aplus.model.MemberVO;
import com.aplus.service.MemberService;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 로그인 페이지 진입");
		return "member/login";
	}

	@RequestMapping(value = "/loginAction", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loginAction(@ModelAttribute MemberVO vo, HttpSession session) throws Exception {
		logger.info("MemberVO:" + vo);
		String name = memberService.loginAction(vo, session);
		logger.info("MemberVO2:" + vo);
		logger.info("sessions:" + session);
		logger.info("Name1:" + name);
		ModelAndView mav = new ModelAndView();
		if (name != null) { // 로그인 성공 시
			int admin = memberService.loginAction_admin(vo);
			vo.setAdmin(admin);
			mav.setViewName("main/main"); // 뷰의 이름
			session.setAttribute("admin", vo.getAdmin());

		} else { // 로그인 실패 시
			mav.setViewName("member/login");
			mav.addObject("message", "보노보노");
		}
		logger.info("Name:" + name);
		logger.info("vo:" + vo);
		/* logger.info("admin:"+admin); */

		return mav;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findIdGET() {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 아이디찾기 페이지 진입");
		return "member/findId";
	}

	// 아이디 찾기
	/*
	 * @RequestMapping(value = "/findIdAction", method =
	 * {RequestMethod.GET,RequestMethod.POST}) public String
	 * findId(HttpServletResponse response, String memberMail) throws Exception {
	 * response.setContentType("text/html;charset=utf-8"); PrintWriter out =
	 * response.getWriter(); String id = memberService.findId(response, memberMail);
	 * 
	 * if (id == null) { out.println("<script>");
	 * out.println("alert('가입된 아이디가 없습니다.');"); out.println("history.go(-1);");
	 * out.println("</script>"); out.close(); return null; } else { return id; } }
	 */

	/*@RequestMapping(value = "/findid", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") MemberVO vo, Model md)
			throws Exception {
		md.addAttribute("id", memberService.findId(response, vo));
		return "member/Idr";
	}*/
	@RequestMapping(value = "/findIdAction", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findIdAction(@ModelAttribute MemberVO vo, HttpServletResponse response) throws Exception {
		logger.info("MemberVO:" + vo);
		String name = memberService.findId(response, vo);
		logger.info("MemberVO2:" + vo);
		logger.info("sessions:" + response);
		logger.info("Name1:" + name);
		ModelAndView mav = new ModelAndView();
		if (name != null) { // 로그인 성공 시
			String id = memberService.findId(response, vo);
			vo.setId(id);
			mav.setViewName("member/Idr"); // 뷰의 이름
			/*session.setAttribute("admin", vo.getAdmin());*/

		} else { // 로그인 실패 시
			mav.setViewName("member/findId");
			mav.addObject("message", "보노보노");
		}
		logger.info("Name:" + name);
		logger.info("vo:" + vo);
		/* logger.info("admin:"+admin); */

		return mav;
	}

}
