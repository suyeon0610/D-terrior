package com.spring.myWeb.user.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.myWeb.command.UserVO;

public class BoardAuthHandler extends HandlerInterceptorAdapter {
	
	//화면에서 변경, 수정, 삭제가 일어날 때, writer값을 넘겨주도록 처리
	//게시글 수정, 삭제에 대한 권한 처리 핸들러
	//세션값과 writer(작성자) 정보가 같다면 컨트롤러를 실행,
	//그렇지 않다면 '권한이 없습니다.' 출력 후 뒤로가기.
	//권한이 없습니다 경고창은 jsp에서 했었던 PrintWriter 객체를 이용하시면 됩니다.
	//PrintWriter 객체는 response 객체에게 받아 옵니다.
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("게시판 권한 인터셉터 발동!");
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		
		System.out.println("세션에 저장된 값: " + vo);
		
		if(vo != null) {
			System.out.println("로그인 함");
			return true; //컨트롤러로 요청의 진입을 허용.
		} 
		
		System.out.println("로그인 안함");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<script> \r\n");
		out.print("alert('로그인 후 이용 가능합니다.'); \r\n");
		out.print("history.back(); \r\n");
		out.print("</script>");
		
		out.flush();
		
		return false;
	}
	
}
















