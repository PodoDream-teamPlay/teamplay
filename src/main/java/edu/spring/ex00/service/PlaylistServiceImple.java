package edu.spring.ex00.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex00.domain.Music;
import edu.spring.ex00.domain.Playlist;
import edu.spring.ex00.pagination.PaginationCriteria;
import edu.spring.ex00.persistence.PlaylistDao;

@Service
public class PlaylistServiceImple implements PlaylistService {

	@Autowired
	PlaylistDao dao;
	@Autowired
	MusicService musicService;
	
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

	@Override
	public Playlist selectByPid(int pid) {
		return dao.read(pid);
	}

	@Override
	public List<Playlist> selectByUserid(PaginationCriteria c, String userid) {
		return dao.read(c, userid);
	}

	@Override
	public int getTotal(String userid) {
		return dao.getTotal(userid);
	}

	@Override
	public int update(int mid, int pid) {
		
		//Playlist : select By pid
		Playlist playlist = selectByPid(pid);
						
		//Music : pid 의 mids 분리해서 노래 찾기
		List<Music> musicList = new ArrayList<>();
				
		String mids = playlist.getMids();
		if(mids != null) {
			String[] arrayMids = mids.split(",");
			for(int i = 0; i < arrayMids.length; i++) {
				int m = Integer.parseInt(arrayMids[i]);
				musicList.add(musicService.select(m));
			}
		}
				
		//mids랑 비교해서 같은 mid 있나 찾은 후에 - 같은거 빼고 만든 String mids 로 업데이트
		mids = "";
		for(Music m : musicList) {
			if(m.getMid() != mid) {
				mids += m.getMid() + ",";
			}
		}
		
		return dao.update(mids, pid);
	}

}
