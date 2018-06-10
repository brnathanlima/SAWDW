package com.nathanaellima.controller.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/FiltroDeAutenticacao")
public class FiltroDeAutenticacao implements Filter {

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String uri = req.getRequestURI();
		
		HttpSession session = req.getSession(false);
		
		if (uri.endsWith("jsp")) {
			
			if(session != null && session.getAttribute("tipoDeUsuario") != null) {
				
				String tipoDeUsuario = (String) session.getAttribute("tipoDeUsuario");
				
				switch(tipoDeUsuario) {
				
				case "superAdministrador":
					
					res.sendRedirect("superAdministrador?acao=visualizarPainel");
					
					break;
					
				case "administradorDeInstituicao":
					
					res.sendRedirect("administradorDeInstituicao?acao=visualizarPainel");
					
					break;
					
				case "Colaborador":
					
					res.sendRedirect("colaborador?acao=visualizarPainel");
					
					break;
					
				case "webDesigner":
					
					res.sendRedirect("webDesigner?acao=visualizarPainel");
					
					break;
					
				case "gerente":
					
					res.sendRedirect("gerente?acao=visualizarPainel");
					
					break;
				
				}
				
			} else {
				
				res.sendRedirect("acessar");
				
			}
			
		} else {
			
			chain.doFilter(request, response);
			
		}

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
