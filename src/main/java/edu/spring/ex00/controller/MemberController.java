package edu.spring.ex00.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.ex00.domain.Member;

@Controller
public class MemberController {

	@RequestMapping(value="/member-join", method=RequestMethod.POST)
	public String memberJoin(Member member) {
		//DB에 insert
		int result = 1;
		
		if(result != 0) {
			
			return "home";
		}else {
			
			return "podo/register";
		}
	}
	
}
