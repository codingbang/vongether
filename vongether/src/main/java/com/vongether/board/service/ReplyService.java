package com.vongether.board.service;

import java.util.List;

import com.vongether.board.model.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> selectReplyList(int bNo);
	public int totalReplyCount(int bNo);
	public void writeReply(ReplyVO replyVO);
	public void deleteReply(int rNo);
	/*
	public BoardVO selectBoardArticle(int bNo);
	public int writeBoardArticle(BoardVO boardVO);
	public void updateBoardArticle(BoardVO boardVO);
	public void increaseHitcount(int bNo);
	*/
}
