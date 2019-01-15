package com.vongether.admin.board.service;

import java.util.List;
import java.util.Map;
import com.vongether.board.model.BoardVO;

public interface BoardAdminService {
  
  public List<BoardVO> selectBoardList(Map<String, Object> map);
  
  public BoardVO selectBoard(int bNo);
  
  public void insertNotice(BoardVO boardVO);
  
  public List<BoardVO> selectNoticeList(Map<String, Object> map);
  
  public int selectBoardCnt(Map<String, Object> map);
  
  public int selectNoticeCnt(Map<String, Object> map);
  
}
