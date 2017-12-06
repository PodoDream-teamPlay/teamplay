package edu.spring.ex00.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex00.domain.Playlist;

@Repository
public class PlaylistDaoImple implements PlaylistDao {

	@Autowired
	SqlSession session;
	public static final String NAMESPACE = "edu.spring.ex00.Playlistmapper";
	
	@Override
	public List<Playlist> read(String userid) {
		return session.selectList(NAMESPACE + ".selectByUserid", userid);
	}

}
