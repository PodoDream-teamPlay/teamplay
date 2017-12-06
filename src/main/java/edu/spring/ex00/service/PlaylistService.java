package edu.spring.ex00.service;

import java.util.List;

import edu.spring.ex00.domain.Playlist;

public interface PlaylistService {

	List<Playlist> selectByUserid(String userid);
	
}
