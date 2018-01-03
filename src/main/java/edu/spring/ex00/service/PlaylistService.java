package edu.spring.ex00.service;

import java.util.List;

import edu.spring.ex00.domain.Playlist;
import edu.spring.ex00.pagination.PaginationCriteria;

public interface PlaylistService {

	List<Playlist> selectByUserid(String userid);
	
	List<Playlist> selectByPtitle(String ptitle);
	
	List<Playlist> selectByPtitleandUserid(String ptitle, String userid);
	
	Playlist selectByPid(int pid);
	
	int insert(Playlist list);
	
	int delete(int pid);
	
	int update(int mid, int pid);
	
	//pagination
	List<Playlist> selectByUserid(PaginationCriteria c, String userid);
	
	int getTotal(String userid);
	
}
