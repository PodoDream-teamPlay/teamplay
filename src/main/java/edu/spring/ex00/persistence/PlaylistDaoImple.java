package edu.spring.ex00.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex00.domain.Playlist;
import edu.spring.ex00.pagination.PaginationCriteria;

@Repository
public class PlaylistDaoImple implements PlaylistDao {

	@Autowired
	SqlSession session;
	public static final String NAMESPACE = "edu.spring.ex00.Playlistmapper";
	
	@Override
	public List<Playlist> read(String userid) {
		return session.selectList(NAMESPACE + ".selectByUserid", userid);
	}

	@Override
	public int create(Playlist list) {
		Map<String, Object> args = new HashMap<>();
		args.put("ptitle", list.getPtitle());
		args.put("userid", list.getUserid());
		args.put("mids", list.getMids());
		return session.insert(NAMESPACE + ".insert", args);
	}

	@Override
	public int delete(int pid) {
		return session.delete(NAMESPACE + ".delete", pid);
	}

	@Override
	public List<Playlist> readByPtitle(String ptitle) {
		return session.selectList(NAMESPACE + ".selectByPtitle", ptitle);
	}

	@Override
	public Playlist read(int pid) {
		return session.selectOne(NAMESPACE + ".selectByPid", pid);
	}

	@Override
	public List<Playlist> read(PaginationCriteria c, String userid) {
		Map<String , Object> args = new HashMap<>();
		args.put("start", c.getStart());
		args.put("end", c.getEnd());
		args.put("userid", userid);
		return session.selectList(NAMESPACE+".selectPage", args);
	}

	@Override
	public int getTotal(String userid) {
		return session.selectOne(NAMESPACE + ".totalCount", userid);
	}

	@Override
	public int delete(String userid) {
		return session.delete(NAMESPACE + ".deleteByUserid", userid);
	}

	@Override
	public int update(String mids, int pid) {
		Map<String , Object> args = new HashMap<>();
		args.put("mids", mids);
		args.put("pid", pid);
		return session.update(NAMESPACE + ".update", args);
	}

}
