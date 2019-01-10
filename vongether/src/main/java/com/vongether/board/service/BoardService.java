package com.vongether.board.service;

import java.util.List;

import com.vongether.board.model.BoardVO;

public interface BoardService {

	public List<BoardVO> selectBoardList();
	public BoardVO selectBoardArticle(int bNo);
	
}
