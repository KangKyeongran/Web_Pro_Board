package com.zerock.service;


import java.util.List;
import java.util.Map;

import com.zerock.domain.BoardVO;
import com.zerock.domain.Criteria;
import com.zerock.domain.SearchCriteria;

public interface BoardService {

		public void regist(BoardVO board)throws Exception;
		
		public BoardVO read(Map<String,Object> map)throws Exception;
		
		public void modify(BoardVO board)throws Exception;
		
		public void remove(Integer bno)throws Exception;
		
		public List<BoardVO> listAll() throws Exception;
		
		public List<BoardVO> listCriteria(Criteria cri) throws Exception;
		
		public int listCountCriteria(Criteria cri)throws Exception;
		
		public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;
		
		public int listSearchCount(SearchCriteria cri) throws Exception;
		
		public List<String> getAttach(Integer bno)throws Exception;
		
		public int selectBoardCount(String id, Integer bno) throws Exception;

		public void insertBordCount(String id, Integer bno) throws Exception;
		
}
