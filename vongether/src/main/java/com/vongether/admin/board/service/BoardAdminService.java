package com.vongether.admin.board.service;

import java.util.List;
import com.vongether.board.model.BoardVO;

public interface BoardAdminService {
  
  public List<BoardVO> selectBoardList();
  
  public BoardVO selectBoard(int bNo);

}
