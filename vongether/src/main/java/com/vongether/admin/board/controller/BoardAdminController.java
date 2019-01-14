package com.vongether.admin.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.vongether.admin.board.service.BoardAdminService;
import com.vongether.board.model.BoardVO;
import com.vongether.common.util.Pagination;
import com.vongether.common.util.interceptor.Auth;
import com.vongether.member.model.MemberVO;

@Controller
@RequestMapping("/admin/board")
public class BoardAdminController {

  @Autowired
  private BoardAdminService boardAdminService;
  
  @Auth
  @RequestMapping(value = "/list.do", method = RequestMethod.GET)
  public String listBoardAdminArticle(Model model) {
    
    List<BoardVO> articleList = boardAdminService.selectBoardList();
    model.addAttribute("articleList", articleList);
    return "board/articleList.admin";
  }
  
  @Auth
  @RequestMapping(value="/view.do", method=RequestMethod.GET)
  public String viewBoardAdminArticle(int bNo, Model model) {
      BoardVO boardVO = boardAdminService.selectBoard(bNo);
      model.addAttribute("article", boardVO);
      return "board/articleView.admin";
  }
  
  @Auth
  @RequestMapping(value="/write.do", method=RequestMethod.GET)
  public String writeBoardAdminArticleForm() {
      return "board/noticeWrite.admin";
  }
  
  @Auth
  @RequestMapping(value="/write.do", method=RequestMethod.POST)
  public String writeBoardAdminArticle(BoardVO boardVO, HttpSession session) {
      MemberVO memberVO = (MemberVO) session.getAttribute("userInfo");
      boardVO.setmId(memberVO.getmId());
      boardAdminService.insertNotice(boardVO);
      return "redirect: /admin/board/noticelist.do";
  }
  
  @Auth
  @RequestMapping(value="/noticelist.do", method=RequestMethod.GET)
  public String listNoticeAdminArticle(@RequestParam(defaultValue="1")int pageNo, @RequestParam(defaultValue="") String keyword, Model model) {
      Map<String, Object> map = new HashMap<String, Object>();
      int listCount = boardAdminService.selectNoticeCnt();
      Pagination pagination = new Pagination(listCount, pageNo, 10);
      map.put("pagination", pagination);
      map.put("keyword", keyword);
      List<BoardVO> noticeList = boardAdminService.selectNoticeList(map);
      model.addAttribute("noticeList", noticeList);
      model.addAttribute("pagination", pagination);
      return "board/noticeList.admin";
  }
  
  @Auth
  @RequestMapping(value="/ajaxnoticelist.do", method=RequestMethod.GET)
  public @ResponseBody Map<String, Object> ajaxListNoticeAdminArticle(@RequestParam(defaultValue="1")int pageNo, @RequestParam(defaultValue="") String keyword) {
      System.out.println(keyword);
      Map<String, Object> map = new HashMap<String, Object>();
      int listCount = boardAdminService.selectNoticeCnt();
      Pagination pagination = new Pagination(listCount, pageNo, 10);
      map.put("pagination", pagination);
      map.put("keyword", keyword);
      List<BoardVO> noticeList = boardAdminService.selectNoticeList(map);
      map.put("noticeList", noticeList);
      return map;
  }


}
