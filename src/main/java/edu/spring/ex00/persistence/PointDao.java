package edu.spring.ex00.persistence;

import java.util.Date;

import edu.spring.ex00.domain.Point;

public interface PointDao {
	
	int create(Point point);
	
	Date read(String userid);
	
	
}
