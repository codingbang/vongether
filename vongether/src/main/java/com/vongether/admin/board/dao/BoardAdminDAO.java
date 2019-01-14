package com.vongether.admin.board.dao;

import java.util.List;
import com.vongether.board.model.BoardVO;

public interface BoardAdminDAO {
  
	List<BoardVO> selectBoardList();
	
	public BoardVO selectBoard(int bNo);
	
	public void insertNotice(BoardVO boardVO);
	
	public List<BoardVO> selectNoticeList();
}
