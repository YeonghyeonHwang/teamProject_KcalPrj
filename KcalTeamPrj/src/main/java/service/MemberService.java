package service;

import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	JavaMailSender mailSender; 
	
	public String isLogin(MemberVO vo, HttpSession session) {
		String uri = (String)session.getAttribute("prevPage");
		String fromSignup = (String)session.getAttribute("fromSignup");
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMemberOne", vo);
		if((vo1 == null) || (vo1.getIsdelete().equals("Y"))) {
			return "login";
		}else {
			session.setAttribute("account", vo1);
			
			if(uri.contains("profile") && (fromSignup == "true")) {
				String nickname = vo1.getNickname();
				return "redirect:" + uri + nickname;
			} else {
				return "redirect:"+ uri;				
			}
			
		}
	}
	
	public void joinMember(MemberVO vo) {
		sqlSessionTemplate.insert("member.insertMember", vo);
	}
	

	public MemberVO updateMember(MemberVO vo, HttpSession session) {
		sqlSessionTemplate.update("member.updateMember", vo);
		
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMemberList", vo);
		session.setAttribute("account", vo1);
		return vo1;
	}
	
	public void deleteMember(MemberVO vo, HttpSession session) {
		sqlSessionTemplate.update("member.updateMember", vo);
		session.invalidate();
	}

	public String checkId(MemberVO vo) {
		String check = "possible";
		int cnt = sqlSessionTemplate.selectOne("member.selectMemberCount", vo);
		
		if(cnt == 0) {
			check = "possible";
		}
		else {
			check = "impossible";
		}
		
		
		return check;
	}
	
	public String checkNickname(String nickname) {
		MemberVO vo = new MemberVO();
		vo.setNickname(nickname);
		
		String check = "possible";
		int cnt = sqlSessionTemplate.selectOne("member.selectMemberCount", vo);
		
		if(cnt == 0) {
			check = "possible";
		}
		else {
			check = "impossible";
		}
		
		return check;
	}
	
	public String checkEmail(MemberVO vo, String id) {
		String check = "possible";
		
		System.out.println(id);
		if(id == "") {
			int cnt = sqlSessionTemplate.selectOne("member.selectMemberCount", vo);
			if(cnt != 0) {
				check = "impossible";
			}else {
				check = "possible";
			}
		}else {
			MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMemberList", vo);
			if((vo1 != null) && (vo1.getId().equals(id))) {			
				check = "possible";
			}else if((vo1 != null) && (!vo1.getId().equals(id))) {
				check = "impossible";
			}else if(vo1 == null) {
				check = "possible";
			}			
		}
		
				
		return check;
	}
	
//	profile
	public void selectMember(Model model, MemberVO mvo) {
//		
		//MemberVO mvo=sqlSessionTemplate.selectOne("member.selectMember",vo);
		model.addAttribute("member",sqlSessionTemplate.selectOne("member.selectMember",mvo));
	
	}
	
	public String updateProfile(MemberVO mvo) {
		
		int i=sqlSessionTemplate.update("member.updateProfile",mvo);
		String result = "";
		
		if(i>0) {
			 result = "success";
		}
		return result;
	}
	public String updateProfileImg(MemberVO mvo) {
		
		int i=sqlSessionTemplate.update("member.updateProfileImg",mvo);
		String result = "";
		
		if(i>0) {
			 result = "success";
		}
		return result;
	}
	
	//아이디 찾기
		public String findId(String email) throws Exception {
			return sqlSessionTemplate.selectOne("member.findId", email);
		}

		public String findId(HttpServletResponse response, String email) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			String id = findId(email);

			if (id == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			} else {
				return id;
			}
		}
		
		// 비밀번호 찾기
		public String findPW(String id, String email, MemberVO vo) {
			String result = "";

			vo.setId(id);
			vo.setEmail(email);

			MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMemberOne", vo);

			if (vo1 != null) {
				// 임시비번
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}

				vo1.setPassword(pw);
				sqlSessionTemplate.update("member.updateMember", vo1);

				String from = "miraclo999@naver.com";
				String to = email;
				String title = "[확찐자구조대]임시비밀번호입니다.";
				String content = "[임시비밀번호]" + pw + " 입니다.<br/>임시비밀번호로 로그인 후 비밀번호를 변경해주세요.";

				try {
					MimeMessage mail = mailSender.createMimeMessage();
					MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

					mailHelper.setFrom(from);
					mailHelper.setTo(to);
					mailHelper.setSubject(title);
					mailHelper.setText(content, true);

					mailSender.send(mail);
					result = "success";

				} catch (Exception e) {
					result = "error";
				}

			}

			return result;

		}

}
