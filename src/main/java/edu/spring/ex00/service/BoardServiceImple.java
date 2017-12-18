package edu.spring.ex00.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex00.domain.Board;
import edu.spring.ex00.persistence.BoardDao;


@Service
public class BoardServiceImple implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<Board> select() {
		
		return boardDao.read();
	}

	@Override
	public Board select(int bno) {
		
		return boardDao.read(bno);
	}


	@Override
	public int insert(Board b) {
		System.out.println("service insert Board b");
		return boardDao.create(b);
	}

	@Override
	public int update(Board b) {
		
		return boardDao.update(b);
	}

	@Override
	public int delete(int bno) {
		
		return boardDao.delete(bno);
	}


	@Override
	public List<Board> search(int type, String keyword) {
		return boardDao.search(type, keyword);
	}

	@Override
	public List<Board> select(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> select(String title, String content) {
		// TODO Auto-generated method stub
		return null;
	}


	


}
