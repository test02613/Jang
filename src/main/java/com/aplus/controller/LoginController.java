package com.aplus.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aplus.model.MemberVO;
import com.aplus.service.MemberService;



@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;

	//로그인 페이지 진입
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(HttpSession session) {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 로그인 페이지 진입");
		session.invalidate();
		return "member/login";
	}
	
	//로그인 실행
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
			/*vo.getAdmin();*/
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

	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

	//아이디찾기 페이지 진입
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findIdGET() {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 아이디찾기 페이지 진입");
		return "member/findId";
	}
	
	//비밀번호 찾기 페이지 진입
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findPwGET() {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 비밀번호 찾기 페이지 진입");
		return "member/findPw";
	}
	
	//아이디 찾기 실행	
	@RequestMapping(value = "/findIdAction", method = RequestMethod.POST)
	public String findIdAction(HttpServletResponse response, @ModelAttribute  MemberVO vo, Model md)
			throws Exception {
		md.addAttribute("id", memberService.findId(response, vo));
		logger.info("Member55:" + vo);
		return "member/findId";
	}
	
	//임시 비밀번호 이메일로 보내기
	@RequestMapping(value = "/findPwAction", method = RequestMethod.POST)
	public String findPwAction(HttpServletResponse response, @ModelAttribute  MemberVO vo, Model md)
			throws Exception {
		PrintWriter out = response.getWriter();
		ModelAndView mav = new ModelAndView();
		String pw = memberService.findPw(response, vo);
		String email = vo.getEmail();
		String id = vo.getId();
		logger.info("Member55:" + vo);
		
		if(pw == null) {
			/*out.print("등록되지 않은 아이디입니다.");
			out.close();*/
			out.print("<script>alert('\" 보노보노 \"'); history.go(-1);</script>" 
			);
	out.close();
	
		}
		else {
			// 임시 비밀번호 생성
			/*pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setPw(pw);*/
			// 비밀번호 변경
			
			// 비밀번호 변경 메일 발송
			/*mav.setViewName("member/findPw");
			mav.addObject("message", "보노보노");*/

			out.print("<script>alert('\" 이메일로 임시 비밀번호를 발송하였습니다. \"'); history.go(-1);</script>" 
					);
			out.close();
			logger.info("========================== 이메일 데이터 전송 확인 ============================");
			logger.info("인증번호 : [ " + email + " ]");
			
			Random random = new Random();
			int pw1 = random.nextInt(888888) + 111111;
			logger.info("인증번호(checkNum) [ " + pw1 + " ]");
			
			// 이메일 보내기
			String setFrom = "dhkdwk997@gmail.com";
			String toMail = email;
			 String title = "비밀번호 이메일 입니다.";
	         String content = "방문해주셔서 감사합니다." + "<br>"+ id +"님의 임시 비밀번호는 [ " + pw1 + " ]입니다." + "<br>"
	               + "비밀번호를 변경하여 사용하세요.";

			
			try {
				
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true);
				mailSender.send(message);
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			String num = Integer.toString(pw1);
			vo.setPw(num);
			memberService.updatePw(response, vo);
			
			
		}
		/*logger.info("vo"+vo);*/
		return "member/findPwAction";
		
	}
	
	

}