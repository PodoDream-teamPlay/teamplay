package edu.spring.ex00.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex00.domain.Member;
import edu.spring.ex00.persistence.GetDao;
import edu.spring.ex00.persistence.MemberDao;
import edu.spring.ex00.persistence.PlaylistDao;
import edu.spring.ex00.persistence.PointDao;



@Repository
public class MemberServiceImple implements MemberService {

	@Autowired private MemberDao memberDao;
	@Autowired private GetDao getDao;
	@Autowired private PlaylistDao playlistDao;
	@Autowired private PointDao pointDao;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImple.class);
	
	@Override
	public int insert(Member m) {
		logger.info("MemberSErviceImple : insert");
		System.out.println("memberserviceImple : insert");
		return memberDao.create(m);
	}

	@Override
	public Member select(String userid) {
		System.out.println("memberSErviceImple : select");
		return memberDao.read(userid);
	}

	@Override
	public int update(Member m) {
		return memberDao.update(m);
	}

	@Override
	public int update_pay(Member m) {
		return memberDao.update_pay(m);
	}

	@Override
	public int update_genre_count(String colGenre, String userid) {
		int result = 0;
		int count = memberDao.readGenreCount(colGenre, userid) + 1;
		result = memberDao.update(colGenre, count, userid);
		return result;
	}

	@Override
	public int update_point(Member m) {
		return memberDao.update_point(m);
	}

	@Override
	public int select_point(String userid) {
		return memberDao.select_point(userid);
	}

	@Override
	public Member selectByEmail(String email) {
		return memberDao.readByEmail(email);
	}

	
	
	//회원 탈퇴
	@Override
	public int delete(String userid) {
		int result = 0;
		
		result += getDao.delete(userid);
		result += playlistDao.delete(userid);
		result += pointDao.delete(userid);
		result += memberDao.delete(userid);
		
		if(result > 0) {
			return 1;
		}else {
			return 0;
		}
	}
	

	
}
