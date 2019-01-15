package com.vongether.board.dao;

import java.util.List;

import com.vongether.board.model.ReplyVO;

public interface ReplyDAO {
	List<ReplyVO> selectReplyList(int bNo);
	int totalReplyCount(int bNo);
	void writeReply(ReplyVO replyVO);
	void deleteReply(int rNo);
	/*
	BoardVO selectBoardArticle(int bNo);
	int selectNextArticleNo(BoardVO boardVO);
	int insertBoardArticle(BoardVO boardVO);
	void updateBoardArticle(BoardVO boardVO);
	void increaseHitcount(int bNo);
	*/
}
