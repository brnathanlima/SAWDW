package com.nathanaellima.controller;

import java.io.IOException;

import java.sql.Connection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nathanaellima.factory.UsuarioFactory;
import com.nathanaellima.model.SuperAdministradorDAO;
import com.nathanaellima.modelo.SuperAdministrador;

@WebServlet(name="superAdministradorController", urlPatterns={"/superAdministrador"})
public class SuperAdministradorController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Connection conexao = (Connection) getServletContext().getAttribute("ConexaoComBD");
		
		SuperAdministradorDAO superAdministradorDAO = null;
		SuperAdministrador superAdministrador = null;
		List<SuperAdministrador> superAdministradores = null;
		
		String id = null;
		String nome = null;
		String sobrenome = null;
		String email = null;
		String telefone = null;
		String nomeDeUsuario = null;
		String senha = null;
		Date dataDeRegistro = null;
		Date dataDeModificacao = null;
		
		String acao = req.getParameter("acao");
			
		switch(acao) {
		
		case "visualizarPainel":
			
			req.getRequestDispatcher("painel-super-administrador.jsp").forward(req, res);
			
			break;
		
		case "novoCadastro":
			
			req.getRequestDispatcher("cadastro-super-administrador.jsp").forward(req, res);
			
			break;
		
		case "cadastrar":
			
			nome = req.getParameter("nome");
			sobrenome = req.getParameter("sobrenome");
			email = req.getParameter("email");
			telefone = req.getParameter("telefone");
			nomeDeUsuario = req.getParameter("nomeDeUsuario");
			senha = req.getParameter("senha");
			dataDeRegistro = new Date();
			
			superAdministrador = (SuperAdministrador) UsuarioFactory.getUsuario("superAdministrador");
			
			superAdministrador.setNome(nome);
			superAdministrador.setSobrenome(sobrenome);
			superAdministrador.setEmail(email);
			superAdministrador.setTelefone(telefone);
			superAdministrador.setNomeDeUsuario(nomeDeUsuario);
			superAdministrador.setSenha(senha);
			superAdministrador.setDataDeRegistro(dataDeRegistro);
			
			superAdministradorDAO = new SuperAdministradorDAO(conexao);
			
			superAdministradorDAO.adicionar(superAdministrador);
			superAdministradores = superAdministradorDAO.listar();
			
			req.setAttribute("superAdministradores", superAdministradores);
			req.setAttribute("successMessage", "Super Administrador cadastrado com sucesso.");
			req.getRequestDispatcher("lista-de-super-administradores.jsp").forward(req, res);
			
			break;
			
		case "visualizar":
			
			long idSuperAdministrador = Long.parseLong(req.getParameter("id"));
			
			superAdministradorDAO = new SuperAdministradorDAO(conexao);
			
			superAdministrador = (SuperAdministrador) superAdministradorDAO.buscarPorId(idSuperAdministrador);
			
			req.setAttribute("superAdministrador", superAdministrador);
			req.getRequestDispatcher("cadastro-super-administrador.jsp").forward(req, res);
			
			break;
			
		case "editar":
			
			id = req.getParameter("id");
			nome = req.getParameter("nome");
			sobrenome = req.getParameter("sobrenome");
			email = req.getParameter("email");
			telefone = req.getParameter("telefone");
			nomeDeUsuario = req.getParameter("nomeDeUsuario");
			senha = req.getParameter("senha");
			dataDeModificacao = new Date();
			
			superAdministrador = (SuperAdministrador) UsuarioFactory.getUsuario("superAdministrador");
			
			superAdministrador.setId(Long.parseLong(id));
			superAdministrador.setNome(nome);
			superAdministrador.setSobrenome(sobrenome);
			superAdministrador.setEmail(email);
			superAdministrador.setTelefone(telefone);
			superAdministrador.setNomeDeUsuario(nomeDeUsuario);
			superAdministrador.setSenha(senha);
			superAdministrador.setDataDeModificacao(dataDeModificacao);
			
			superAdministradorDAO = new SuperAdministradorDAO(conexao);

			superAdministradorDAO.editar(superAdministrador);
			superAdministrador = (SuperAdministrador) superAdministradorDAO.buscarPorId(Long.parseLong(id));
			
			req.setAttribute("superAdministrador", superAdministrador);
			req.setAttribute("successMessage", "Cadastro atualizado.");
			req.getRequestDispatcher("cadastro-super-administrador.jsp").forward(req, res);
			
			break;
		
		case "excluir":
			
			id = req.getParameter("id");
			
			superAdministradorDAO = new SuperAdministradorDAO(conexao);

			superAdministradorDAO.excluir(Long.parseLong(id));
			superAdministradores = superAdministradorDAO.listar();
			
			req.setAttribute("superAdministradores", superAdministradores);
			req.setAttribute("successMessage", "Super Administrador excluído com sucesso.");
			req.getRequestDispatcher("lista-de-super-administradores.jsp").forward(req, res);
			
			break;
			
		case "listar":
			
			superAdministradorDAO = new SuperAdministradorDAO(conexao);
			
			superAdministradores = superAdministradorDAO.listar();
			
			req.setAttribute("superAdministradores", superAdministradores);
			req.getRequestDispatcher("lista-de-super-administradores.jsp").forward(req, res);
			
			break;
			
		}
		
	}
	
}
