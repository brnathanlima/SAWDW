package com.nathanaellima.controller;

import java.io.IOException;

import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nathanaellima.model.AdministradorDeInstituicaoDAO;
import com.nathanaellima.model.ColaboradorDAO;
import com.nathanaellima.model.GerenteDAO;
import com.nathanaellima.model.SuperAdministradorDAO;
import com.nathanaellima.model.WebDesignerDAO;
import com.nathanaellima.modelo.AdministradorDeInstituicao;
import com.nathanaellima.modelo.Colaborador;
import com.nathanaellima.modelo.Gerente;
import com.nathanaellima.modelo.SuperAdministrador;
import com.nathanaellima.modelo.WebDesigner;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SuperAdministrador superAdministrador = null;
		AdministradorDeInstituicao administradorDeInstituicao = null;
		WebDesigner webDesigner = null;
		Colaborador colaborador = null;
		Gerente gerente = null;
		
		String tipoDeUsuario = request.getParameter("tipoDeUsuario");
		String nomeDeUsuario = request.getParameter("nomeDeUsuario");
		String senha = request.getParameter("senha");
		String errorMessage = null;
		
		HttpSession session = null;
	
		if (nomeDeUsuario == "") {
			
			errorMessage = "Por favor, digite seu nome de usu�rio";
			
			if (senha == "") {
				
				errorMessage = "Por favor, digite seu nome de usu�rio e senha";
				
			}
			
		} else if (senha == "") {
			
			errorMessage = "Por favor, digite sua senha";
			
		}
		
		if (errorMessage != null) {
			
			session = request.getSession();
			session.setAttribute("errorMessage", errorMessage);
			response.sendRedirect("acessar");
			
		} else {
			
			Connection conexao = (Connection) getServletContext().getAttribute("ConexaoComBD");
			
			session = request.getSession();
			session.setAttribute("tipoDeUsuario", tipoDeUsuario);
			
			switch(tipoDeUsuario) {
			
			case "superAdministrador":
				
				SuperAdministradorDAO superAdministradorDAO = new SuperAdministradorDAO(conexao);
				superAdministrador = (SuperAdministrador) superAdministradorDAO.autenticarUsuario(nomeDeUsuario, senha);
				
				if (superAdministrador != null) {
					
					session.setAttribute("usuario", superAdministrador);
					response.sendRedirect("superAdministrador?acao=visualizarPainel");
					
				} else {
					
					session.setAttribute("errorMessage", "Nome de usu�rio ou senha inv�lidos");
					response.sendRedirect("acessar");
					
				}
				
				break;
			
			case "administradorDeInstituicao":
				
				AdministradorDeInstituicaoDAO administradorDeInstituicaoDAO = new AdministradorDeInstituicaoDAO(conexao);
				administradorDeInstituicao = (AdministradorDeInstituicao) 
						administradorDeInstituicaoDAO.autenticarUsuario(nomeDeUsuario, senha);
				
				if (administradorDeInstituicao != null) {
					
					session.setAttribute("usuario", administradorDeInstituicao);
					response.sendRedirect("administradorDeInstituicao?acao=visualizarPainel");
					
				} else {
					
					session.setAttribute("errorMessage", "Nome de usu�rio ou senha inv�lidos");
					response.sendRedirect("acessar");
					
				}
				
				break;
				
			case "colaborador":
				
				ColaboradorDAO colaboradorDAO = new ColaboradorDAO(conexao);
				colaborador = (Colaborador) colaboradorDAO.autenticarUsuario(nomeDeUsuario, senha);
				
				if (colaborador != null) {
					
					session.setAttribute("usuario", colaborador);
					response.sendRedirect("colaborador?acao=visualizarPainel");
					
				} else {
					
					session.setAttribute("errorMessage", "Nome de usu�rio ou senha inv�lidos");
					response.sendRedirect("acessar");
					
				}
				
				break;
			
			case "webDesigner":
				
				WebDesignerDAO webDesignerDAO = new WebDesignerDAO(conexao);
				webDesigner = (WebDesigner) webDesignerDAO.autenticarUsuario(nomeDeUsuario, senha);
				
				if (webDesigner != null) {
					
					session.setAttribute("usuario", webDesigner);
					response.sendRedirect("webDesigner?acao=visualizarPainel");
					
				} else {
					
					session.setAttribute("errorMessage", "Nome de usu�rio ou senha inv�lidos");
					response.sendRedirect("acessar");
					
				}
				
				break;
			
			case "gerente":
				
				GerenteDAO gerenteDAO = new GerenteDAO(conexao);
				gerente = (Gerente) gerenteDAO.autenticarUsuario(nomeDeUsuario, senha);
				
				if (gerente != null) {
					
					session.setAttribute("usuario", gerente);
					response.sendRedirect("gerente?acao=visualizarPainel");
					
				} else {
					
					session.setAttribute("errorMessage", "Nome de usu�rio ou senha inv�lidos");
					response.sendRedirect("acessar");
					
				}
				
				break;
			
			}
			
		}
		
	}
	
}
