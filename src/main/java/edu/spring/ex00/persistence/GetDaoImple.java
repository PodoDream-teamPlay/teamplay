package edu.spring.ex00.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex00.domain.Get;

@Repository
public class GetDaoImple implements GetDao {

	public static final String NAMESPACE = "edu.spring.ex00.Getmapper";
	@Autowired
	SqlSession session;
	
	@Override
	public List<Get> read(String userid) {
		return session.selectList(NAMESPACE+".selectByUserid", userid);
	}

}
