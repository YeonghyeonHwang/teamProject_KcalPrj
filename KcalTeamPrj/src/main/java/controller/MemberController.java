package controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.MemberService;
import vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	JavaMailSender mailSender; 
	
	// 로그인
	@GetMapping("/goLogin")
	public String goLogin(HttpSession session, HttpServletRequest request) {
		String uri = request.getHeader("Referer");
		if(!uri.contains("/goLogin")) {
			session.setAttribute("prevPage", request.getHeader("Referer"));
		} 
		return "login";
	}
	
	@GetMapping("/createMember")
	public String creatMember() {
		
		return "signUp";
	}
	
	@PostMapping("/signUp")
	public String signUp(MemberVO vo, HttpServletRequest request, HttpSession session) {
		String uri = request.getHeader("Referer");
		if(uri.contains("/createMember")) {
			session.setAttribute("prevPage", "/profile/main?nickname=");
			session.setAttribute("fromSignup", "true");
		} 
		
		memberService.joinMember(vo);
		return "login";
	}
	
	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession session) {
		return memberService.isLogin(vo, session);
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		session.invalidate();
		return "redirect:" + referer;
	}
	
	// 마이페이지
	@GetMapping("/mypage")
	public String mypage(Model model, @RequestParam(defaultValue = "memberInfo") String currTab) {
		model.addAttribute("currTab", currTab);
		return "mypage";
	}
	
	@ResponseBody 
	@PostMapping("/checkId")
	public String checkId(String id) {
		MemberVO vo = new MemberVO();
		vo.setId(id);
		
		return memberService.checkId(vo);
	}
	
	@ResponseBody 
	@PostMapping("/checkNickname")
	public String checkNickname(String nickname) {
		
		return memberService.checkNickname(nickname);
	}
	
	@ResponseBody 
	@PostMapping("/checkEmail")
	public String checkEmail(String email, String id) {
		MemberVO vo = new MemberVO();
		vo.setEmail(email);
		vo.setIsdelete("N");
		
		return memberService.checkEmail(vo, id);
	}
	
	@ResponseBody
	@PostMapping("/updateMember")
	public MemberVO updateMember(@RequestBody MemberVO vo, HttpSession session) {
		return memberService.updateMember(vo, session);
	}
	
	@GetMapping("/deleteMember")
	public String deleteMember(MemberVO vo, HttpSession session) {
		MemberVO mvo = (MemberVO)session.getAttribute("account");
		vo.setUnum(mvo.getUnum());
		vo.setIsdelete("Y");
		
		memberService.deleteMember(vo, session);
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	@ResponseBody
	public String signUp(@RequestParam("email") String email) throws Exception {
		int serti = (int) ((Math.random() * (99999 - 10000 + 1)) + 10000);

		String from = "miraclo999@naver.com";// 보내는 이 메일주소
		String to = email;
		String title = "회원가입시 필요한 인증번호 입니다.";
		String content = "[인증번호] " + serti + " 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
		String num = "";
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(title);
			mailHelper.setText(content, true);

			mailSender.send(mail);
			num = Integer.toString(serti);

		} catch (Exception e) {
			num = "error";
		}
		return num;
	}
	
	@ResponseBody
	@PostMapping("/findPW")
	public String findPW(String id, String email) {
		System.out.println(id);
		System.out.println(email);
		
		MemberVO vo = new MemberVO();	    
	   
		return memberService.findPW(id, email, vo);
	}
	

	// 아이디 찾기 폼
	@GetMapping("/findIdForm")
	public String findIdForm() {
		
		return "findIdForm";
	}

	@GetMapping("/findId")
	public String findId(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception {
		md.addAttribute("id", memberService.findId(response, email));
		return "findId";
	}
	
	// 비밀번호 찾기 폼
	@GetMapping("/findPwForm")
	public String findPwForm() {
		return "findPwForm";
	}
	
}
