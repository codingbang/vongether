package com.vongether.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vongether.board.dao.ReplyDAO;
import com.vongether.board.model.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ReplyVO> selectReplyList(int bNo){
		return sqlSession.getMapper(ReplyDAO.class).selectReplyList(bNo);
	}
	@Override
	public int totalReplyCount(int bNo) {
		return sqlSession.getMapper(ReplyDAO.class).totalReplyCount(bNo);
	}
	@Override
	public void writeReply(ReplyVO replyVO){
		sqlSession.getMapper(ReplyDAO.class).writeReply(replyVO);
	}
	@Override
	public void deleteReply(int rNo) {
		sqlSession.getMapper(ReplyDAO.class).deleteReply(rNo);
	}
	/*
	@Override
	public void updateBoardArticle(BoardVO boardVO) {
		sqlSession.getMapper(BoardDAO.class).updateBoardArticle(boardVO);
	}
	@Override
	public void increaseHitcount(int bNo) {
		sqlSession.getMapper(BoardDAO.class).increaseHitcount(bNo);
	}
	 */
}
