package com.vongether.member.service;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.vongether.common.util.MailHandler;
import com.vongether.common.util.TempKey;
import com.vongether.member.dao.MemberDAO;
import com.vongether.member.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {


  @Autowired
  private SqlSession sqlsesssion;

  @Inject
  private JavaMailSender mailSender;

  @Transactional
  @Override
  public void insert(MemberVO memberVO) throws Exception {
      
      // 회원가입 DAO
      sqlsesssion.getMapper(MemberDAO.class).insert(memberVO);
      
      String key = new TempKey().getKey(50, false); // 인증키 생성
      
      // 키 저장 DAO
      sqlsesssion.getMapper(MemberDAO.class).createAuthKey(memberVO.getmId(), key);
      
      MailHandler sendMail = new MailHandler(mailSender);
      sendMail.setSubject("[Vongether 서비스 이메일 인증]");
      sendMail.setText(
              new StringBuffer().append("<h1>메일인증</h1>")
              .append("<a href='http://localhost:8088/member/emailConfirm.do?mId=")
              .append(memberVO.getmId()).append("&key=").append(key)
              .append("' target='_blenk'>이메일 인증 확인</a>").toString());
      sendMail.setFrom("bongsa019@gmail.com", "봉사관리자");
      sendMail.setTo(memberVO.getmId());
      sendMail.send();
      
  }


  @Override
  public int checkId(String mId) throws Exception {
    return sqlsesssion.getMapper(MemberDAO.class).checkId(mId);
  }


  @Override
  public MemberVO selectOne(String mId) throws Exception {
    return sqlsesssion.getMapper(MemberDAO.class).selectOne(mId);
  }


  @Override
  public void userAuth(String mId) throws Exception {
    sqlsesssion.getMapper(MemberDAO.class).userAuth(mId);
  }

}
