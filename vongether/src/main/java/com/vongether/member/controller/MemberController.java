package com.vongether.member.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.google.gson.Gson;
import com.vongether.member.model.MemberVO;
import com.vongether.member.model.PostVO;
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

  @RequestMapping(value = "/join.do", method = RequestMethod.POST)
  @ResponseBody
  public Map<String, String> join(@RequestBody MemberVO memberVO, Model model, RedirectAttributes rttr, HttpServletRequest request, HttpSession session) throws Exception {

    /// 가입전 유효성 체크
    
    
    // 유효 체크후 실행
    memberService.insert(memberVO);
    
    Map<String, String> map = new HashMap<String, String>();
    map.put("isSuccess", "true");
    rttr.addFlashAttribute("authmsg", "가입시 사용한 이메일로 인증");
    return map;
    
  }
  
  @RequestMapping(value = "/login.do", method = RequestMethod.GET)
  public String login() {
    return "member/login.page";
  }

  @RequestMapping(value = "/login.do", method = RequestMethod.POST)
  public String login(MemberVO memberVO, HttpSession session, Model model) throws Exception {
    int result = memberService.checkId(memberVO.getmId());
    
    if (result == 1) {
      model.addAttribute("result", result);
      model.addAttribute("memberVO", memberVO);
      session.setAttribute("userInfo", memberVO);
      return "redirect:/";
    }
    // 실패했을 경우
    else {
      session.invalidate();
      return "redirect:/login.page";
    }

  }

  @RequestMapping(value = "/logout.do")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:/";
  }
  
  @RequestMapping(value = "/emailConfirm.do")
  public String emailConfirm(String mId, Model model) throws Exception{
    memberService.userAuth(mId);
    model.addAttribute("mId", mId);
    return "member/emailConfirm.page";
  }
  
  
  @ResponseBody
  @RequestMapping(value = "/idCheck", method= RequestMethod.GET)
  public int checkId(@RequestParam("mId") String mId) throws Exception{
    return memberService.checkId(mId);
  }
  
  public static final String ZIPCODE_API_KEY = "3a167b364799b7ff01545215585606";
  public static final String ZIPCODE_API_URL = "https://biz.epost.go.kr/KpostPortal/openapi";
  
  @RequestMapping(value = "postcodelist", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public @ResponseBody String postCodeList(@RequestParam Map<String, String> param) throws Exception {
    
      Map<String, Object> paramMap = new HashMap<String, Object>();
      StringBuilder queryUrl = new StringBuilder();
      String query = param.get("query");
      int currentPage = Integer.parseInt(param.get("currentPage"));

      queryUrl.append(ZIPCODE_API_URL);
      queryUrl.append("?regkey=");
      queryUrl.append(ZIPCODE_API_KEY);
      queryUrl.append("&target=");
      queryUrl.append("postNew");
      queryUrl.append("&query=");
      queryUrl.append(URLEncoder.encode(query.replaceAll(" ", ""), "EUC-KR"));
      queryUrl.append("&countPerPage=");
      queryUrl.append("10");
      queryUrl.append("&currentPage=");
      queryUrl.append(currentPage);
      
      Document document = Jsoup.connect(queryUrl.toString()).get();
      String errorCode = document.select("error_code").text();
      
      int totalCount;
      int totalPage;
      int countPerPage;
      
      if(null == errorCode || "".equals(errorCode)) {
          Elements pageInfoElement = document.select("pageinfo");
          
          totalCount = Integer.parseInt(pageInfoElement.select("totalCount"). text());
          totalPage = Integer.parseInt(pageInfoElement.select("totalPage").text())-1;
          countPerPage = Integer.parseInt(pageInfoElement.select("countPerPage").text());

    
          if (totalCount % countPerPage > 0) {
              totalPage++;
          }

          if (totalPage < currentPage) {
              currentPage = totalPage;
          }

          int startPage = ((currentPage - 1) / countPerPage) * countPerPage + 1;
          int endPage = startPage + countPerPage - 1;
          
          if (endPage > totalPage) {
              endPage = totalPage;
          }
          
          
          Elements itemElements = document.select("item");
          List<PostVO> list = new ArrayList<PostVO>();
          PostVO postVO = null;
          
          for(Element element : itemElements){
            postVO = new PostVO();
            postVO.setZipcode(element.select("postcd").text());
            postVO.setAddress(element.select("address").text());
            list.add(postVO);
          }
          paramMap.put("postlist", list);
          paramMap.put("totalCount", totalCount);
          paramMap.put("totalPage", totalPage);
          paramMap.put("countPerPage", countPerPage);
          paramMap.put("currentPage", currentPage);
          paramMap.put("startPage", startPage);
          paramMap.put("endPage", endPage);
      }else{
          String errorMessage = document.select("message").text();
          paramMap.put("errorCode", errorCode);
          paramMap.put("errorMessage", errorMessage);
      }
      
      
      // Gson형태로 paramMap 리턴
      return (new Gson()).toJson(paramMap);

  }
  
  
}
