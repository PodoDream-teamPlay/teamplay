package edu.spring.ex00.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex00.domain.Board;

//@Repository : Spring framework에게 DB를 사용하는 persistence(영속성) 계층의 component임을 등록하는 annotation
// root-context.xml 파일에서 bean으로 등록을 해야 실제로 사용 가능.(즉, context: component-scan 해라)
@Repository
public class BoardDaoImple implements BoardDao {
	
	@Autowired // DI (의존성주입) 
	private SqlSession session;
	
	
	
	//namespace 를 매번 쓸 수 없으니까 상수로 정의해주자 
	private static final String NAMESPACE = "edu.spring.ex00.BoardMapper";
	
	
	@Override
	public List<Board> read() {
		//전체검색 
		return session.selectList(NAMESPACE + ".selectAll"); 
		
	}

	@Override
	public Board read(int bno) {
	
		return session.selectOne(NAMESPACE + ".selectByBno", bno);
	}


	@Override
	public int create(Board b) {
		System.out.println("dao create Board b");
		return session.insert(NAMESPACE + ".insert", b);
	}

	@Override
	public int update(Board b) {
		return session.update(NAMESPACE + ".update", b);
	}

	@Override
	public int delete(int bno) {
		return session.delete(NAMESPACE + ".delete", bno);
	}

	@Override
	public List<Board> search(int type, String keyword) {
		Map<String, Object> args = new HashMap<>();
		args.put("searchType", type);
		args.put("searchKeyword", "%" + keyword + "%");
		
		return session.selectList(NAMESPACE + ".search", args);
	}

	@Override
	public int getTotalCount() {
		return session.selectOne(NAMESPACE + ".totalCount");
	}


	
	
}
