package com.khrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khrd.domain.Criteria;
import com.khrd.domain.HouseTypeVO;
import com.khrd.domain.PageMaker;
import com.khrd.service.HouseService;

@Controller
@RequestMapping("/ht/*")
public class HouseTypeController {
	private static final Logger logger = LoggerFactory.getLogger(HouseTypeController.class);
	
	@Autowired
	private HouseService hService;
	
	@RequestMapping(value = "htList",method = RequestMethod.GET)
	public void htList(Criteria cri,Model model,HttpSession session){
		String member = (String) session.getAttribute("Auth");
		List<HouseTypeVO> htList = hService.htCri(cri,member);
		System.out.println(htList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(hService.htCount(member));
		System.out.println(pageMaker);
		
		model.addAttribute("htList", htList);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "htRegister",method=RequestMethod.GET)
	public void registGet() {
		logger.info("--------------------rdRegister GET-----------------");
		
	}
	
	@RequestMapping(value = "htRegister",method = RequestMethod.POST)
	public String registPost(HouseTypeVO htVo) {
		logger.info("--------------------rdRegister GET-----------------");
	
		hService.htRegister(htVo);
		
		return "redirect:/ht/htList";
	}
}
