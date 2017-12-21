package edu.spring.ex00.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex00.domain.Reply;


@Repository
public class ReplyDaoImple implements ReplyDao {
	
	private static final String NAMESPACE = "edu.spring.ex00.ReplyMapper";
	
	
	@Autowired
	private SqlSession session;
	

	
	@Override
	public List<Reply> read(int bno) {
		return session.selectList(NAMESPACE + ".selectAll",bno);
	}

	@Override
	public int create(Reply r) {
		return session.insert(NAMESPACE + ".insert",r); 
	}

	@Override
	public int update(Reply r) {
		return session.update(NAMESPACE + ".update",r);
	}

	@Override
	public int delete(int rno) {
	
		return session.delete(NAMESPACE +".delete" ,rno);
	
	}

	@Override
	public int getBno(int rno) {
		
		return session.selectOne(NAMESPACE + ".getBno", rno);
	}


	
	
}

