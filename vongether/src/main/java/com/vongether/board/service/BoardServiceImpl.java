package com.vongether.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vongether.board.dao.BoardDAO;
import com.vongether.board.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<BoardVO> selectBoardList() {
		return sqlSession.getMapper(BoardDAO.class).selectBoardList();
	}
	
	@Override
	public BoardVO selectBoardArticle(int bNo) {
		
		return sqlSession.getMapper(BoardDAO.class).selectBoardArticle(bNo);
	}

	@Override
	public int writeBoardArticle(BoardVO boardVO) {
		//int bNo = sqlSession.getMapper(BoardDAO.class).selectNextArticleNo(boardVO);
		sqlSession.getMapper(BoardDAO.class).insertBoardArticle(boardVO);
		return 1;
	}
	@Override
	public void updateBoardArticle(BoardVO boardVO) {
		sqlSession.getMapper(BoardDAO.class).updateBoardArticle(boardVO);
	}
}
