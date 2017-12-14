package edu.spring.ex00.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex00.domain.Get;
import edu.spring.ex00.pagination.PaginationCriteria;
import edu.spring.ex00.persistence.GetDao;

@Service
public class GetServiceImple implements GetService {

	@Autowired
	GetDao dao;
	
	@Override
	public List<Get> selectByUserid(PaginationCriteria c, String userid) {
		return dao.read(c, userid);
	}

	@Override
	public int insert(Get g) {
		return dao.create(g);
	}

	@Override
	public int getTotal(String userid) {
		return dao.getTotal(userid);
	}

	@Override
	public List<Get> selectByUserid(String userid) {
		return dao.read(userid);
	}

}
