package com.vongether.test.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vongether.test.dao.TestDAO;

@Service
public class TestServiceImpl implements TestService{
  
  @Autowired
  private SqlSession sqlSession;
  
  @Override
  public void test() {
    sqlSession.getMapper(TestDAO.class).test();
  }

}
