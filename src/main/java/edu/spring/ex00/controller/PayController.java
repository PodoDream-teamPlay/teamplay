
package edu.spring.ex00.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.ex00.domain.Member;
import edu.spring.ex00.service.MemberService;


@Controller
@RequestMapping(value="/podo")
public class PayController {

	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired
	private MemberService memberservice;
	
	
	
	// 홈버튼에서 nav - 이용권 클릭시, 
	@RequestMapping(value="/monthpay", method=RequestMethod.GET)
	public void go_month_pay() {
		//월정액 페이지로 이동
		logger.info("month_pay() GET 호출");
	}
		
	//결제 창으로 넘기기.
	@RequestMapping(value="/paid", method=RequestMethod.GET)
	public void month_paid(int money, Model model) {
		System.out.println("money = " + money);
		model.addAttribute("money", money);
	}
	
	
	@RequestMapping(value="/paid", method=RequestMethod.POST)
	public String month_paid(int money, HttpSession session) {
		System.out.println("paid post: money=" + money);
		
		String userid = (String) session.getAttribute("loginUserid");
		Member m = memberservice.select(userid);
		java.util.Date date = new java.util.Date();
		Member member = null;
		
		if (money==3900) {
		date.setMonth(date.getMonth()+1);
		member = new Member(userid, m.getPassword(), m.getEmail(), 0,0,0,0,0, date);
		memberservice.update_pay(member);
		}
		if (money==7900) {
			date.setMonth(date.getMonth()+2);
			member = new Member(userid, m.getPassword(), m.getEmail(), 0,0,0,0,0, date);
			memberservice.update_pay(member);
		}
		if (money==9900) {
			date.setMonth(date.getMonth()+3);
			member = new Member(userid, m.getPassword(), m.getEmail(), 0,0,0,0,0, date);
			memberservice.update_pay(member);
		} 
		return "redirect:/podo/paid";
	}
	
	
	private void Date() {
		// TODO Auto-generated method stub
		
	}

	//팝업창으로 곡 결제
	@RequestMapping(value="/basket_pay", method=RequestMethod.GET)
	public void basket_pay() {
	}
	
	//팝업창으로 월별 결제 결제
	/*@RequestMapping(value="/paid", method=RequestMethod.GET)
	public void paid() {
	}*/
	
	
	
	
} //end paycontroller

