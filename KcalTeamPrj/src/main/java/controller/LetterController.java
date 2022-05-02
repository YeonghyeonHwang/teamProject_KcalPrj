package controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.LetterService;
import vo.LetterVO;

@Controller
@RequestMapping("/letter")
public class LetterController {

	@Autowired
	LetterService letterService;


	@GetMapping("/letterList")
	public String getBBSList(Model model, String nickname, @RequestParam(defaultValue = "1") int rnum, @RequestParam(defaultValue = "1") int snum) {
		
		letterService.selectLetterList(model, nickname, rnum, snum);
		
		return "letterList";
	}
	
	@ResponseBody
	@PostMapping("/deleteLetter")
	public int deleteLetter(@RequestParam List<Integer> deleteLetterList) {
		System.out.println(deleteLetterList);
		
		int deleteCnt = letterService.deleteLetter(deleteLetterList);
		
		return deleteCnt;
	}
	
	@ResponseBody
	@PostMapping("/letterDetail")
	public LetterVO letterDetail(Model model, @RequestParam int lnum) {
	
		return letterService.selectLetterOne(model, lnum);
	}
	
	@ResponseBody
	@PostMapping("/readLetter")
	public int readLetter(@RequestParam int lnum) {
		return letterService.updateLetter(lnum);
	}
	
	@ResponseBody
	@PostMapping("/replyLetter")
	public String replyLetter(LetterVO vo) {
		System.out.println(vo.getTitle());
		System.out.println(vo.getContent());
		System.out.println(vo.getSnick());
		System.out.println(vo.getRnick());		
		
		return letterService.insertLetter(vo);
	}
}
