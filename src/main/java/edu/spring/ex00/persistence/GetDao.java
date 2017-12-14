package edu.spring.ex00.persistence;

import java.util.List;

import edu.spring.ex00.domain.Get;
import edu.spring.ex00.pagination.PaginationCriteria;

public interface GetDao {

	List<Get> read(PaginationCriteria c, String userid);
	
	List<Get> read(String userid);
	
	int create(Get g);
	
	int getTotal(String userid);
}
