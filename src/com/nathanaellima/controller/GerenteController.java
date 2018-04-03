package com.nathanaellima.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nathanaellima.factory.FuncionarioFactory;
import com.nathanaellima.model.GerenteDAO;
import com.nathanaellima.model.InstituicaoDAO;
import com.nathanaellima.modelo.AdministradorDeInstituicao;
import com.nathanaellima.modelo.Gerente;
import com.nathanaellima.modelo.Instituicao;

@WebServlet("/GerenteController")
public class GerenteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Connection conexao = (Connection) getServletContext().getAttribute("ConexaoComBD");
		
		HttpSession session = req.getSession();
		
		Instituicao instituicao = null;
		InstituicaoDAO instituicaoDAO = null;
		AdministradorDeInstituicao administradorDeInstituicao = null;
		Gerente gerente = null;
		GerenteDAO gerenteDAO = null;
		
		List<Gerente> gerentes = null;
		
		String id = null;
		String idInstituicao = null;
		String nome = null;
		String sobrenome = null;
		String matricula = null;
		String email = null;
		String telefone = null;
		String departamento = null;
		String nomeDeUsuario = null;
		String senha = null;
		Date dataDeRegistro = null;
		Date dataDeModificacao = null;
		
		String acao = req.getParameter("acao");
		
		try {
			
			switch(acao) {
				
			case "cadastrar":
				
				idInstituicao = req.getParameter("idInstituicao");
				nome = req.getParameter("nome");
				sobrenome = req.getParameter("sobrenome");
				matricula = req.getParameter("matricula");
				email = req.getParameter("email");
				telefone = req.getParameter("telefone");
				departamento = req.getParameter("departamento");
				nomeDeUsuario = req.getParameter("nomeDeUsuario");
				senha = req.getParameter("senha");
				dataDeRegistro = new Date();
						
				gerente = (Gerente) FuncionarioFactory.getFuncionario("gerente");
				
				instituicaoDAO = new InstituicaoDAO(conexao);
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(Long.parseLong(idInstituicao));
				
				gerente.setInstituicao(instituicao);
				gerente.setNome(nome);
				gerente.setSobrenome(sobrenome);
				gerente.setMatricula(matricula);
				gerente.setEmail(email);
				gerente.setTelefone(telefone);
				gerente.setDepartamento(departamento);
				gerente.setNomeDeUsuario(nomeDeUsuario);
				gerente.setSenha(senha);
				gerente.setDataDeRegistro(dataDeRegistro);
				
				gerenteDAO = new GerenteDAO(conexao);
				gerenteDAO.adicionar(gerente);
				
				administradorDeInstituicao = (AdministradorDeInstituicao) session.getAttribute("usuario");
				gerentes = gerenteDAO.listarGerentesDaInstituicao(administradorDeInstituicao.getInstituicao().getId());
				
				req.setAttribute("gerentes", gerentes);
				req.setAttribute("successMessage", "Gerente cadastrado com sucesso.");
				req.getRequestDispatcher("lista-de-gerentes.jsp").forward(req, res);
			
				break;
				
			case "visualizar":
				
				long idGerente = Long.parseLong(req.getParameter("id"));
				
				gerenteDAO = new GerenteDAO(conexao);
				gerente = (Gerente) gerenteDAO.buscarPorId(idGerente);
				
				req.setAttribute("gerente", gerente);
				req.getRequestDispatcher("cadastro-gerente.jsp").forward(req, res);
				
				break;
				
			case "editar":
				
				id = req.getParameter("id");
				idInstituicao = req.getParameter("idInstituicao");
				nome = req.getParameter("nome");
				sobrenome = req.getParameter("sobrenome");
				matricula = req.getParameter("matricula");
				email = req.getParameter("email");
				telefone = req.getParameter("telefone");
				departamento = req.getParameter("departamento");
				nomeDeUsuario = req.getParameter("nomeDeUsuario");
				senha = req.getParameter("senha");
				dataDeModificacao = new Date();
						
				gerente = (Gerente) FuncionarioFactory.getFuncionario("gerente");
				
				instituicaoDAO = new InstituicaoDAO(conexao);
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(Long.parseLong(idInstituicao));
				
				gerente.setInstituicao(instituicao);
				gerente.setId(Long.parseLong(id));
				gerente.setNome(nome);
				gerente.setSobrenome(sobrenome);
				gerente.setMatricula(matricula);
				gerente.setEmail(email);
				gerente.setTelefone(telefone);
				gerente.setDepartamento(departamento);
				gerente.setNomeDeUsuario(nomeDeUsuario);
				gerente.setSenha(senha);
				gerente.setDataDeModificacao(dataDeModificacao);
				
				gerenteDAO = new GerenteDAO(conexao);
				gerenteDAO.editar(gerente);
				
				req.setAttribute("gerente", gerente);
				req.setAttribute("successMessage", "Cadastro atualizado.");
				req.getRequestDispatcher("cadastro-gerente.jsp").forward(req, res);
				
				break;
				
			case "excluir":
				
				id = req.getParameter("id");
				
				gerenteDAO = new GerenteDAO(conexao);
				gerenteDAO.excluir(Long.parseLong(id));
				
				administradorDeInstituicao = (AdministradorDeInstituicao) session.getAttribute("usuario");
				gerentes = gerenteDAO.listarGerentesDaInstituicao(administradorDeInstituicao.getInstituicao().getId());
				
				req.setAttribute("gerentes", gerentes);
				req.setAttribute("successMessage", "Gerente excluído com sucesso.");
				req.getRequestDispatcher("lista-de-gerentes.jsp").forward(req, res);
			
			}
			
		} catch (NullPointerException e){
			
			gerenteDAO = new GerenteDAO(conexao);
			
			administradorDeInstituicao = (AdministradorDeInstituicao) session.getAttribute("usuario");
			gerentes = gerenteDAO.listarGerentesDaInstituicao(administradorDeInstituicao.getInstituicao().getId());
			
			req.setAttribute("gerentes", gerentes);
			req.getRequestDispatcher("lista-de-gerentes.jsp").forward(req, res);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}

}
