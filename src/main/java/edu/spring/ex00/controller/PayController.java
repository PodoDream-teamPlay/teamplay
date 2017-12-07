package edu.spring.ex00.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {

	@RequestMapping(value="monthly_pay")
	public String monthly_pay() {
		return "/podo/month_pay";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} //end paycontroller
