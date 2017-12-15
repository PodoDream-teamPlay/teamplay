package edu.spring.ex00.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import edu.spring.ex00.domain.Point;
import edu.spring.ex00.persistence.PointDao;

@Service
public class PointServiceImple implements PointService {

	@Autowired
	private PointDao dao;
	
	@Override
	public int insert(Point point) {
		System.out.println("pointdao Insert()");
		return dao.create(point);
	}

	@Override
	public Date select(String userid) {
		System.out.println("pointserviceImple select()");
		return dao.read(userid);
	}

}
