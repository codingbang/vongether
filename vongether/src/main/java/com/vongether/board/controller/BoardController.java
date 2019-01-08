package com.vongether.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.vongether.test.service.TestService;

@Controller
@RequestMapping("/board")
public class BoardController {

  @Autowired
  private TestService testService;


  @RequestMapping(value ="/list.do" , method = RequestMethod.GET) 
  public String articleList(){
    return "board/articleList.page";
  }

}
