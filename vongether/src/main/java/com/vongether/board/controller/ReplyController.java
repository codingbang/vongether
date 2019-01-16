package com.vongether.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vongether.board.model.ReplyVO;
import com.vongether.board.service.ReplyService;
import com.vongether.member.model.MemberVO;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	ReplyService replyService;
	@Autowired
	HttpSession session;
	
	@RequestMapping(value ="/list.do" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> listReplyArticle(@RequestParam int bNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		int totalReplyCount = replyService.totalReplyCount(bNo);
		map.put("totalReplyCount", totalReplyCount);
		List<ReplyVO> listReply = replyService.selectReplyList(bNo);
		map.put("selectReplyList", listReply);
		return map;
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> writeReplyArticle(@RequestBody Map<String, Object> param) {
		Map<String,Object> map = new HashMap<String, Object>();
		MemberVO memberVO = (MemberVO) session.getAttribute("userInfo");
		ReplyVO reply = new ReplyVO();
		map.put("bNo", param.get("bNo"));
		if((memberVO == null || memberVO.equals(""))){
			return map;
		}else {
			reply.setmId(memberVO.getmId());
			reply.setbNo(Integer.parseInt(""+param.get("bNo")));
			reply.setrContent(""+param.get("rContent"));
			replyService.writeReply(reply);
			return map;
		}
	}
	@RequestMapping(value="/update.do", method=RequestMethod.PUT, headers={"Content-type=application/json"})
	public @ResponseBody Map<String,Object> updateReplyArticleForm(@RequestBody Map<String, Object> map) {
		replyService.updateReply(map);
		return map;
	} 
	  /*
	  @RequestMapping(value="memo", method=RequestMethod.PUT, headers= {"Content-type=application/json"} )
	  public @ResponseBody String modify(@RequestBody MemoDto memoDto, HttpSession session) {
	    MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
	    if (memberDto != null) {
	      memoDto.setMcode(memberDto.getM_code());
	      memoDto.setId(memberDto.getM_id());
	      memoDto.setName(memberDto.getM_name());
	      int cnt = memoService.modifyMemo(memoDto);
	    }
	    String memolist = memoService.listMemo(memoDto.getSeq());
	    return memolist;
	  }
	  */
	@RequestMapping(value="/delete.do/{bNo}/{rNo}", method=RequestMethod.DELETE)
	public @ResponseBody Map<String,Object> deleteReplyArticle(@PathVariable(value="bNo") int bNo, 
												@PathVariable(value="rNo") int rNo){
		replyService.deleteReply(rNo);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("bNo", bNo);
	    return map;
	}
}
