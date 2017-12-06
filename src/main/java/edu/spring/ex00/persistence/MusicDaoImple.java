package edu.spring.ex00.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex00.domain.Music;

@Repository
public class MusicDaoImple implements MusicDao {
	
	// 패키지 이름을 상수로 정의하기 
	private static final String NAMESPACE = 
			"edu.spring.ex00.MusicMapper";
	
	// 의존성 주입(DI) 
	@Autowired private SqlSession session;

	@Override
	public List<Music> read() {
		// 전체 검색(차트 정렬)
		// TODO : 현재는 mid기준으로 차트 정렬, 추후 mcount 기준으로 차트 정렬 해야 함! 
		return session.selectList(NAMESPACE + ".selectAll");
	}

	@Override
	public List<Music> search(int type, String keyword) {
		// 검색 기능 
		Map<String, Object> args = new HashMap<>();
		args.put("searchType", type);
		args.put("searchKeyword", "%" + keyword + "%");
		
		return session.selectList(NAMESPACE , args);
	}

} // end class MusicDaoImple 
