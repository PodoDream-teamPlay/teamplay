package edu.spring.ex00.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.spel.support.ReflectiveMethodExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



import edu.spring.ex00.domain.Music;
import edu.spring.ex00.service.MusicService;

@Controller
public class MusicController {

	// 로그 출력 기능
	private static final Logger logger = 
			LoggerFactory.getLogger(MusicController.class);
	
	// 멤버 변수 (DI) 
	@Autowired private MusicService musicService;
	
	
	// 홈(main)에서 '차트'를 클릭했을 때 
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String musicChart(Model model) {
		logger.info("chart() GET 호출");
		// 차트 정렬 - 클라이언트에 전체 보여주기 
		List<Music> list = musicService.select();
		model.addAttribute("music", list);
		
		return "podo/chart";
		
	}
	
	
	// 검색어 입력 후 '검색'버튼 -> 검색결과 
	@RequestMapping(value="/search_result", method= RequestMethod.GET)
	public String musicSearch(int searchType, String searchKeyword, Model model) {
		logger.info("search_result() GET 호출");
		logger.info("type: {}, keyword: {}", searchType, searchKeyword);
		
		List<Music> list = musicService.search(searchType, searchKeyword);	
		model.addAttribute("musicList", list);
		
		return "podo/search_result";
		
	}
	
	@RequestMapping(value="/mp3_down", method = RequestMethod.POST)
	public String checkbox(HttpServletRequest reqest, int[] cb_choose) {
		logger.info("버튼이 눌러 졌을까요");
		
		for(int i = 0; i < cb_choose.length; i++) {
			logger.info("cb_choose : " + cb_choose[i]);
		}
		
		return "podo/chart";
	}
	
	
} // end class MusicController
