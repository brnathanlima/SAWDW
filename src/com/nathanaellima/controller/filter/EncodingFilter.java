package com.nathanaellima.controller.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/EncodingFilter")
public class EncodingFilter implements Filter {

	private String encoding = "ISO-8859-1";
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		
		request.setCharacterEncoding(encoding);
		filterChain.doFilter(request, response);

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		String encodingParam = filterConfig.getInitParameter("encoding");
		
		if (encodingParam != null) {
			
			encoding = encodingParam;
			
		}

	}

}
