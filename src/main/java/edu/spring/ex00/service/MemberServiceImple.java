package edu.spring.ex00.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.ex00.domain.Member;
import edu.spring.ex00.persistence.MemberDao;



@Repository
public class MemberServiceImple implements MemberService {

	@Autowired
	private MemberDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImple.class);
	
	@Override
	public int insert(Member m) {
		// TODO Auto-generated method stub
		logger.info("MemberSErviceImple : insert");
		System.out.println("memberserviceImple : insert");
		return dao.create(m);
	}

	@Override
	public Member select(String userid) {
		System.out.println("memberSErviceImple : select");
		return dao.read(userid);
	}
	

}
