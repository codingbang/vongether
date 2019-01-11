package com.vongether.board.service;

import java.util.List;
import java.util.Map;

import com.vongether.board.model.BoardVO;

public interface BoardService {

	public List<BoardVO> selectBoardList(Map keyword);
	public BoardVO selectBoardArticle(int bNo);
	public int writeBoardArticle(BoardVO boardVO);
	public void updateBoardArticle(BoardVO boardVO);
	public void deleteBoardArticle(int bNo);
	
}
