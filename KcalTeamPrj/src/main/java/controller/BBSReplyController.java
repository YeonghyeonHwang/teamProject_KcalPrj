package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import service.BBSReplyService;
import vo.BBSReplyVO;
import vo.MemberVO;

@RestController
@RequestMapping("/reply")
public class BBSReplyController {

	@Autowired
	BBSReplyService bbsReplyService;
	
	@PostMapping("/set")
	public ResponseEntity<BBSReplyVO> setReply (@RequestBody BBSReplyVO vo, HttpSession session) {
		
		
		MemberVO mvo = (MemberVO) session.getAttribute("account");
		vo.setUnum(mvo.getUnum());
		vo.setId(mvo.getId());
		vo.setNickname(mvo.getNickname());
		
		bbsReplyService.insertReply(vo);
		
		ResponseEntity<BBSReplyVO> entity = new ResponseEntity<BBSReplyVO>(vo, HttpStatus.OK);
		
		return entity;
	}
	
	@GetMapping("/get/{bnum}")
	public ResponseEntity<List<BBSReplyVO>> getReplyList(@PathVariable int bnum) {
		
		BBSReplyVO rvo = new BBSReplyVO();
		rvo.setBnum(bnum);
		
		List<BBSReplyVO> rlist = bbsReplyService.selectReplyList(rvo);
		
		ResponseEntity<List<BBSReplyVO>> entity = new ResponseEntity<List<BBSReplyVO>>(rlist, HttpStatus.OK);
		
		return entity;
	}
	
	@DeleteMapping("/delete")
	public ResponseEntity<String> dropReply(@RequestBody BBSReplyVO vo, HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("account");
		vo.setUnum(mvo.getUnum());
		
		bbsReplyService.deleteReply(vo);
		
		String result = "삭제되었습니다.";
		
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;
	}
	
	@PatchMapping("/update")
	public ResponseEntity<BBSReplyVO> patchReply(@RequestBody BBSReplyVO vo, HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("account");
		vo.setUnum(mvo.getUnum());
		
		bbsReplyService.updateReply(vo);
		
		ResponseEntity<BBSReplyVO> entity = new ResponseEntity<BBSReplyVO>(vo, HttpStatus.OK);
		
		return entity;
	}
	
}
