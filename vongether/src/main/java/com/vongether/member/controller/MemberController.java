package com.vongether.member.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.vongether.member.dao.MemberDAO;
import com.vongether.member.model.MemberVO;
import com.vongether.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

  @Autowired
  private MemberService memberService;

  @RequestMapping(value = "/join.do", method = RequestMethod.GET)
  public String join() {
    return "member/join.page";

  }

  @RequestMapping(value = "/user/member/join.do", method = RequestMethod.POST)
  @ResponseBody
  public Map<String, String> join(@RequestBody MemberVO memberVO) throws Exception {

    int cnt = memberService.insert(memberVO);

    Map<String, String> map = new HashMap<String, String>();
    return map;
  }

  @RequestMapping(value = "/login.do", method = RequestMethod.GET)
  public String login() {
    return "member/login.page";
  }

  @RequestMapping(value = "/login.do", method = RequestMethod.POST)
  public String login(MemberVO memberVO, HttpSession session, Model model) throws Exception {
    System.out.println("여긴");
    int result = memberService.loginCheck(memberVO);
    model.addAttribute("result", result);
    model.addAttribute("memberVO", memberVO);

    if (result == 1) {

      session.setAttribute("userInfo", memberVO);
      System.out.println("로그인 성공");
      return "redirect:/";
    } else {
      session.invalidate();
      System.out.println("로그인 안됨");
      return "redirect:/login.page";
    }

  }

  @RequestMapping(value = "/logout.do")
  public String logout(HttpSession session) {
    session.invalidate();
    System.out.println("로그아웃했지");
    return "redirect:/";
  }

}
