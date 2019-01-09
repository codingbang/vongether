package com.vongether.member.service;

import com.vongether.member.model.MemberVO;

public interface MemberService {
  int insert(MemberVO memberVO) throws Exception;
  int loginCheck(MemberVO memberVO) throws Exception;
  
}
