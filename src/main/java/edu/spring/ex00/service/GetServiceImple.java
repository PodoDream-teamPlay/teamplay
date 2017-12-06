package edu.spring.ex00.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex00.domain.Get;
import edu.spring.ex00.persistence.GetDao;

@Service
public class GetServiceImple implements GetService {

	@Autowired
	GetDao dao;
	
	@Override
	public List<Get> selectByUserid(String userid) {
		return dao.read(userid);
	}

}
