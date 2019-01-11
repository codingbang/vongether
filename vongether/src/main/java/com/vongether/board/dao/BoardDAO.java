package com.vongether.board.dao;

import java.util.List;
import java.util.Map;

import com.vongether.board.model.BoardVO;

public interface BoardDAO {
	List<BoardVO> selectBoardList(Map keyword);
	BoardVO selectBoardArticle(int bNo);
	int selectNextArticleNo(BoardVO boardVO);
	int insertBoardArticle(BoardVO boardVO);
	void updateBoardArticle(BoardVO boardVO);
	void deleteBoardArticle(int bNo);
}
