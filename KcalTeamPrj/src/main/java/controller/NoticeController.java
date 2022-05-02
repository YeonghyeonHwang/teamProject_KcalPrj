package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import service.BBSService;
import vo.BBSVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	BBSService bbsService;
	
	@GetMapping("/goNotice")
	public String goNotice() {
		
		return "notice";
	}
	
	@GetMapping("/create")
	public String NoticeCreate() {
		
		return "notice_create";
	}
	
	@PostMapping("/create_result")
	public String create_result(BBSVO vo) {
		bbsService.insertBBS(vo);
		
		return "notice";
	}
	
	@GetMapping("/detail")
	public String NoticeDetail(Model model, BBSVO vo) {
		bbsService.selectBBS(model, vo);
		
		return "notice_detail";
	}
	
	@GetMapping("/modify")
	public String modifyNotice(@ModelAttribute BBSVO vo, Model model) {
		bbsService.selectBBS(model, vo);
		
		return "notice_modify";
	}
	
	@PostMapping("/modify_result")
	public String modifyBBSResult(BBSVO vo, Model model) {
		int bnum = vo.getBnum();
		bbsService.updateBBS(vo, model);
		
		return "redirect:/notice/detail?bnum=" + bnum + "&curPage=curNotice";
	}

	@GetMapping("/delete")
	public String deleteNotice(BBSVO vo, HttpSession session) {
		bbsService.deleteBBS(vo, session);
		
		return "redirect:/notice/goNotice?curPage=curNotice";
	}
}
