package edu.spring.ex00.persistence;

import java.util.List;

import edu.spring.ex00.domain.Reply;


public interface ReplyDao {
	
	List<Reply> read(int bno);
	int create(Reply r);
	int update(Reply r);
	int delete(int rno);
	int getBno(int rno);
	
} // end interface ReplyDao
