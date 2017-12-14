package edu.spring.ex00.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex00.domain.Get;
import edu.spring.ex00.pagination.PaginationCriteria;

@Repository
public class GetDaoImple implements GetDao {

	public static final String NAMESPACE = "edu.spring.ex00.Getmapper";
	@Autowired
	SqlSession session;
	
	@Override
	public List<Get> read(PaginationCriteria c, String userid) {
		Map<String, Object> args = new HashMap<>();
		args.put("start", c.getStart());
		args.put("end", c.getEnd());
		args.put("userid", userid);
		return session.selectList(NAMESPACE+".selectPage", args);
	}

	@Override
	public int create(Get g) {
		return session.insert(NAMESPACE + ".insert", g);
	}

	@Override
	public int getTotal(String userid) {
		return session.selectOne(NAMESPACE + ".totalCount", userid);
	}

	@Override
	public List<Get> read(String userid) {
		return session.selectList(NAMESPACE + ".selectByUserid", userid);
	}

}
