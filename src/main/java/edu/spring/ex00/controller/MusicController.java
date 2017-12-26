package edu.spring.ex00.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Service.Mode;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.ex00.domain.Get;
import edu.spring.ex00.domain.Music;
import edu.spring.ex00.domain.Playlist;
import edu.spring.ex00.pagination.PageNumberMaker;
import edu.spring.ex00.pagination.PaginationCriteria;
import edu.spring.ex00.service.GetService;
import edu.spring.ex00.service.MemberService;
import edu.spring.ex00.service.MusicService;
import edu.spring.ex00.service.PlaylistService;

@Controller
public class MusicController {

	// 로그 출력 기능
	private static final Logger logger = 
			LoggerFactory.getLogger(MusicController.class);
	
	// 멤버 변수 (DI) 
	@Autowired private MusicService musicService;
	@Autowired private GetService getService;
	@Autowired private MemberService memberService;
	@Autowired private PlaylistService playlistService;
	
	// 홈(main)에서 '차트'를 클릭했을 때 
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String musicChart(HttpSession session, Model model, Integer page, Integer perPage) {
		
		PaginationCriteria c = new PaginationCriteria();
		if(page != null) {c.setPage(page);}
		if(perPage != null) {c.setNumsPerPage(perPage);}
		
		logger.info("chart() GET 호출");
		// 차트 정렬 - 클라이언트에 전체 보여주기 
		List<Music> list = musicService.selectAll(100);
		model.addAttribute("music", list);
		String userid =(String) session.getAttribute("loginUserid");
		if(userid != null) {
			//pagination
			PageNumberMaker pmaker = new PageNumberMaker();
			pmaker.setCriteria(c);
			pmaker.setTotalCount(playlistService.getTotal(userid));
			pmaker.setPageMakerData();			
			model.addAttribute("ppageMaker", pmaker);
		}
		
		// 그래프 x축 값 -> count(xList)
		List<Music> graCount = musicService.selectAll(3);
		List<Integer> gracon = new ArrayList<>();
		for (int i = 0; i < graCount.size(); i++) {
			gracon.add(graCount.get(i).getMcount());
		}
		model.addAttribute("getcon", gracon.get(0));
		model.addAttribute("getcon1", gracon.get(1));
		model.addAttribute("getcon2", gracon.get(2));
		model.addAttribute("getconSize", gracon.get(0) + 5);

		// 그래프 y축 값 -> 노래 제목 (gra)
		List<Music> graTitle = musicService.selectAll(3);
		List<String> gra = new ArrayList<>();
		for (int i = 0; i < graTitle.size(); i++) {
			gra.add(graTitle.get(i).getMtitle());
		}
		model.addAttribute("gra", gra.get(0));
		model.addAttribute("gra1", gra.get(1));
		model.addAttribute("gra2", gra.get(2));
		
		return "podo/chart";
	}
	
	
	// 검색어 입력 후 '검색'버튼 -> 검색결과 
	@RequestMapping(value="/search_result", method= RequestMethod.GET)
	public String musicSearch(int searchType, String searchKeyword, Model model) {
		logger.info("search_result() GET 호출");
		logger.info("type: {}, keyword: {}", searchType, searchKeyword);
		
		List<Music> list = musicService.search(searchType, searchKeyword);	

		model.addAttribute("topnavTitle", searchKeyword);		
		model.addAttribute("musicList", list);
		return "podo/search_result";
		
	}


	// mp3다운 버튼을 클릭했을 떄 결제창 팝업 띄우기 
	@RequestMapping(value="/mp3_down", method = RequestMethod.POST)
	public String checkbox(HttpServletRequest reqest, int[] cb_choose, HttpSession session, 
			RedirectAttributes attribute) {
		int money = 0;
		String userid = (String) session.getAttribute("loginUserid");
		if(userid != null && cb_choose != null) {
			List<Get> glist = new ArrayList<>();
			List<Get> list = getService.selectByUserid(userid);
			//중복체크
			if(list.size() > 0) {
				for(int i = 0; i < cb_choose.length; i++) {
					int mid = 0;
					for(int j = 0; j < list.size(); j ++) {
						if(cb_choose[i] == list.get(j).getMid()) {
							mid = 0;
							break;
						}
						mid = cb_choose[i];
					}
					
					if(mid != 0) {
						Get gg = new Get(0, userid, mid, 700, null);
						glist.add(gg);
					}
				}
			}else { //갖고있는 노래가 없을때 : list.size <= 0
				for(int mid : cb_choose) {
					Get gg = new Get(0, userid, mid, 700, null);
					glist.add(gg);
				}
			}
			
			logger.info("glist.size() : " + glist.size());
			logger.info("glist" + glist.toString()  );						
			attribute.addFlashAttribute("money", glist.size()*700);
			attribute.addFlashAttribute("userid", userid);
			session.setAttribute("glist", glist);

			logger.info("money = " + glist.size()*700);
			
			
		}else {
			//로그인 안했으니까 해야됨을 알림
			logger.info("로그인이 안됨");
		}
		
		//다운로드 완료 alert 창 넘기기 - 노태기님께 문의
		return "redirect:/chart";
	}
	
	
	// @@@@@@@@ mp3 다운 아이콘 클릭 시 실행 @@@@@@@@@@@
	@RequestMapping(value="/mp3_down_icon", method = RequestMethod.GET)
	public String mp3_down_icon(int mid, HttpSession session) {
		logger.info("mp3_down_icon");
		String userid = (String) session.getAttribute("loginUserid");
		if (userid != null) {
			List<Get> glist = new ArrayList<>();
			List<Get> list = getService.selectByUserid(userid);
			logger.info("mp3_down_icon 의 mid ::: " + mid);
			// 중복체크
			if(list.size() > 0) {
				for(int j = 0; j < list.size(); j ++) {
					if(mid == list.get(j).getMid()) {
						mid = 0;
						break;
					}
				}
				if(mid != 0) {
					Get gg = new Get(0, userid, mid, 700, null);
					glist.add(gg);
				}
			} else {
				// 같은 mid 값을 가지고 있지 않을 떄
				Get gg = new Get(0, userid, mid, 700, null);
				glist.add(gg);
			}
			
			logger.info("glist.size() : " + glist.size());
			
			//새 리스트를 db에 저장
			int result = 0;
			for(Get gg : glist) {
				result = getService.insert(gg);
				if(result == 1) { //insert 성공했으면
					//mcount update 로 증가
					musicService.update_mcount(gg.getMid());
					System.out.println("mcount 증가");
					//member 장르별 count 증가
					String mgenre = musicService.selectMgenre(gg.getMid());
					memberService.update_genre_count(mgenre, userid);
				}
			}
			
		} else {
			// 로그인을 하지 않은 상태
			logger.info("로그인이 안됨");
		}
		return "redirect:/chart";
	}
	
	//music detail 페이지 넘기는 메소드
	@RequestMapping(value="/music_detail", method = RequestMethod.GET)
	public String musicDetail(int mid, Model model) {
		Music music = musicService.select(mid);
		model.addAttribute("music", music);
		return "podo/music_detail";
	}
	
	
	// 플레이리스트담기 버튼 -> 새앨범명 입력 후 '확인' 했을 때 
	@RequestMapping(value="/chart-playlist", method=RequestMethod.GET)
	public String cartList() {
			
		return "redirect:/chart";
	}
	
	
	// ★ 마이 앨범에 담기 눌렀을 때 -> playlist DB에 추가하는 업데이트 기능
	@RequestMapping(value="/my_playlist", method = RequestMethod.POST)
	public String playList(String pid, int[] cb_choose, HttpSession session) {
		
		String userid = (String) session.getAttribute("loginUserid");
		String mids = "";
		int result = 0;
		for(int cb : cb_choose) {
			mids = cb + ",";
			result = musicService.update_playlist(Integer.parseInt(pid), mids);
		}
		
		if(result == 1) {
			for(int mid : cb_choose) {
				//count수 올리기 
				musicService.update_mcount(mid);
				System.out.println("mcount 증가");
				//member 장르별 count 증가
				String mgenre = musicService.selectMgenre(mid);
				memberService.update_genre_count(mgenre, userid);
			}
		}else {
			
		}
		
		return "redirect:/chart";
	}
	
	
	// MD 수수's pick 배너 클릭 처리
	@RequestMapping(value="/generation", method=RequestMethod.GET)
	public String selctByMdate(Model model, String startYear, String endYear, String genre) {
		String startDate = startYear + "/01/01";
		String endDate = endYear + "/12/31";
		List<Music> list = musicService.selectByMdate(startDate, endDate, genre);
		
		model.addAttribute("musicList", list);
		model.addAttribute("topnavTitle", "2000sBallad");
		return "podo/search_result";
	}
	
	
	// 가사 보기 아이콘 눌렀을 때 팝업창 띄우기 
	@RequestMapping(value="/lyrics_detail_popup")
	public String lyricsDetailPopup(int mid, Model model) {
		
		logger.info("lyricsDetailPopup()::: 호출");
		Music music = musicService.select(mid);
		model.addAttribute("music", music);
		
		return "podo/lyrics_detail_popup";
	}
	
	
	// 플레이리스트 디테일창에서 X 눌렀을 때 : 플레이리스트 안의 해당 음악 한개 삭제
	@RequestMapping(value="/playlist_member_delete")
	public String playlistItemDelete(int mid, int pid) {
		
		//Playlist : select By pid
		Playlist playlist = playlistService.selectByPid(pid);
				
		//Music : pid 의 mids 분리해서 노래 찾기
		List<Music> musicList = new ArrayList<>();
		
		String mids = playlist.getMids();
		if(mids != null) {
			String[] arrayMids = mids.split(",");
			for(int i = 0; i < arrayMids.length; i++) {
				int m = Integer.parseInt(arrayMids[i]);
				musicList.add(musicService.select(m));
			}
		}
		
		//mids랑 비교해서 같은 mid 있나 찾은 후에 - 같은거 빼고 만든 String mids 로 업데이트
		mids = "";
		for(Music m : musicList) {
			if(m.getMid() != mid) {
				mids += m.getMid() + ",";
			}
		}
		
		playlistService.update(mids, pid);
		
		return "redirect:/playlist_detail_popup?pid="+ pid;
	}
	
	
} // end class MusicController
