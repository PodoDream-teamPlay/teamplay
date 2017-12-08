package edu.spring.ex00.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping(value="/playlist")
@RestController
public class PlaylistController {
	private static final Logger logger = LoggerFactory.getLogger(PlaylistController.class);
	
	@RequestMapping(value="/{pid}", method=RequestMethod.DELETE)
	public ResponseEntity<String> deletePlaylist(@PathVariable(name = "pid")int pid){
		logger.info("delete 하려는 pid ::: " + pid);
		
		ResponseEntity<String> entity = null;
		
		
		return entity;
	}
	
}
