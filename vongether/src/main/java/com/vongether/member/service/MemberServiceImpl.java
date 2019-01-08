package com.vongether.member.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vongether.member.dao.MemberDAO;
import com.vongether.member.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

  
  @Autowired
  private SqlSession sqlsesssion;
  
  
  @Override
  public int insert(MemberVO memberVo) {
    
    return sqlsesssion.getMapper(MemberDAO.class).insert(memberVo);
  }

}
