package edu.spring.ex00.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex00.domain.Member;
import edu.spring.ex00.service.MemberServiceImple;

@Repository
public class MemberDaoImple implements MemberDao {

	@Autowired
	private SqlSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImple.class);
	
	private static final String NAMESPACE =
			"edu.spring.ex00.Membermapper";
	
	
	@Override //회원 가입
	public int create(Member m) {
		logger.info("MemberDaoImple : creat");
		System.out.println("daoImple create ");
		return session.insert(NAMESPACE + ".insert", m);
	}

	@Override //회원 정보 조회
	public Member read(String userid) {
		System.out.println("daoImple read ");
		return session.selectOne(NAMESPACE + ".select", userid);
	}

	@Override //회원 정보 수정
	public int update(Member m) {
		System.out.println("daoImple update ");
		return session.update(NAMESPACE + ".update", m);
	}

	@Override
	public int update_pay(Member m) {
		System.out.println("update_pay");
		return session.update(NAMESPACE + ".month_paid", m);
	}

	@Override
	public int readGenreCount(String colGenre, String userid) {
		Map<String, String> args = new HashMap<>();
		args.put("colGenre", colGenre);
		args.put("userid", userid);
		return session.selectOne(NAMESPACE + ".select_genre_count", args);
	}

	@Override
	public int update(String colGenre, int count, String userid) {
		Map<String, Object> args = new HashMap<>();
		args.put("colGenre", colGenre);
		args.put("count", count);
		args.put("userid", userid);
		return session.update(NAMESPACE + ".update_genre", args);
	}

	@Override
	public int update_point(Member m) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE + ".update_point", m);
	}

	@Override
	public int select_point(String userid) {
		
		return session.selectOne(NAMESPACE + ".select_point" , userid);
	}

	@Override
	public Member readByEmail(String email) {
		System.out.println("memberdao readByEmail come!!!" + email);
		return session.selectOne(NAMESPACE + ".selectByEmail", email);
	}


	
}
