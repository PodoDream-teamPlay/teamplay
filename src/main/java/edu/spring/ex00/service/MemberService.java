package edu.spring.ex00.service;

import edu.spring.ex00.domain.Member;

public interface MemberService {

	// 회원 가입
		int insert(Member m);
	// 회원 정보 조회
		Member select(String userid);
	// 회원 정보 수정
		int update(Member m);
	// 월별 결제 했을 때
		int update_pay(Member m);
		
	// 다운로드 했을 때 카운트 증가
		int update_genre_count(String colGenre, String userid);
	
	// 포인트 업데이트 
		int update_point(Member m);
		
	// 포인트 확인
		int select_point(String userid);
		
}
