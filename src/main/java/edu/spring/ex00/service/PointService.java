package edu.spring.ex00.service;

import java.util.Date;

import edu.spring.ex00.domain.Point;

public interface PointService {

	int insert(Point point);
	Date select(String userid);
	//
}
