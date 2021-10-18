package com.spring.myWeb.user.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.myWeb.command.UserVO;

public class UserAuthHandler extends HandlerInterceptorAdapter {

	//회원권한이 필요한 페이지 요청이 들어왔을 때 요청을 가로채 확인할 인터셉터.
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//세션에서 로그인 데이터를 얻은 후 확인
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		if(vo == null) {
			response.sendRedirect(request.getContextPath() + "/user/userLoginPage");
			return false;
		} else {
			return true;
		}
		
	}
	
	
}
