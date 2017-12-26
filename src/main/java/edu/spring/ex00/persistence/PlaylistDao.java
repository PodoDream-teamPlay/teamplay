package edu.spring.ex00.persistence;

import java.util.List;

import edu.spring.ex00.domain.Playlist;
import edu.spring.ex00.pagination.PaginationCriteria;

public interface PlaylistDao {

	//userid로 select
	List<Playlist> read(String userid);
	//ptitle로 select
	List<Playlist> readByPtitle(String ptitle);
	//pid로 select
	Playlist read(int pid);
	
	//insert
	int create (Playlist list);
	//delete
	int delete (int pid);
	
	
	//palylist에서 노래 한개 지우고 업데이트하는 메소드
	int update(String mids, int pid);
	
	//회원 탈퇴할때 쓰려고 정보 지우는 메소드
	int delete (String userid);
	
	
	//pagination
	List<Playlist> read(PaginationCriteria c, String userid);
	
	int getTotal(String userid);
}
