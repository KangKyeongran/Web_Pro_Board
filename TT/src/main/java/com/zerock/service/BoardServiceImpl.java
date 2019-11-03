package com.zerock.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.BoardVO;
import com.zerock.domain.Criteria;
import com.zerock.domain.SearchCriteria;
import com.zerock.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Transactional
	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board);
	
		System.out.println(board.getBno());
		String[] files = board.getFiles();

		if(files == null) {return;}
		
		for (String fileName : files) {
			System.out.println(fileName);

			dao.addAttach(fileName,board.getBno());
		}
	}
@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(Map<String,Object> map) throws Exception {
		if(map.get("id")!= null) {
			int count = dao.selectBoardCount(map.get("id").toString(), Integer.parseInt(map.get("bno").toString()));
			
			if (count == 0) {
				dao.updateViewCnt(Integer.parseInt(map.get("bno").toString()));	
				dao.insertBordCount(map.get("id").toString(), Integer.parseInt(map.get("bno").toString()));
			}
			else {
			}

			return dao.read(Integer.parseInt(map.get("bno").toString()));

		}
		else {
			return dao.read(Integer.parseInt(map.get("bno").toString()));
		}
		
	}
@Transactional
	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);
		
		Integer bno = board.getBno();
		dao.deleteAttach(bno);
		
		String[] files= board.getFiles();
		if(files == null) {return;}
		
		for(String fileName : files) {
			System.out.println(fileName);
			System.out.println(bno);
			dao.replaceAttach(fileName, bno);
		}
}
@Transactional
	@Override
	public void remove(Integer bno) throws Exception {
	dao.deleteAttach(bno);	
	dao.delete(bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri)throws Exception{
		return dao.listCriteria(cri);
	}
	
	@Override
	public int listCountCriteria(Criteria cri) throws Exception{
		return dao.countPaging(cri);
	}
	
	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri)
	throws Exception{
		return dao.listSearch(cri);
	}
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception{
		return dao.listSearchCount(cri);
	}
	@Override
	public List<String> getAttach(Integer bno)throws Exception{
		return dao.getAttach(bno);
	}
	@Override
	public int selectBoardCount(String id, Integer bno) throws Exception {
		return dao.selectBoardCount(id, bno);
	}
	@Override
	public void insertBordCount(String id, Integer bno) throws Exception {
		dao.insertBordCount(id, bno);
	}
	
}
