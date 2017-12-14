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
	
	
	//pagination
	List<Playlist> read(PaginationCriteria c, String userid);
	
	int getTotal(String userid);
}
