package com.vongether.member.dao;

import com.vongether.member.model.MemberVO;

public interface MemberDAO {

  int insert(MemberVO memberVO) throws Exception;

  int loginCheck(MemberVO memberVO) throws Exception;
}
