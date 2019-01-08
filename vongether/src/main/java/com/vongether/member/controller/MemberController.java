package com.vongether.member.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.vongether.member.model.MemberVO;
import com.vongether.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

  @Autowired
  private MemberService memberService;
  
  @RequestMapping(value= "/join.do", method=RequestMethod.GET)
  public String join() {
    return "member/join.page";
     
  } 
  
  @RequestMapping(value= "/user/member/join.do", method=RequestMethod.POST)
  @ResponseBody
  public Map<String, String> join(@RequestBody MemberVO memberVo) {
    
    try {
      int cnt = memberService.insert(memberVo);
      
    } catch (Exception e) {
      e.printStackTrace();
    }  
    
    Map<String, String> map = new HashMap<String, String>();
    return map;
  }
  
  @RequestMapping(value= "/user/member/logout.do", method=RequestMethod.GET)
  public String logout(HttpSession httpSession) {
    httpSession.invalidate();
    return "/";
     
  } 
  
}
