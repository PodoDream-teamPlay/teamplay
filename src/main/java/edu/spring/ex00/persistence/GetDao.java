package edu.spring.ex00.persistence;

import java.util.List;

import edu.spring.ex00.domain.Get;
import edu.spring.ex00.pagination.PaginationCriteria;

public interface GetDao {

	List<Get> read(PaginationCriteria c, String userid);
	
	List<Get> read(String userid);
	
	int create(Get g);
	
	int getTotal(String userid);
	
	//회원 탈퇴할때 쓰려고 정보 지우는 메소드
	int delete (String userid);
}
