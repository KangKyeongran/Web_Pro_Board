package com.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.domain.Criteria;
import com.zerock.domain.ReplyVO;
import com.zerock.persistence.BoardDAO;
import com.zerock.persistence.ReplyDAO;


@Service
public class ReplySerivceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;
	
	@Inject
	private BoardDAO boardDAO;
	
	@Transactional
	@Override
	public void addReply(ReplyVO vo) throws Exception {
		dao.create(vo);
		boardDAO.updateReplyCnt(vo.getBno(), 1);
	}

	@Override
	public List<ReplyVO> listReply(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(bno);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		dao.update(vo);
	}
	@Transactional
	@Override
	public void removeReply(Integer rno) throws Exception {
		int bno= dao.getBno(rno);
		dao.delete(rno);
		boardDAO.updateReplyCnt(bno, -1);
	}

	@Override
	public List<ReplyVO> listReplyPage(Integer bno,Criteria cri)
	throws Exception{
		return dao.listPage(bno, cri);
	}
	
	@Override
	public int count(Integer bno) throws Exception{
		return dao.count(bno);
	}
}
