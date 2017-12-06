package edu.spring.ex00.service;

import java.util.List;

import edu.spring.ex00.domain.Get;

public interface GetService {

	List<Get> selectByUserid(String userid);
	
}
