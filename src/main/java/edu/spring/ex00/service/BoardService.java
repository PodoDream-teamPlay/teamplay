package edu.spring.ex00.service;

import java.util.List;

import edu.spring.ex00.domain.Board;

public interface BoardService {

	
	List<Board> select();//전체검색 
	Board select(int bno);//글번호 검색 
	List<Board> select(String userid);//작성자 아이디 검색 
	List<Board> select(String title, String content);//제목과 내용으로 검색 
	int insert(Board b);// 새 글 작성
	int update(Board b);// 글 수정
	int delete(int bno);// 글 삭제 
	
	List<Board> search(int type, String keyword); // 검색 기능
	
	
}
