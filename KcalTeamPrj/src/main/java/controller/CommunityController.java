package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import service.BBSService;
import service.CommunityService;
import vo.MemberVO;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	CommunityService communityService;
	
	@GetMapping("/main")
	public String goCommunity(Model model) {
		communityService.getRecentBBSList(model);
		communityService.getRandomMemberList(model);
		return "community";
	}
	
	@GetMapping("/bbs")
	public String headerTest(String category, Model model) {
		model.addAttribute("category", category);
		return "community_bbs";
	}
	
	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession session, HttpServletRequest request) {
		
		return communityService.isLogin(vo, session, request);
	}
}
