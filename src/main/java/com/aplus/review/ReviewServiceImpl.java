package com.aplus.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired ReviewDAO dao;
}