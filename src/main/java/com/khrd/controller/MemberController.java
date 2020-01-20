package com.khrd.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public void memberRegisterGET(Model model) {
		logger.info("---------------- register GET ------------------");
		
		MemberVO dbVO = new MemberVO();
		
		model.addAttribute("dbID", dbVO.getmId());
		
	}
	
	@RequestMapping(value = "register",method=RequestMethod.POST)
	public String memberRegisterPOST(MemberVO vo) {
		logger.info("---------------- register POST ------------------");
		
		service.memberRegister(vo);
		
		
		return "redirect:/member/registerResult?id="+vo.getmId();
		
	}
	
	@RequestMapping(value = "registerResult",method=RequestMethod.GET)
	public void memberRegisterResult(@RequestParam String id, Model model) {
		logger.info("---------------- registerResult GET ------------------");
		logger.info(id);
		
		model.addAttribute("id", id);
	}
	
	// 아이디 중복 확인 ==================================================
	@ResponseBody // ajax용 함수
	@RequestMapping(value = "chek",method = RequestMethod.GET)
	public ResponseEntity<String> useridChek(String mId){
		logger.info("---------------------userId Chek--------------------"+mId);
		ResponseEntity<String> entity = null;
		
		try {
			MemberVO dbVO = service.mIdChek(mId);
			System.out.println(dbVO);
			if(dbVO == null) {
				entity = new ResponseEntity<String>("success",HttpStatus.OK);
			}else if(dbVO != null){
				entity = new ResponseEntity<String>("fail",HttpStatus.OK);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "memberById",method=RequestMethod.GET)
	public void memberRead(String mId,Model model) {
		logger.info("--------------------- memberRead --------------------"+mId);
		
		MemberVO vo = service.memberById(mId);
		
		model.addAttribute("vo", vo);
	}
}
