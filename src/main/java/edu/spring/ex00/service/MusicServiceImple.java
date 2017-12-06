package edu.spring.ex00.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex00.domain.Music;
import edu.spring.ex00.persistence.MusicDao;

@Service
public class MusicServiceImple implements MusicService {
	
	// DI(의존성 주입)
	@Autowired private MusicDao musicDao; 
	

	@Override
	public List<Music> select() {
	
		return musicDao.read();
	}

	@Override
	public List<Music> search(int type, String keyword) {
		
		return musicDao.search(type, keyword);
		
	}

	@Override
	public Music select(int mid) {
		return musicDao.read(mid);
	}

} // end class MusicServiceImple 
