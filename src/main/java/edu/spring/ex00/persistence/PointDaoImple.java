package edu.spring.ex00.persistence;

import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex00.domain.Point;

@Repository
public class PointDaoImple implements PointDao {

	@Autowired
	private SqlSession session;
	
	private static final String NAMESPACE = "edu.spring.ex00.Pointmapper";
	
	//포인트 적립 시켜야지.
	@Override
	public int create(Point point) {
		System.out.println("pointdaoImple create()");
		return session.insert(NAMESPACE + ".insert", point);
	}

	//날짜 비교하기 위해서
	@Override
	public Date read(String userid) {
		System.out.println("pointdaoImple read:() userid : " + userid);
		return session.selectOne(NAMESPACE + ".select", userid);
		//
	}

	@Override
	public int delete(String userid) {
		return session.delete(NAMESPACE + ".delete", userid);
	}

}
