package com.vongether.member.service;

import java.util.List;
import java.util.Map;
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
import com.vongether.volunteer.model.VolunteerAppVo;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlsesssion;

	// @Autowired
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
	public MemberVO selectOne(Map<String, Object> param) throws Exception {
		return sqlsesssion.getMapper(MemberDAO.class).selectOne(param);
	}

	
	@Override
	public void userAuth(String mId) throws Exception {
		sqlsesssion.getMapper(MemberDAO.class).userAuth(mId);
	}


	@Override
	public MemberVO selectOneSearch(String param) throws Exception {
		return sqlsesssion.getMapper(MemberDAO.class).selectOneSearch(param);
	}

<<<<<<< HEAD
	@Override
	public int checkPwd(Map<String, Object> param) throws Exception {
		return sqlsesssion.getMapper(MemberDAO.class).checkPwd(param);
	}

	@Transactional
	@Override
	public void update(MemberVO memberVO) throws Exception {
		sqlsesssion.getMapper(MemberDAO.class).update(memberVO);
	}

	@Override
	public String findId(Map<String, Object> param) throws Exception {
		return sqlsesssion.getMapper(MemberDAO.class).findId(param);
	}


	@Override
	public String findPwd(Map<String, Object> param) throws Exception {
		return sqlsesssion.getMapper(MemberDAO.class).findPwd(param);
	}

	@Transactional
	@Override
	public Boolean newPwd(Map<String, Object> param) throws Exception {
		return sqlsesssion.getMapper(MemberDAO.class).newPwd(param);
	}

	@Transactional
	@Override
	public Boolean singOut(Map<String, Object> param) throws Exception {
		return sqlsesssion.getMapper(MemberDAO.class).singOut(param);
	}


	@Override
	public List<VolunteerAppVo> selectOneVList(String param) throws Exception {
		
		return sqlsesssion.getMapper(MemberDAO.class).selectOneVList(param);
	}



=======
  @Override
  public int checkPwd(Map<String, Object> param) throws Exception {
    return sqlsesssion.getMapper(MemberDAO.class).checkPwd(param);
  }

  @Transactional
  @Override
  public Boolean update(MemberVO memberVO) throws Exception {
    return sqlsesssion.getMapper(MemberDAO.class).update(memberVO);
  }

  @Override
  public String findId(Map<String, Object> param) throws Exception {
    return sqlsesssion.getMapper(MemberDAO.class).findId(param);
  }


  @Override
  public String findPwd(Map<String, Object> param) throws Exception {
    return sqlsesssion.getMapper(MemberDAO.class).findPwd(param);
  }

  @Transactional
  @Override
  public Boolean newPwd(Map<String, Object> param) throws Exception {
    return sqlsesssion.getMapper(MemberDAO.class).newPwd(param);
  }

  @Transactional
  @Override
  public Boolean singOut(Map<String, Object> param) throws Exception {
    return sqlsesssion.getMapper(MemberDAO.class).singOut(param);
  }
>>>>>>> f4843f83848eea253a185a3c17594077e00dfd79

}
