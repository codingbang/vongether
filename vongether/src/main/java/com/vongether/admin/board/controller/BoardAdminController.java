package com.vongether.admin.board.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.vongether.admin.board.service.BoardAdminService;
import com.vongether.board.model.BoardVO;
import com.vongether.common.util.interceptor.Auth;

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


}
