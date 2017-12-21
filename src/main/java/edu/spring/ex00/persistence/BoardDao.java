package edu.spring.ex00.persistence;

import java.util.List;

import edu.spring.ex00.domain.Board;

public interface BoardDao {
	
	
	
	//CRUD (create , read, update, delete) 
	

	List<Board> read(); 
	
	Board read(int bno);

	

	int create(Board b);
	

	int update(Board b);
	
	//작성된 글 삭제 
	int delete(int bno);
	
	

	List<Board> search(int type, String keyword);
	

	int getTotalCount();
	

	
	int updateReplyCnt(int bno ,int amount);
	
	
	int selectReplycnt(int bno);
	
	
}//end interface BoardDao
