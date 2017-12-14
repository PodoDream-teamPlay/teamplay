package edu.spring.ex00.service;

import java.util.List;

import edu.spring.ex00.domain.Music;

public interface MusicService {
	
	// 전체 검색 (차트 정렬)
	List<Music> selectAll(int number);
	
	// 검색 기능 
	List<Music> search(int type, String keyword);
	
	// mid로 노래찾기
	Music select(int mid);
	
	
	// mp3 다운로드 했을 때 mcount 증가
	int update_mcount(int mid);
	
	// 다운로드 한 mp3의 mgenre 찾기
	String selectMgenre(int mid);
	
	// 최신곡 8개 가져오기
	List<Music> getNewAlbums();
	
	
} // end interface MusicService 
