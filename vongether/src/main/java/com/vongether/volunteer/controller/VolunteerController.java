package com.vongether.volunteer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/volunteer")
public class VolunteerController {
  
  @RequestMapping(value="/list.do", method=RequestMethod.GET)
  public String testPage() {
    return "volunteer/volunteerList.page";
  }

}
