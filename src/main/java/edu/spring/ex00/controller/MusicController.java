package edu.spring.ex00.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.ex00.domain.Music;
import edu.spring.ex00.service.MusicService;

@Controller
@RequestMapping(value="/podo")
public class MusicController {

	// 로그 출력 기능
	private static final Logger logger = 
			LoggerFactory.getLogger(MusicController.class);
	
	// 멤버 변수 (DI) 
	@Autowired private MusicService musicService;
	
	// 홈(main)에서 '차트'를 클릭했을 때 
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public void MusicChart(Model model) {
		// 차트 정렬 - 클라이언트에 전체 보여주기 
		List<Music> list = musicService.select();
		model.addAttribute("music", list);						
	}
	
	
	
} // end class MusicController
