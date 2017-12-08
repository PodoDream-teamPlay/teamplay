package edu.spring.ex00.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.ex00.domain.Playlist;
import edu.spring.ex00.service.PlaylistService;

@RequestMapping(value="/playlist")
@RestController
public class PlaylistController {
	private static final Logger logger = LoggerFactory.getLogger(PlaylistController.class);
	@Autowired private PlaylistService playlistService;
	
	@RequestMapping(value="/all/{userid}", method=RequestMethod.GET)
	public ResponseEntity<List<Playlist>> readPlaylist(@PathVariable(name="userid")String userid){
		logger.info("select 하려는 userid ::: " + userid);
		List<Playlist> list = playlistService.selectByUserid(userid);
		ResponseEntity<List<Playlist>> entity = null;
		if(list != null) {
			entity = new ResponseEntity<List<Playlist>>(list, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<List<Playlist>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{ptitle}", method=RequestMethod.PUT)
	public ResponseEntity<Integer> createPlaylist(@RequestBody Playlist p){
		logger.info("insert 하려는 ptitle ::: " + p.getMids());
		ResponseEntity<Integer> entity = null;
		//TODO : insert 문장 service에 만든다음에 여기서 실행
		int result = 0;
		if(result == 1) {
			
		}else {
			
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{pid}", method=RequestMethod.DELETE)
	public ResponseEntity<String> deletePlaylist(@PathVariable(name = "pid")int pid){
		logger.info("delete 하려는 pid ::: " + pid);
		ResponseEntity<String> entity = null;
		int result = playlistService.delete(pid);
		if(result == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
}
