package com.vongether.common.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	SqlSession sqlSession;
	
	/*
	@Override
	public PageNavigation makePageNavigation(Map<String, String> param) {

		PageNavigation pageNavigation = new PageNavigation();
		int totalArticleCount = sqlSession.getMapper(CommonDao.class).getTotalArticleCount(param);
		pageNavigation.setTotalArticleCount(totalArticleCount);
		int pg = Integer.parseInt(param.get("pg"));
		pageNavigation.setPageNo(pg);
		return pageNavigation;
	}
	*/

}
