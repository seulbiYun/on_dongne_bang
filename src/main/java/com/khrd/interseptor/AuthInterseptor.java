package com.khrd.interseptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterseptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {//controller전에 호출
		
		HttpSession session = request.getSession();
		String auth = (String) session.getAttribute("Auth");
		
		if(auth == null) {//아직 로그인 전
			saveDest(request);//강제 이동전에 내 주소와 query를 기억 시킴
			//login화면으로 강제 이동 되도록 처리
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return false;//controller진입이 막히게 됨
		}
		
		return super.preHandle(request, response, handler);
	}

	private void saveDest(HttpServletRequest request) {
		String uri = request.getRequestURI();//이동 주소
		String query = request.getQueryString();//매개변수와 값
		 if(query == null || query.equals("null")) {
			 query = "";
		 }else {
			 query = "?"+query;
		 }
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			request.getSession().setAttribute("dest", uri+query);//임시저장
		}
		 
	}
}
