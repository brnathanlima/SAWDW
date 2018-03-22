package com.nathanaellima.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nathanaellima.model.SuperAdministradorDAO;
import com.nathanaellima.modelo.SuperAdministrador;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tipoDeUsuario = request.getParameter("tipoDeUsuario");
		String nomeDeUsuario = request.getParameter("nomeDeUsuario");
		String senha = request.getParameter("senha");
		String erroMsg = null;
		
		if (nomeDeUsuario == null) {
			
			erroMsg = "O Nome de Usuário não pode ser Nulo";
			
		} 
		
		if (senha == null) {
			
			erroMsg = "A senha não pode estar vazia";
			
		}
		
		if (erroMsg != null) {
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
			rd.include(request, response);
			
		} else {
			
			Connection conexao = (Connection) getServletContext().getAttribute("ConexaoComBD");
			
			switch(tipoDeUsuario) {
			
			case "superAdministrador":
				
				SuperAdministradorDAO superAdministradorDAO = new SuperAdministradorDAO(conexao);
				
				SuperAdministrador superAdministrador = (SuperAdministrador) superAdministradorDAO.autenticarUsuario(nomeDeUsuario, senha);
				
				if(superAdministrador != null) {
					
					HttpSession session = request.getSession();
					session.setAttribute("Usuario", superAdministrador);
					response.sendRedirect("painel-super-administrador.jsp");
					
				} else {
					
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
					rd.include(request, response);
					
				}
				
				break;
			
			}
			
		}
		
	}
	
}
