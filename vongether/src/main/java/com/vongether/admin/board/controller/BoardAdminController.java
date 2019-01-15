package com.vongether.admin.board.controller;

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
  @RequestMapping(value = "/articlelist.do", method = RequestMethod.GET)
  public String listBoardAdminArticle(@RequestParam Map<String, Object> params, Model model) {
    int listCount = boardAdminService.selectBoardCnt(params);
    Pagination pagination = new Pagination(listCount, 1, 10);
    params.put("pagination", pagination);
    List<BoardVO> articleList = boardAdminService.selectBoardList(params);
    model.addAttribute("articleList", articleList);
    model.addAttribute("pagination", pagination);
    return "board/articleList.admin";    
  }

  @Auth
  @RequestMapping(value="/ajaxarticlelist.do", method=RequestMethod.GET)
  public @ResponseBody Map<String, Object> ajaxListArticleAdminArticle(@RequestParam Map<String, Object> params) {
    int pageNo = 1;
    if(params.get("pageNo") != null) {
      pageNo =Integer.parseInt((params.get("pageNo").toString()));
    }

    int listCount = boardAdminService.selectBoardCnt(params);
    Pagination pagination = new Pagination(listCount, pageNo, 10);
    params.put("pagination", pagination);
    List<BoardVO> articleList = boardAdminService.selectBoardList(params);
    params.put("articleList", articleList);
    return params;
  }

  @Auth
  @RequestMapping(value="/view.do", method=RequestMethod.GET)
  public String viewBoardAdmin(int bNo, Model model) {
    BoardVO boardVO = boardAdminService.selectBoard(bNo);
    if (boardVO.getbNoticeYN() == 0) {
      model.addAttribute("article", boardVO);
      return "board/articleView.admin";
    } else {
      model.addAttribute("notice", boardVO);
      return "board/noticeView.admin";
    }
  }

  @Auth
  @RequestMapping(value="/noticewrite.do", method=RequestMethod.GET)
  public String writeBoardAdminArticleForm() {
    return "board/noticeWrite.admin";
  }

  @Auth
  @RequestMapping(value="/noticewrite.do", method=RequestMethod.POST)
  public String writeBoardAdminArticle(BoardVO boardVO, HttpSession session) {
    MemberVO memberVO = (MemberVO) session.getAttribute("userInfo");
    boardVO.setmId(memberVO.getmId());
    boardAdminService.insertNotice(boardVO);
    return "redirect: /admin/board/noticelist.do";
  }

  @Auth
  @RequestMapping(value="/noticelist.do", method=RequestMethod.GET)
  public String listNoticeAdminArticle(@RequestParam Map<String, Object> params, Model model) {
    int listCount = boardAdminService.selectNoticeCnt(params);
    Pagination pagination = new Pagination(listCount, 1, 10);
    params.put("pagination", pagination);
    List<BoardVO> noticeList = boardAdminService.selectNoticeList(params);
    model.addAttribute("noticeList", noticeList);
    model.addAttribute("pagination", pagination);
    return "board/noticeList.admin";
  }

  @Auth
  @RequestMapping(value="/ajaxnoticelist.do", method=RequestMethod.GET)
  public @ResponseBody Map<String, Object> ajaxListNoticeAdminArticle(@RequestParam Map<String, Object> params) {
    int pageNo = 1;
    if(params.get("pageNo") != null) {
      pageNo =Integer.parseInt((params.get("pageNo").toString()));
    }

    int listCount = boardAdminService.selectNoticeCnt(params);
    Pagination pagination = new Pagination(listCount, pageNo, 10);
    params.put("pagination", pagination);
    List<BoardVO> noticeList = boardAdminService.selectNoticeList(params);
    params.put("noticeList", noticeList);
    return params;
  }
  
  @Auth
  @RequestMapping(value="/boarddelete.do", method=RequestMethod.GET)
  public String deleteBoardAdminArticle(@RequestParam int bNo) {
    boardAdminService.deleteBoard(bNo);
    BoardVO boardVO = boardAdminService.selectBoard(bNo);
    if (boardVO.getbNoticeYN() == 0) {
      return "redirect:/admin/board/articlelist.do";
    } else {
      return "redirect:/admin/board/noticelist.do";
    }
   
  }
  

}
