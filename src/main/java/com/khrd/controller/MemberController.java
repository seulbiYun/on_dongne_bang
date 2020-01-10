package com.khrd.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khrd.domain.MemberVO;
import com.khrd.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
	//회원 가입 ----------------------------------------------------------------------------------------
	@RequestMapping(value = "register",method=RequestMethod.GET)
	public void memberRegisterGET() {
		logger.info("---------------- register GET ------------------");
		
	}
	
	@RequestMapping(value = "register",method=RequestMethod.POST)
	public void memberRegisterPOST(Model model,MemberVO vo) {
		logger.info("---------------- register POST ------------------");
	}
	
}
