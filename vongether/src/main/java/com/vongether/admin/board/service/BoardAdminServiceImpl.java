package com.vongether.admin.board.service;

import java.util.List;
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
  public List<BoardVO> selectBoardList() {
    return sqlSession.getMapper(BoardAdminDAO.class).selectBoardList();
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
  public List<BoardVO> selectNoticeList() {
    return sqlSession.getMapper(BoardAdminDAO.class).selectNoticeList();
  }

}
