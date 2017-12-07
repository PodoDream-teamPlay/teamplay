package edu.spring.ex00.persistence;

import edu.spring.ex00.domain.Member;

public interface MemberDao {

	//회원 가입
	int create (Member m);
	
	//회원 정보 조회
	Member read(String userid);
	
	//회원 정보 수정
	int update(Member m);
	
}
