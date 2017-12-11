package edu.spring.ex00.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex00.domain.Playlist;
import edu.spring.ex00.persistence.PlaylistDao;

@Service
public class PlaylistServiceImple implements PlaylistService {

	@Autowired
	PlaylistDao dao;
	
	@Override
	public List<Playlist> selectByUserid(String userid) {
		return dao.read(userid);
	}

	@Override
	public int insert(Playlist list) {
		return dao.create(list);
	}

	@Override
	public int delete(int pid) {
		return dao.delete(pid);
	}

	@Override
	public List<Playlist> selectByPtitle(String ptitle) {
		return dao.readByPtitle(ptitle);
	}

}
