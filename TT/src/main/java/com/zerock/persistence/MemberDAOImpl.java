package com.zerock.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.zerock.domain.MemberVO;
@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="com.zerock.mapper.MemberMapper";

	@Override
	public void register(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".register",vo);
	}

	@Override
	public int checkId(MemberVO vo)throws Exception
	{
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".checkId",vo);
	}
	@Override
	public int checkLogin(MemberVO vo)throws Exception{
		int c=session.selectOne(namespace+".checkId",vo);
		System.out.println(c);
		int b=0;
		if(c!=0) {
			b=session.selectOne(namespace+".checkLogin",vo);
			System.out.println(b);
		}
	return b+c;
	}
	@Override
	public String getNaming(MemberVO vo)throws Exception{
		return session.selectOne(namespace+".getNaming",vo);
	}


}
