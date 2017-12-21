package edu.spring.ex00.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.spring.ex00.domain.Reply;
import edu.spring.ex00.persistence.BoardDao;
import edu.spring.ex00.persistence.ReplyDao;



@Service
public class ReplyServiceImple implements ReplyService {

	@Autowired
	public ReplyDao replyDao;
	@Autowired
	public BoardDao boardDao;
	
	

	
	@Override
	public List<Reply> select(int bno) {
		return replyDao.read(bno);
	}
	
	//DataSourceTransactionmanager 클래스가  DB Transaction 관리를 하도록 AOP 설정 한것. 
	//@Transactional
	
	@Override
	public int insert(Reply r) {
		//TODO : 댓글을 입력에 성공하면 해당 게시글의 댓글 갯수를 업데이트 
		// 1. 댓글 테이블에 insert 
		int result = replyDao.create(r);
		
		// 2. insert 성공 시, 게시글 테이블에 replyCnt를 1 증가시킨다. 
		
		if(result == 1) {
		
		int cnt = boardDao.selectReplycnt(r.getBno());
			
		result = boardDao.updateReplyCnt(r.getBno(),cnt + 1);
		
		
		}
		
		return result;
		
	}

	@Override
	public int update(Reply r) {
		return replyDao.update(r);
	}

	@Override
	public int delete(int rno) {
		// 댓글 삭제 후 Board 테이블의 댓글 갯수도 수정
		// 1) rno를 이용해서, bno를 찾고
		int bno = replyDao.getBno(rno);
		System.out.println("-------------------------------------------------------------------------------------------bno" + bno);
		// 2) 댓글 테이블에서 해당 rno 댓글 삭제
		int result = replyDao.delete(rno);
		
		
		if (result == 1) {
		// 3) 게시글 테이블에서 replycnt를 1 감소
			

		int cnt = boardDao.selectReplycnt(bno);
		boardDao.updateReplyCnt(bno,  cnt -1);
		
		
		}
		return result ;
	
	}







}
