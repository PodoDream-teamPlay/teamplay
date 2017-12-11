
package edu.spring.ex00.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.ex00.domain.Member;
import edu.spring.ex00.service.MemberService;


@Controller
public class MemberController {

	@Autowired
	private MemberService memberservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	//회원 가입 , 로그인
	@RequestMapping(value="/member-join", method=RequestMethod.POST)
	public String memberJoin(Member member, Model model) {
	
		//아이디 확인 체크. 
		Member checkuser = null;
			checkuser =	memberservice.select(member.getUserid());
		if (checkuser ==null) {
			Member m = new Member(member.getUserid(), member.getPassword(), member.getEmail(),0,0,0,0,0, null );
			
			logger.info("member" + member.getUserid() + member.getPassword() + member.getEmail());
			memberservice.insert(m);
			return "redirect:/";
		} else {
			model.addAttribute("check", 1);
			
		}
			return "podo/register";
	}
	
	@RequestMapping(value="/member-update")
	public String memberUpdate() {
		return "/podo/update";
	}
	
	@RequestMapping(value="/member-update", method = RequestMethod.POST)
	public String memberUpdate(String userid, String updatePassword, String updateEmail) {
		System.out.println("아이디가 이게 맞을란가" +userid);
		System.out.println("비밀번호는 ?? " + updatePassword);
		System.out.println("이멜" + updateEmail);
		Member m = new Member(userid, updatePassword, updateEmail,0,0,0,0,0, null );
		System.out.println(m);
		memberservice.update(m);
		System.out.println("아 왜 안되나.");
		return "redirect:/";
	}
	
	
	//playlist 페이지에서 팝업 띄우기
	@RequestMapping(value="/insert_playlist_popup")
	public String insertpTitle() {
		return "podo/insert_playlist_popup";
	}
	
	@RequestMapping(value="/playlist_detail_popup")
	public String detailPlaylist() {
		return "podo/playlist_detail_popup";
	}
	
	
	
	
}
