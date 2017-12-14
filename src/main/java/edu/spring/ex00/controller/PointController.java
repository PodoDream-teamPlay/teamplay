package edu.spring.ex00.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.spring.ex00.domain.Member;
import edu.spring.ex00.domain.Point;
import edu.spring.ex00.service.MemberService;
import edu.spring.ex00.service.PointService;

@Controller
public class PointController {

	@Autowired
	private PointService pointservice;
	
	@Autowired
	private MemberService memberservice;
	
	// 출석체크 이벤트 했을 때 포인트 10점 올리기.
	@RequestMapping(value="/dailycheck")
	public String dailycheck(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("loginUserid");
		Point registerPoint = null;
		System.out.println("여기로 넘어오는지 보자 : " );
		if (userid!=null) {
		Member m = memberservice.select(userid);
		int point = m.getPoint() + 10;	//출첵 했을 때 10포인트 적립			
		Member member = null;
		member= new Member(userid, m.getPassword(), m.getEmail(), 0,0,0,0,0, m.getMemdate(), point);
		memberservice.update_point(member); //점수를 10점올렸고 
		registerPoint = new Point(0, userid, null);
		System.out.println("아마 여기부터 에러인듯");
		pointservice.insert(registerPoint);
		model.addAttribute("su1", 2);
		System.out.println("들어왔는지 여기도 확인해보자");
		//session.setAttribute("timeout", 5);
		//System.out.println("타임아웃 " + session.getAttribute("timeout"));
		
		} else {
			model.addAttribute("fail", 1);
			System.out.println("로그인 안됨.");
			
			
		}
		
		
		return "podo/event";
			
	}
	
	
}
