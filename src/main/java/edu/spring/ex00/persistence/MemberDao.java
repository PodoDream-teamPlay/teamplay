package edu.spring.ex00.persistence;

import edu.spring.ex00.domain.Member;

public interface MemberDao {

	//회원 가입
	int create (Member m);
	
	//회원 정보 조회
	Member read(String userid);
	
	//회원 정보 조회 (email)로
	Member readByEmail(String email);
	
	//회원 정보 수정
	int update(Member m);
	
	//회원 정보 수정
	int update_pay(Member m);
	
	//장르 count 알아오기
	int readGenreCount(String colGenre, String userid); 
	
	//장르 count 업데이트
	int update(String colGenre, int count, String userid);
	
	//포인트 update 하기
	int update_point(Member m);
	
	//유저별 포인트 select
	int select_point(String userid);
	
}
