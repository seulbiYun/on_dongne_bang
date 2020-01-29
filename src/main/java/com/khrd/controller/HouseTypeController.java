package com.khrd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		model.addAttribute("htList", htList);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@ResponseBody
	@RequestMapping(value = "htListajax/{mId}",method = RequestMethod.GET)
	public Map<String,Object> htListajax(@PathVariable("mId") String mId,Criteria cri){
		//Criteria cri = new Criteria();
		List<HouseTypeVO> htList = hService.htCri(cri,mId);
			
		System.out.println(htList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(hService.htCount(mId));
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("htList", htList);
		map.put("pageMaker", pageMaker);
		
		return map;
	}
	
	@RequestMapping(value = "htListInclude",method = RequestMethod.GET)
	public void htListInclude(Criteria cri,Model model,HttpSession session){
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
		logger.info("--------------------rdRegister POST-----------------");
	
		hService.htRegister(htVo);
		
		return "redirect:/ht/htList";
	}
	
	@RequestMapping(value = "htRead",method=RequestMethod.GET)
	public void htRead(int hNo,Model model) {
		logger.info("--------------------htRead GET-----------------");
		 HouseTypeVO vo = hService.selectByHNo(hNo);
		 
		 model.addAttribute("vo", vo);
	}
}
