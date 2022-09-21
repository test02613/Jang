package com.aplus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.model.MemberVO;
import com.aplus.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	
		
		@Autowired
		MemberMapper memberMapper;

		@Override
		public void memberJoin(MemberVO member) throws Exception {
			
			memberMapper.memberJoin(member);
		}

		
		
		

	}
