package com.vongether.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.vongether.test.service.TestService;

@Controller
public class TestController {

  @Autowired
  private TestService testService;


  @RequestMapping(value ="test.do" , method = RequestMethod.GET) 
  public String goTestPage(){
    testService.test();
    return "test"; 
  }

  @RequestMapping("/testPage.do")
  public String testPage() {
    return "test.index";
  }



}
