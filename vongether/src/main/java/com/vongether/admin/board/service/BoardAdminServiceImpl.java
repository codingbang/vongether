package com.vongether.admin.board.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vongether.admin.board.dao.BoardAdminDAO;
import com.vongether.board.model.BoardVO;

@Service
public class BoardAdminServiceImpl implements BoardAdminService {
  
  @Autowired
  SqlSession sqlSession;

  @Override
  public List<BoardVO> selectBoardList(Map<String, Object> map) {
    return sqlSession.getMapper(BoardAdminDAO.class).selectBoardList(map);
  }

  @Override
  public BoardVO selectBoard(int bNo) {
    return sqlSession.getMapper(BoardAdminDAO.class).selectBoard(bNo);
  }

  @Override
  public void insertNotice(BoardVO boardVO) {
    sqlSession.getMapper(BoardAdminDAO.class).insertNotice(boardVO);
  }

  @Override
  public List<BoardVO> selectNoticeList(Map<String, Object> map) {
    return sqlSession.getMapper(BoardAdminDAO.class).selectNoticeList(map);
  }

  @Override
  public int selectBoardCnt(Map<String, Object> map) {
    return sqlSession.getMapper(BoardAdminDAO.class).selectBoardCnt(map);
  }

  @Override
  public int selectNoticeCnt(Map<String, Object> map) {
    return sqlSession.getMapper(BoardAdminDAO.class).selectNoticeCnt(map);
  }

  @Override
  public void deleteBoard(int bNo) {
    sqlSession.getMapper(BoardAdminDAO.class).deleteBoard(bNo);
    
  }

}
