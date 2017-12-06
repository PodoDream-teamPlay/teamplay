package edu.spring.ex00.persistence;

import edu.spring.ex00.domain.Member;

public interface MemberDao {

	//회원 가입
	int create (Member m);
	
}
