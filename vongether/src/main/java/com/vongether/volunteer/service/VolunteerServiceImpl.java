package com.vongether.volunteer.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vongether.volunteer.dao.VolunteerDAO;
import com.vongether.volunteer.model.VolunteerAppVo;
@Service
public class VolunteerServiceImpl implements VolunteerService{
	@Autowired
	private SqlSession sqlsesssion;
	
	@Override
	public int insert(VolunteerAppVo volunteerAppVo) throws Exception{
		
		return sqlsesssion.getMapper(VolunteerDAO.class).insert(volunteerAppVo);
				
	}
}