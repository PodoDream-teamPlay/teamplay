
package edu.spring.ex00.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.ex00.domain.Member;
import edu.spring.ex00.service.MemberService;


@Controller
public class MemberController {

	@Autowired
	private MemberService memberservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value="/member-join", method=RequestMethod.POST)
	public String memberJoin(Member member) {
	
		//DB에 insert
		int result = 1;
		Member m = new Member(member.getUserid(), member.getPassword(), member.getEmail(),0,0,0,0,0, null );
		
		logger.info("member" + member.getUserid() + member.getPassword() + member.getEmail());
		memberservice.insert(m);
		if(result != 0) {
			logger.info("memberJoin 에 if");
			return "home";
		}else {
			logger.info("memberJoin 에 else");
			return "podo/register";
		}
	}
	
}
