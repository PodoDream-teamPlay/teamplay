package edu.spring.ex00.service;

import java.util.List;

import edu.spring.ex00.domain.Get;
import edu.spring.ex00.pagination.PaginationCriteria;

public interface GetService {

	List<Get> selectByUserid(PaginationCriteria c, String userid);
	
	List<Get> selectByUserid(String userid);
	
	int insert(Get g);
	
	int getTotal(String userid);
}
