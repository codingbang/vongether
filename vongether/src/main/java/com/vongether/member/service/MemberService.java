package com.vongether.member.service;

import java.util.Map;
import com.vongether.member.model.MemberVO;

public interface MemberService {
  
  void insert(MemberVO memberVO) throws Exception;

  int checkId(String mId) throws Exception;

  MemberVO selectOne(Map<String, Object> param) throws Exception;
  
  void userAuth(String mId) throws Exception;
}
