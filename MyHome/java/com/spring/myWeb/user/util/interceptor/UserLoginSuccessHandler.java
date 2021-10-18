package com.spring.myWeb.user.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.myWeb.command.UserVO;

public class UserLoginSuccessHandler extends HandlerInterceptorAdapter {

	//암호화된 비밀번호 비교를 위한 의존성주입
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	//로그인 요청 이후 인터셉터로 이동되면
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		System.out.println("로그인 인터셉터");
		
		//modelAndView 객체에 있는 모델 데이터가 map의 형식으로 반환.
		ModelMap mv = modelAndView.getModelMap();
		System.out.println("회원정보: " + mv.get("user"));
		String encPw = (String) mv.get("encPw");// 컨트롤러에서 받아온 암호화된 비밀번호
		String rawPw = (String) mv.getAttribute("rawPw"); // 컨트롤러에서 받아온 사용자가 입력한 암호화되지 않은 비밀번호
		UserVO vo = (UserVO) mv.get("user"); // 컨트롤러에서 받아온 vo
		Boolean match = passwordEncoder.matches(rawPw, encPw); // 비밀번호가 일치하면 true, 불일치시 false 반환
		if(match) { //암호화비밀번호, 사용자입력비밀번호 일치
			System.out.println("로그인 성공 로직 ");
			//로그인 성공한 회원에게 세션 데이터를 생성해서 로그인 유지를 하게 해 줌.
			HttpSession session = request.getSession();
			session.setAttribute("user", vo);
			//메인페이지로 보냄
			modelAndView.setViewName("/home");
		} else if(!match) { // 비밀번호 불일치
			System.out.println("로그인 실패 로직 ");
			modelAndView.addObject("msg", "loginFail");
			modelAndView.setViewName("/user/loginfail");
		}

	}
	
	
	
}
