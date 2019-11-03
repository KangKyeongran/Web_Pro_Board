package com.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.BoardVO;
import com.zerock.domain.PageMaker;
import com.zerock.domain.SearchCriteria;
import com.zerock.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	//commit
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject 
	private BoardService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String Login(Locale locale, Model model) {
		
		return "Login";
	}
	
	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public String Logout(Locale locale, Model model) {
		
		return "Logout";
	}
	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "register";
	}
	
	
	@RequestMapping(value="/register" , method=RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr)
			throws Exception{
		logger.info("regist post ......");
		logger.info(board.toString());
		
		service.regist(board);
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/review";
	}
	
	@RequestMapping(value="/review",method=RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception{
		logger.info(cri.toString());
		System.out.println("����������22");

		model.addAttribute("list2",service.listSearchCriteria(cri));
		
		System.out.println("����������");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
		return "review";
	}
	
	@RequestMapping(value="/readPage",method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @RequestParam("id") String id,
			@ModelAttribute("cri") SearchCriteria cri, Model model)
		throws Exception{
		System.out.println(id);
		Map<String,Object> map = new HashMap<>();
		map.put("bno",bno);
		map.put("id",id);
		model.addAttribute(service.read(map));
	}
	
	@RequestMapping(value="/removePage",method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno,
			SearchCriteria cri,
			RedirectAttributes rttr) throws Exception{
		
		service.remove(bno);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/review";
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.GET)
	public String modifyPagingGET(int bno,
			@ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception
	{
		Map<String,Object> map = new HashMap<>();
		map.put("bno",bno);
		model.addAttribute(service.read(map));
		
		return "modifyPage";
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board,
			SearchCriteria cri,
			RedirectAttributes rttr) throws Exception{
		
		logger.info(cri.toString());
		service.modify(board);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/review";
	}
	
	@RequestMapping("/getAttach/{bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("bno") Integer bno)throws Exception{
	return service.getAttach(bno);
}
	
}
