
package edu.spring.ex00.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.ex00.domain.Member;
import edu.spring.ex00.domain.Music;
import edu.spring.ex00.domain.Playlist;
import edu.spring.ex00.service.MemberService;
import edu.spring.ex00.service.MusicService;
import edu.spring.ex00.service.PlaylistService;


@Controller
public class MemberController {

	@Autowired
	private MemberService memberservice;
	@Autowired
	private PlaylistService playlistService;
	@Autowired
	private MusicService musicService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	//회원 가입 , 로그인
	@RequestMapping(value="/member-join", method=RequestMethod.POST)
	public String memberJoin(Member member, Model model) {
	
		//아이디 확인 체크. 
		Member checkuser = null;
			checkuser =	memberservice.select(member.getUserid());
		if (checkuser ==null) {
			Member m = new Member(member.getUserid(), member.getPassword(), member.getEmail(),0,0,0,0,0, null, 0 );
			logger.info("member" + member.getUserid() + member.getPassword() + member.getEmail());
			memberservice.insert(m);	
			return "redirect:/";
		} else {
			model.addAttribute("check", 1);
		}
			return "podo/register";
	}
	
	//탈퇴 페이지로 이동
	@RequestMapping(value="/member_withdraw", method=RequestMethod.GET)
	public String showWithdrawPage() {
		return "podo/member_withdraw";
	}
	
	//탈퇴 확인 버튼 - 로그아웃, 탈퇴, 메인페이지로 이동
	@RequestMapping(value="/member_withdraw", method=RequestMethod.POST)
	public String member_withdraw(HttpSession session) {
		
		String userid = (String)session.getAttribute("loginUserid");		
		
		session.invalidate(); // 로그아웃
		int result = memberservice.delete(userid); //탈퇴
		System.out.println(result);
		if(result == 1) {
			return "redirect:/";			
		}else {
			return "redirect:/member_withdraw";
		}
		
	}
	
	//아이디 비밀번호 찾기
	@RequestMapping(value="/iforgotMyId")
	public String forgotMyId() {
		return "podo/iforgotMyId";
	}
	
	//아이디 찾기. 이메일로 확인.
	@RequestMapping(value="/findingId", method=RequestMethod.POST)
	public String findingId(String email, Model model) {
		System.out.println("일단 들어오는지 보고");		
		Member m= null;
		m = memberservice.selectByEmail(email);
		if (m !=null) {
			System.out.println("여까지는");
			String userid =m.getUserid();
			model.addAttribute("userid", userid);
			System.out.println("오는지도 보고" + userid);
		} else {
			model.addAttribute("nothing", 1);
			System.out.println("or here");
		}
		
		return "podo/iforgotMyId";
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
		Member m = new Member(userid, updatePassword, updateEmail,0,0,0,0,0, null, 0 );
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
	public String detailPlaylist(Model model, String userid, int pid) {
		//Playlist : select By pid
		Playlist playlist = playlistService.selectByPid(pid);
		
		//Music : pid 의 mids 분리해서 노래 찾기
		List<Music> musicList = new ArrayList<>();
		
		String mids = playlist.getMids();
		if(mids != null) {
			String[] arrayMids = mids.split(",");
			for(int i = 0; i < arrayMids.length; i++) {
				int mid = Integer.parseInt(arrayMids[i]);
				musicList.add(musicService.select(mid));
			}
		}
		
		model.addAttribute("musicList", musicList);
		model.addAttribute("ptitle", playlist.getPtitle());
		return "podo/playlist_detail_popup";
	}
	
	
	//Member-detail 페이지에서 player 팝업 띄우기 
	@RequestMapping(value="/playlist_popup")
	public String playlist(int mid, Model model) {
		Music music = musicService.select(mid);
		model.addAttribute("music", music);
		return "podo/playlist_popup";
	}
	
	//Member-detail 페이지에서 playlist-player 팝업 띄우기
	@RequestMapping(value="/playlist_player_popup", method=RequestMethod.GET)
	public String playlistPlayer(String mids, Model model) {
		//Music : pid 의 mids 분리해서 노래 찾기
		List<Music> musicList = new ArrayList<>();
				
		if(mids != null) {
			String[] arrayMids = mids.split(",");
			for(int i = 0; i < arrayMids.length; i++) {
				int mid = Integer.parseInt(arrayMids[i]);
				musicList.add(musicService.select(mid));
			}
		}
				
		model.addAttribute("musicList", musicList);
		
		return "podo/playlist_player_popup";
	}
	

	
	
}
