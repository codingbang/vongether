package com.vongether.board.service;

import java.util.List;

import com.vongether.board.model.BoardVO;

public interface BoardService {

	public List<BoardVO> selectBoardList();
	public BoardVO selectBoardArticle(int bNo);
	public int writeBoardArticle(BoardVO boardVO);
	public void updateBoardArticle(BoardVO boardVO);
	
}
