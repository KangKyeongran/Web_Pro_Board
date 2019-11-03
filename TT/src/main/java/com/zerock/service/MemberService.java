package com.zerock.service;

import com.zerock.domain.MemberVO;

public interface MemberService {

	public void create(MemberVO member)throws Exception;
	
	public int check(MemberVO vo)throws Exception;

	
	public int checkLogin(MemberVO vo)throws Exception;
	
	public String getNaming(MemberVO vo)throws Exception;
	
	
	
}
