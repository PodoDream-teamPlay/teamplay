
package edu.spring.ex00.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value="/podo")
public class PayController {

	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	

	
	
	// 홈버튼에서 nav - 이용권 클릭시, 
	@RequestMapping(value="/monthpay", method=RequestMethod.GET)
	public void go_month_pay() {
		//월정액 페이지로 이동
		logger.info("month_pay() GET 호출");
	}
	
	
	
	
} //end paycontroller

