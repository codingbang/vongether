package com.vongether.board.dao;

import java.util.List;

import com.vongether.board.model.BoardVO;

public interface BoardDAO {
	List<BoardVO> selectBoardList();
	BoardVO selectBoardArticle(int bNo);
	int selectNextArticleNo(BoardVO boardVO);
	int insertBoardArticle(BoardVO boardVO);
	void updateBoardArticle(BoardVO boardVO);
}
