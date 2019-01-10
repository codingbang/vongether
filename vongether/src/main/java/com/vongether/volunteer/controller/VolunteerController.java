package com.vongether.volunteer.controller;

import java.io.IOException;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.vongether.common.util.RestCode;
import com.vongether.common.util.RestDetail;
import com.vongether.common.util.RestTest;
import com.vongether.volunteer.model.VolunteerVO;

@Controller
@RequestMapping("/volunteer")
public class VolunteerController {
  
  @RequestMapping(value="/list.do", method=RequestMethod.GET)
  public String volunteerList(Model model) {
    return "volunteer/volunteerList.page";
  }
  
  
  @RequestMapping(value="/ajaxlist.do", method=RequestMethod.GET)
  public @ResponseBody String volunteerListAjax(@RequestParam Map<String, String> param) {
    RestTest rt = null;
    try {
      rt = new RestTest(param);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return (new Gson()).toJson(rt.ja);
  }
  
  @RequestMapping(value="/ajaxGugun.do", method=RequestMethod.GET)
  public @ResponseBody String gugunListAjax(@RequestParam String param) {
    
    RestCode rc = null;
    try {
      rc = new RestCode(param);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return (new Gson()).toJson(rc.ja);
  }
  
  @RequestMapping(value="/detail.do", method=RequestMethod.GET)
  public String volunteerDetail(@RequestParam String num, Model model) {
      RestDetail rd=null;
      try {
          rd = new RestDetail(num);
      } catch (IOException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
      }
      VolunteerVO vo = new VolunteerVO();
      
      Gson gson =  new Gson();
      vo = gson.fromJson(rd.jo, VolunteerVO.class);
      if(vo.getMnnstNm().length()==0) {
    	  vo.setMnnstNm("정보없음");
      }      
      model.addAttribute("vo",vo);
      //System.out.println("volunteerDetail :: "+vo.toString());
      
      
      return "volunteer/volunteerDetail.page";
  }

}
