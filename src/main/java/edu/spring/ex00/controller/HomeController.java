

package edu.spring.ex00.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.ex00.domain.Get;
import edu.spring.ex00.domain.Member;
import edu.spring.ex00.domain.Music;
import edu.spring.ex00.domain.Playlist;
import edu.spring.ex00.service.GetService;
import edu.spring.ex00.service.MemberService;
import edu.spring.ex00.service.MusicService;
import edu.spring.ex00.service.PlaylistService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private GetService getService;
	@Autowired
	private MusicService musicService;
	@Autowired
	private PlaylistService playlistService;
	@Autowired
	private MemberService memberservice;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		//메인페이지로 이동
		
		//최신곡 8개
		List<Music> musicList = musicService.getNewAlbums();
		
		model.addAttribute("musicList", musicList);
		
		
		
		return "home";
	}
	
	@RequestMapping(value="/login-post", method=RequestMethod.POST)
	public String login_post(String userid, String password, HttpSession session, Model model) {
		//TODO : 로그인 버튼 눌렀을때 처리하는 메소드
	System.out.println("userid : " + userid + "password : " + password);
	Member checkuser = null;
	checkuser =	memberservice.select(userid);
	if (checkuser!=null && password.equals(checkuser.getPassword())) {
		session.setAttribute("loginUserid", userid);
		return "redirect:/"; 
		
	} else {
		model.addAttribute("loginfail", 5);
		return "home";
	}
	
	
	} //end login_post()
	
	@RequestMapping(value="logout" , method=RequestMethod.GET)
	public String log_out(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String go_register() {
		//회원가입 페이지로 이동
		return "podo/register";
	}

	
	
	@RequestMapping(value="/member_detail", method=RequestMethod.GET)
	public String go_mypage(Model model/*,String userid*/,HttpSession session) {
		//로그인된 사용자의 아이디 정보를 가지고 가야해서 userid 파라미터로 넘김
		String userid = (String) session.getAttribute("loginUserid");
		List<Music> mp3List = getMp3List(userid);
		List<Playlist> playList = getPlaylist(userid);
		
		//사용자의 포인트 정보
		int point = memberservice.select_point(userid);
		
		model.addAttribute("point", point);
		model.addAttribute("userid", userid);
		model.addAttribute("mp3List", mp3List);
		model.addAttribute("playList", playList);
		// ==============================================
		

		return "podo/member_detail"/* + "/userid="+userid*/;
	}
	
	
	public List<Music> getMp3List(String userid){
		List<Get> list = getService.selectByUserid(userid);
		List<Music> mp3List = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			Music mp3 = musicService.select(list.get(i).getMid());
			mp3List.add(mp3);
		}
		return mp3List;
	}
	
	public List<Playlist> getPlaylist(String userid){
		List<Playlist> playList = playlistService.selectByUserid(userid);
		return playList;
	}
	
	// ★ 검색어 입력 후 '검색'버튼 클릭했을 때 
		@RequestMapping(value="/search", method= RequestMethod.GET)
		public String musicSearch(int searchType, String searchKeyword, Model model) {
			logger.info("search() GET 호출");
		
			logger.info("type: {}, keyword: {}", searchType, searchKeyword);
			
			List<Music> list = musicService.search(searchType, searchKeyword);	
			model.addAttribute("musicList", list);
			
			return "podo/search_result";
		}
	
		//이벤트 페이지로 이동
		@RequestMapping(value="/event", method=RequestMethod.GET)
		public String go_event() {
			logger.info("event() GET 호출");
			return "podo/event";
			
		}
		
		//Q&A 페이지로 이동
		@RequestMapping(value="/boardQnA", method=RequestMethod.GET)
		public String go_QnA() {
		logger.info("QnA() GET 호출");
		return "podo/boardQnA";
					
	}
		
		
		
		//최신앨범 발매일순으로 8개 불러오기 
		@RequestMapping(value="/")
		public String NewAlbum(Model model, Timestamp date) {
			
				return "podo/music_detail";
		}
		
		
		
		
		
		
	
	
	
}