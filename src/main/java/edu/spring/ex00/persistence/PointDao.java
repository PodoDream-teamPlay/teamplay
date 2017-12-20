package edu.spring.ex00.persistence;

import java.util.Date;

import edu.spring.ex00.domain.Point;

public interface PointDao {
	
	int create(Point point);
	
	Date read(String userid);
	
	//회원 탈퇴할때 쓰려고 정보 지우는 메소드
	int delete (String userid);
	
	//
}
