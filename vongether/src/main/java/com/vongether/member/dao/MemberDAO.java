package com.vongether.member.dao;

import org.apache.ibatis.annotations.Param;
import com.vongether.member.model.MemberVO;

public interface MemberDAO {

  Boolean insert(MemberVO memberVO) throws Exception;

  int checkId(String mId) throws Exception;

  MemberVO selectOne(String mId) throws Exception;
  
  void createAuthKey(@Param("mId")String mId, @Param("mAuthCode")String mAuthCode) throws Exception;
  
  void userAuth(String mId) throws Exception;
}
