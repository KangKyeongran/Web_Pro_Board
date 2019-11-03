package com.zerock.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.MemberVO;
import com.zerock.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	

	
	@Override
	public void create(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		dao.register(member);
	}

	@Override
	public int check(MemberVO vo)throws Exception{
		// TODO Auto-generated method stub
		return dao.checkId(vo);
	}

	@Override
	public int checkLogin(MemberVO vo)throws Exception{
		return dao.checkLogin(vo);
	}
	@Override
	public String getNaming(MemberVO vo)throws Exception{
		return dao.getNaming(vo);
	}





}
