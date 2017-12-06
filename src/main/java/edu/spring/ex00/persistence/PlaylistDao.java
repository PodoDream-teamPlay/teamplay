package edu.spring.ex00.persistence;

import java.util.List;

import edu.spring.ex00.domain.Playlist;

public interface PlaylistDao {

	//userid로 select
	List<Playlist> read(String userid);
	
}
