package edu.spring.ex00.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.ex00.domain.Board;
import edu.spring.ex00.service.BoardService;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	
	
	@Autowired
	private BoardService boardService; //Dependency Injection
	
	
	
	//새 글 작성 클릭시, 글 작성창으로 넘기기 (-> 로그인 완료시, 로그인하라는 알림창 안떠야함 ) (0)
	@RequestMapping(value = "/boardregister" , method =RequestMethod.GET)
	public String boardRegister(Model model) {
		logger.info("registerBoard() GET Call");
		
		return "podo/boardregister";
		
	}
	
	@RequestMapping(value="/boardFnA",
			method = RequestMethod.GET)
	public String boardList(Model model) { // dispatcher Servlet이 메소드 부를텐데 부를때, Model에 넣어주는구야~
		
		List<Board> boardFnA = boardService.select(); //게시판 전체 가지고오는거 
		model.addAttribute("boardList", boardFnA);
		return "podo/boardFnA";
	
	}
	
	
	
	
	@RequestMapping(value="/boardFnA", method=RequestMethod.POST)
	public String boardRegister(Board b) {
		logger.info("registerBoard() POST CALL");
		logger.info("---- title: " + b.getTitle());
		logger.info("---- content: " + b.getContent());
		logger.info("---- userid: "+ b.getUserid());
		
		
		
		boardService.insert(b);
		
		return "redirect:/boardFnA";
	}
	
	//작성한 글 보기 
	@RequestMapping(value="/boarddetail", method= RequestMethod.GET) 
	public String detail(int bno, Model model) {
		
		logger.info("boarddetail() GET 호출");
		
		Board b = boardService.select(bno);
		logger.info("----title : {}, uesrid: {}" , b.getTitle(), b.getUserid());
		
		model.addAttribute("board", b); 
		
		return "podo/boarddetail";
		
		
	}

	
	
/*
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void update(int bno, Model model) {
		logger.info("update() GET CALL");
		
		Board b = boardService.select(bno);
		model.addAttribute("board", b);
	}

	
	
	
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(Board b) {
		boardService.update(b);
		
		
		return "redirect:/boarddetail?bno=" + b.getBno();
		
	}
	
	
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(int bno) {
		logger.info("delete GET CALL");
		
		boardService.delete(bno);
	
		return "redirect:/boardFnA" ;
		
	}
	

	
	@RequestMapping(value = "/search",
			method = RequestMethod.GET)
	public void search(int searchType, String searchKeyword,
			Model model) {
		logger.info("type: {}, keyword: {}",
				searchType, searchKeyword);
		List<Board> list = 
				boardService.search(searchType, searchKeyword);
		model.addAttribute("boardList", list);
	}
	
*/
	

	
	
	
	
} // end class BoardController
