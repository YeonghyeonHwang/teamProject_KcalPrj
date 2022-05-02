package interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class ProfileInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("account") == null) {
			session.invalidate(); 
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('개인프로필 페이지는 회원만 이용 가능합니다.');");
			out.print("location.href = '" + request.getContextPath() + "/member/goLogin';");
			out.print("</script>");
			out.flush();
			
			return false;
		}
		
		return true;
	}
	
}
