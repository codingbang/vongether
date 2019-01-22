package com.vongether.admin.board.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

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
  
  @Override
  public void deleteBoardCancle(int bNo) {
    sqlSession.getMapper(BoardAdminDAO.class).deleteBoardCancle(bNo);
    
  }
  
  @Override
  public void updateNotice(BoardVO boardVO) {
    sqlSession.getMapper(BoardAdminDAO.class).updateNotice(boardVO);
  }
  
  @Override
  public List<Map<String, Object>> dayTop3(@RequestBody Map<String, Object> params){
	  if(((String)params.get("skey1")).equals("reply")) {
		  return sqlSession.getMapper(BoardAdminDAO.class).dayReplyTop3(params);
	  }else {
		  return sqlSession.getMapper(BoardAdminDAO.class).dayBoardTop3(params);
	  }
  }
  
  @Override
  public List<Map<String, Object>> weekTop3(@RequestBody Map<String, Object> params){
	  if(((String)params.get("skey1")).equals("reply")) {
		  return sqlSession.getMapper(BoardAdminDAO.class).weekReplyTop3(params);
	  }else {
		  return sqlSession.getMapper(BoardAdminDAO.class).weekBoardTop3(params);
	  }
  }
  
  @Override
  public List<Map<String, Object>> monthTop3(@RequestBody Map<String, Object> params){
	  if(((String)params.get("skey1")).equals("board")) {
		  return sqlSession.getMapper(BoardAdminDAO.class).monthReplyTop3(params);
	  }else {
		  return sqlSession.getMapper(BoardAdminDAO.class).monthBoardTop3(params);
	  }
  }
  /*@Override
  public List<Map<String, Object>> userBoardArticleCount(@RequestBody Map<String, Object> params){
	  System.out.println("monthskey2 :"+params.get("skey2"));
	  return sqlSession.getMapper(BoardAdminDAO.class).userBoardArticleCount(params);
  }
  @Override
  public List<Map<String, Object>> userReplyArticleCount(@RequestBody Map<String, Object> params){
	  System.out.println("monthskey2 :"+params.get("skey2"));
	  return sqlSession.getMapper(BoardAdminDAO.class).userReplyArticleCount(params);
  }
*/
}
