package edu.spring.ex00.service;

import java.util.List;

import edu.spring.ex00.domain.Reply;

public interface ReplyService {

	
	List<Reply> select(int bno);
	int insert(Reply r);//삽입
	int update(Reply r);//수정
	int delete(int rno);//삭제 
	
	
	
	
	
}
