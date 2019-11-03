package com.zerock.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.MemberVO;
import com.zerock.service.MemberService;


@Controller
@RequestMapping("/membership")
public class MembershipController {


	@Inject 
	private MemberService service;

	private static final Logger logger= LoggerFactory.getLogger(MembershipController.class);
	
	public static final String ZIPCODE_API_KEY = "401652aa7e13e7fa31534997356246";

    public static final String ZIPCODE_API_URL = "http://biz.epost.go.kr/KpostPortal/openapi";
	
	@RequestMapping(value="/member",method=RequestMethod.GET)
	public String membership(Model model) {

		
		return "membership";
	}
	@RequestMapping(value="/member",method=RequestMethod.POST)
	public String memberShip(MemberVO member, RedirectAttributes rttr,Model model) throws Exception
	{
		logger.info(member.toString());
		service.create(member);
		rttr.addFlashAttribute("authmsg","���� �� ����� �̸����� �������ּ���");
		String name=member.getName();
		model.addAttribute("name",name);

		return "welcome";
		
	}
		
	@RequestMapping(value="/checkId",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int idCheck(MemberVO member,Model model) throws Exception {
		return service.check(member);
	}
	
	@RequestMapping(value="/",method=RequestMethod.GET)
		public String Login() {
			return "Login";
		}
	@RequestMapping(value="/checkLogin",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int CheckLogin(MemberVO member,Model model,HttpSession session) throws Exception{
		int check =service.checkLogin(member);
		String name=null;

		name = service.getNaming(member);
		session.setAttribute("id", member.getId());
		session.setAttribute("name", name);
		
		return check;
}
	@RequestMapping(value="/welcome3",method=RequestMethod.GET)
	public String welcome() {
		return "welcome3";
	}
	


	}

//** ���ϰ�� // * 1���� ���