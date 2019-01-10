package com.vongether.common.service;

import java.util.Map;

import com.vongether.common.util.PageNavigation;

public interface CommonService {

	PageNavigation makePageNavigation(Map<String,String> param);
}
