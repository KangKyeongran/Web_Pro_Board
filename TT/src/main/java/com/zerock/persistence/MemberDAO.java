package com.zerock.persistence;

import com.zerock.domain.MemberVO;

public interface MemberDAO {

	public void register(MemberVO vo)throws Exception;
	
	public int checkId(MemberVO vo)throws Exception;

	public int checkLogin(MemberVO vo)throws Exception;
	
	public String getNaming(MemberVO vo)throws Exception;

	

}
