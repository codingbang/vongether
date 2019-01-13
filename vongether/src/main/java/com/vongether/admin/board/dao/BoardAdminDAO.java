package com.vongether.admin.board.dao;

import java.util.List;
import com.vongether.board.model.BoardVO;

public interface BoardAdminDAO {
  
	List<BoardVO> selectBoardList();
	
	public BoardVO selectBoard(int bNo);

}
