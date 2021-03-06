package edu.spring.ex00.persistence;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex00.domain.Music;

@Repository
public class MusicDaoImple implements MusicDao {
	
	// 패키지 이름을 상수로 정의하기 
	private static final String NAMESPACE = 
			"edu.spring.ex00.MusicMapper";
	
	private static final Logger logger = 
			LoggerFactory.getLogger(MusicDaoImple.class);
	
	// 의존성 주입(DI) 
	@Autowired private SqlSession session;

	@Override
	public List<Music> readAll(int number) {
		// 전체 검색(차트 정렬)
		// TODO : 현재는 mid기준으로 차트 정렬, 추후 mcount 기준으로 차트 정렬 해야 함! 
		return session.selectList(NAMESPACE + ".selectAll", number);
	}

	@Override
	public List<Music> search(int type, String keyword) {
		// 검색 기능 
		Map<String, Object> args = new HashMap<>();
		args.put("searchType", type);
		args.put("searchKeyword", "%" + keyword + "%");
		logger.info("타입: {}, 키워드: {}", type, keyword);
		return session.selectList(NAMESPACE + ".search", args);
	}

	@Override
	public Music read(int mid) {
		return session.selectOne(NAMESPACE + ".selectByMid", mid);
	}

	@Override
	public int readMcount(int mid) {
		return session.selectOne(NAMESPACE + ".selectMcountByMid", mid);
	}

	@Override
	public int update(int mcount, int mid) {
		Map<String, Integer> args = new HashMap<>();
		args.put("mcount", mcount);
		args.put("mid", mid);
		return session.update(NAMESPACE + ".updateByMid", args);
	}

	@Override
	public String readMgenre(int mid) {
		return session.selectOne(NAMESPACE + ".selectMgenreByMid", mid);
	}

	@Override
	public List<Music>  newAlbum() {
		return session.selectList(NAMESPACE + ".selectByMdate") ;
	}
	
	@Override
	public int update(int pid, String mids) {
		// ★ 플레이리스트 추가 
		Map<String, Object> args = new HashMap<>();
		args.put("pid", pid);
		args.put("mids", mids);
		return session.update(NAMESPACE + ".updatePlaylistByPid", args);
	}

	@Override
	public List<Music> read(String startDate, String endDate, String genre) {
		Map<String, String> args = new HashMap<>();
		args.put("startDate", startDate);
		args.put("endDate", endDate);
		args.put("genre", genre);
		return session.selectList(NAMESPACE + ".searchByMdate", args);
	}

} // end class MusicDaoImple 
