package com.khrd.controller;

import javax.servlet.http.HttpSession;

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
@RequestMapping("/auth/*")
public class AuthController {
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "login",method=RequestMethod.GET)
	public void loginGet() {
		logger.info("----------------------------- login GET ------------------------");
	}
	
	@RequestMapping(value = "loginPost",method=RequestMethod.POST)
	public void loginPost(MemberVO vo,Model model) {
		logger.info("----------------------------- login POST ------------------------");
		MemberVO dbVO = service.selectByIdAndPass(vo);
		
		if(dbVO == null) { //일치하는 회원 없음
			logger.info("---------------------- loginPOST not user ----------------------");
			model.addAttribute("noId", "true");
			return;
		}
		model.addAttribute("login", dbVO.getmId());
	}
	
	@RequestMapping(value = "logout",method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("-------------------- logout --------------------");
		session.invalidate();
		
		return "redirect:/";
	}
}
