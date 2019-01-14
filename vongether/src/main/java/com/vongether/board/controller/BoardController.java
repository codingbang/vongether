package com.vongether.board.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.vongether.board.model.BoardVO;
import com.vongether.board.service.BoardService;
import com.vongether.common.util.BoardConstance;
import com.vongether.common.util.Pagination;
import com.vongether.member.model.MemberVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value ="/list.do" , method = RequestMethod.GET)
	public String listBoardArticle(@RequestParam Map<String, Object> param,@RequestParam(defaultValue="1") int pageNo, Model model) {
		List<BoardVO> listArticle = boardService.selectBoardList(param, pageNo);
		model.addAttribute("selectBoardList", listArticle);
		int totalArticleCount = listArticle.size();
		Pagination pagination = new Pagination(totalArticleCount , pageNo, 10);
		model.addAttribute("pagination", pagination);
		return "board/articleList.page";
	}
	@RequestMapping(value ="/listAjax.do" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> ajaxListBoardArticle(@RequestParam Map<String, Object> param, @RequestParam int pageNo) {
		
		int totalArticleCount = boardService.totalBoardArticleCount();
		Pagination pagination = new Pagination(totalArticleCount , pageNo, 10);
		Map<String, Object> map = new HashMap<String, Object>();
		List<BoardVO> listAjaxArticle = boardService.selectBoardList(param, pageNo);
		map.put("listAjaxArticle", listAjaxArticle);
		map.put("pagination", pagination);
		
		return map;
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String writeBoardArticle() {
		System.out.println("안녕");
		return "board/articleWrite.page";
	}
	
	@RequestMapping(value="write.do", method=RequestMethod.POST)
	public String writeBoardArticle(BoardVO boardVO, HttpSession session, Model model) {
	    MemberVO memberVO = (MemberVO) session.getAttribute("userInfo");
	    if (memberVO != null) {
	      boardVO.setmId(memberVO.getmId());
	      System.out.println(memberVO.getmId());
	      System.out.println(boardVO.getmId());
	      boardService.writeBoardArticle(boardVO);
	    }
		return "redirect:/board/list.do";
	}
	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public String viewBoardArticle(@RequestParam int bNo, HttpSession session, Model model) {
		BoardVO boardVO = boardService.selectBoardArticle(bNo);
		model.addAttribute("article", boardVO);
		boardService.increaseHitcount(boardVO.getbNo());
		return "board/articleView.page";
	}  
	@RequestMapping(value="/update.do", method=RequestMethod.GET)
	public String updateBoardArticleForm(@RequestParam int bNo, Model model) {
		BoardVO boardVO = boardService.selectBoardArticle(bNo);
		model.addAttribute("article", boardVO);
		return "board/articleUpdate.page";
	} 
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String updateBoardArticle(BoardVO boardVO) {
		System.out.println(boardVO.getbContent());
		boardService.updateBoardArticle(boardVO);
		return "redirect:/board/list.do";
	}  
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String deleteBoardArticle(@RequestParam int bNo) {
		boardService.deleteBoardArticle(bNo);
		return "redirect:/board/list.do";
	} 
}
