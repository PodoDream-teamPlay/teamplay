package edu.spring.ex00.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex00.domain.Music;
import edu.spring.ex00.persistence.GetDao;
import edu.spring.ex00.persistence.MusicDao;

@Service
public class MusicServiceImple implements MusicService {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(MemberServiceImple.class);
	
	// DI(의존성 주입)
	@Autowired private MusicDao musicDao;
	

	@Override
	public List<Music> select() {
	
		return musicDao.read();
	}

	@Override
	public List<Music> search(int type, String keyword) {
		logger.info("musicServiceImpe() 호출");
		
		return musicDao.search(type, keyword);
		
	}

	@Override
	public Music select(int mid) {
		return musicDao.read(mid);
	}

	@Override
	public int update_mcount(int mid) {
		int result = 0;
		int mcount = musicDao.readMcount(mid) + 1;
		result = musicDao.update(mcount, mid);
		return result;
	}

	@Override
	public String selectMgenre(int mid) {
		return musicDao.readMgenre(mid);
	}

} // end class MusicServiceImple 
