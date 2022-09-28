package com.aplus.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.model.MemberVO;

import com.aplus.dao.MemberDAO;
import com.aplus.model.MemberVO;

import com.aplus.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	/*@Autowired
	MemberMapper memberMapper;*/
	@Autowired MemberDAO dao;

	@Override
	public void memberJoin(MemberVO member) throws Exception {

		dao.memberJoin(member);
	}

	@Override
	public int idCheck(String memberId) throws Exception {
		return dao.idCheck(memberId);
	}

	@Override
	public String loginAction(MemberVO vo, HttpSession session) throws Exception {
		String name = dao.loginAction(vo);
		 if (name != null) { // 세션 변수 저장
		  session.setAttribute("userid", vo.getMemberId());
		  session.setAttribute("name", name);
		}
		 return name; 
		}
}


