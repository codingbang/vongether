package com.vongether.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vongether.board.model.BoardVO;
import com.vongether.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

//  @Autowired
//  private CommonService commonService;
  @Autowired
  private BoardService boardService;

//  @RequestMapping(value ="/list.do" , method = RequestMethod.GET) 
//  public ModelAndView articleList(@RequestParam Map<String, String> param){
//	ModelAndView mv = new ModelAndView();
//	PageNavigation pageNavigation = commonService.makePageNavigation(param);
//	pageNavigation.makeNavigator();
//	
//	mv.addObject("pageNavigation", pageNavigation);
//	mv.setViewName("board/articleList.page");
//    return mv;
//  }
	@RequestMapping(value ="/list.do" , method = RequestMethod.GET) 
	public ModelAndView listArticle(@RequestParam Map<String, String> param) {
		ModelAndView mv = new ModelAndView();
		List<BoardVO> list = boardService.selectBoardList();
		mv.addObject("selectBoardList", list);
		mv.setViewName("board/articleList.page");
		return mv;
	}
	/*@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String writeArticle(@RequestParam int bNo) {
		
		return "board/articleWrite.page";
	}*/
	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public String view(@RequestParam int bNo, Model model) {
		BoardVO boardVO = boardService.selectBoardArticle(bNo);
		model.addAttribute("article", boardVO);
		return "board/articleView.page";
	}  
}
