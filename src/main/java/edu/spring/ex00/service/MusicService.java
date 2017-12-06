package edu.spring.ex00.service;

import java.util.List;

import edu.spring.ex00.domain.Music;

public interface MusicService {
	
	// 전체 검색 (차트 정렬)
	List<Music> select();
	
	// 검색 기능 
	List<Music> search(int type, String keyword);
	
	
} // end interface MusicService 
