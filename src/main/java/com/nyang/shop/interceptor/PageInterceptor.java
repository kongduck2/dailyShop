package com.nyang.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;


public class PageInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String uri = requestURI.substring(contextPath.length() + 1)+"?";
		String param = request.getQueryString();
		
		if(param != null) {
			if(param.contains("page")) {
				String page = param.substring(param.indexOf("page="),param.indexOf("&")).substring(5); //페이지 파라미터값
				
				if(isNumber(page)) { //파라미터 값이 숫자일때
					if(Integer.parseInt(page) <= 0) {
						param = param.replace(page, "1");
						response.sendRedirect(uri+param);
						return false;
					}
					
				}else {//숫자가 아닐때
					param = param.replace(page, "1");
					response.sendRedirect(uri+param);
					return false;
				}
			}
		}
		
		return true;
	}

	   public static boolean isNumber(String str){
	        boolean result = false;
	        try{
	            Integer.parseInt(str);
	            result = true ;
	        }catch(Exception e){}
	        return result ;
	    }

}
