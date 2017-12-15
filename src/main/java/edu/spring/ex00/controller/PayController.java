
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
public class PayController {

	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired
	private MemberService memberservice;
	
	
	
	// 홈버튼에서 nav - 이용권 클릭시, 
	@RequestMapping(value="/monthpay", method=RequestMethod.GET)
	public String go_month_pay() {
		//월정액 페이지로 이동
		logger.info("month_pay() GET 호출");
		return "podo/monthpay";
		
	}
		
	//결제 창으로 넘기기.
	@RequestMapping(value="/paid", method=RequestMethod.GET)
	public String month_paid(int money, Model model, String userid) {
		System.out.println("money = " + money);
		model.addAttribute("money", money);
		System.out.println("userid = " + userid);
		int remainpoint = memberservice.select_point(userid);
		System.out.println("remainpoint" + remainpoint);
		model.addAttribute("remainpoint", remainpoint);
		return "podo/paid";
		
	}
	
	
	@RequestMapping(value="/paid", method=RequestMethod.POST)
	public String month_paid(int money, HttpSession session, int usingpoint) {
		System.out.println("paid post: money=" + money);
		System.out.println("paid post: usintpoint = " + usingpoint);
		String userid = (String) session.getAttribute("loginUserid");
		Member m = memberservice.select(userid);
		java.util.Date date = new java.util.Date();
		Member member = null;
		int remainpoint = memberservice.select_point(userid) -usingpoint;
		
		if (money==3900) {
		date.setMonth(date.getMonth()+1);
		member = new Member(userid, m.getPassword(), m.getEmail(), 0,0,0,0,0, date,remainpoint);
		memberservice.update_pay(member);
		memberservice.update_point(member);
		
		}
		if (money==7900) {
			date.setMonth(date.getMonth()+2);
			member = new Member(userid, m.getPassword(), m.getEmail(), 0,0,0,0,0, date, remainpoint);
			memberservice.update_pay(member);
			memberservice.update_point(member);
		}
		if (money==9900) {
			date.setMonth(date.getMonth()+3);
			member = new Member(userid, m.getPassword(), m.getEmail(), 0,0,0,0,0, date, remainpoint);
			memberservice.update_pay(member);
			memberservice.update_point(member);
		} if (money==5000) {		
			member = new Member(userid, m.getPassword(), m.getEmail(), 0,0,0,0,0, m.getMemdate(), m.getPoint()+5000);
			memberservice.update_point(member);
		} if (money==10000) {		
			member = new Member(userid, m.getPassword(), m.getEmail(), 0,0,0,0,0, m.getMemdate(), m.getPoint()+10000);
			memberservice.update_point(member);
		} 
		return "podo/paid-result";
	}
	
	
	private void Date() {
		// TODO Auto-generated method stub
		
	}

	//팝업창으로 곡 결제
	@RequestMapping(value="/basket_pay", method=RequestMethod.GET)
	public void basket_pay() {
	}
	
	//팝업창으로 월별 결제 결제
	@RequestMapping(value="/register_giftcard", method=RequestMethod.GET)
	public String paid(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("loginUserid");
		if (userid!=null) {
		Member m = memberservice.select(userid);
		int point = m.getPoint() + 10000;	//상품권 했을 때 10000원 추가 해줌.			
		Member member = null;
		member= new Member(userid, m.getPassword(), m.getEmail(), 0,0,0,0,0, m.getMemdate(), point);
		memberservice.update_point(member);
		model.addAttribute("su1", 2);
		return "/home";
		} else {
			model.addAttribute("fail", 1);
			System.out.println("로그인 안됨.");
			return "podo/monthpay";
		}
	}
	
	
	
	
} //end paycontroller

