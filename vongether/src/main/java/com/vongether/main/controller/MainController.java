package com.vongether.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.vongether.intro.model.VisitCountVO;
import com.vongether.intro.service.IntroService;

@Controller
public class MainController {

  @Autowired
  private IntroService introService;
  
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpSession session) {
	  
	  if(session.getAttribute("visitIp") != request.getRemoteAddr()) {
        VisitCountVO visitCountVO = new VisitCountVO();
        visitCountVO.setVisitIp(request.getRemoteAddr());
        introService.visitCount(visitCountVO);
        session.setAttribute("visitIp", request.getRemoteAddr());
      }
	  
	  return "index.index";
	}
	
}
