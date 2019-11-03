package com.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.zerock.domain.BoardVO;
import com.zerock.domain.Criteria;
import com.zerock.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace="com.zerock.mapper.BoardMapper";
	
	@Override
	public void create(BoardVO vo) throws Exception {
		
		session.insert(namespace+".create",vo);
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".read",bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete",bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAll");
	}
	
	@Override
	public List<BoardVO> listPage(int page)throws Exception{
		if(page<=0)
		{
			page=1;
		}
		page=(page-1)*10;
		return session.selectList(namespace+".listPage",page);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception{
		return session.selectList(namespace+".listCriteria",cri);
	}
	
	@Override
	public int countPaging(Criteria cri)throws Exception{
		return session.selectOne(namespace+".countPaging",cri);
	}
	@Override
	public List<BoardVO> listSearch(SearchCriteria cri)throws Exception
	{
		return session.selectList(namespace+".listSearch",cri);
	}
	@Override
	public int listSearchCount(SearchCriteria cri)throws Exception{
		return session.selectOne(namespace+".listSearchCount",cri);
	}
	
	@Override
	public void addAttach(String fullName,Integer bno) throws Exception{
		System.out.println("hi");
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("fullName", fullName);
		paramMap.put("bno", bno);
		
		//return session.selectList(namespace+".listPage2",paramMap);
		//session.insert(namespace+".addAttach",fullName);
		session.insert(namespace+".addAttach",paramMap);
	}
	
	
	@Override
	public List<String> getAttach(Integer bno)throws Exception{
		System.out.println("hiadsadad");

		return session.selectList(namespace+".getAttach",bno);
	}
	
	@Override
	public void deleteAttach(Integer bno)throws Exception{
		
		session.delete(namespace+".deleteAttach",bno);
	};
	
	@Override
	public void replaceAttach(String fullName,Integer bno)throws Exception{
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		
		paramMap.put("fullName", fullName);
		paramMap.put("bno", bno);
		
		session.insert(namespace+".replaceAttach",paramMap);
	}

	@Override
	public void updateReplyCnt(Integer bno,int amount)throws Exception{
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		
		paramMap.put("bno",bno);
		paramMap.put("amount",amount);
		session.update(namespace+".updateReplyCnt",paramMap);
	}
	
	@Override
	public void updateViewCnt(Integer bno)throws Exception{
		session.update(namespace+".updateViewCnt",bno);
	}

	@Override
	public int selectBoardCount(String id, Integer bno) throws Exception {
		
		Map<String,Object> param = new HashMap<>();
		param.put("id",id);
		param.put("bno",bno);
		return session.selectOne(namespace+".selectBoardCount",param);
	}

	@Override
	public void insertBordCount(String id, Integer bno) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("id",id);
		param.put("bno",bno);
		session.insert(namespace+".insertBoardCount",param);
	}
}
