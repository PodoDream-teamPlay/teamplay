package edu.spring.ex00.persistence;

import java.util.List;

import edu.spring.ex00.domain.Get;

public interface GetDao {

	List<Get> read(String userid);
	
}
