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

import com.nathanaellima.factory.FuncionarioFactory;
import com.nathanaellima.model.AdministradorDeInstituicaoDAO;
import com.nathanaellima.model.InstituicaoDAO;
import com.nathanaellima.modelo.AdministradorDeInstituicao;
import com.nathanaellima.modelo.Instituicao;

@WebServlet("/AdministradorDeInstituicaoController")
public class AdministradorDeInstituicaoController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Connection conexao = (Connection) getServletContext().getAttribute("ConexaoComBD");
		
		Instituicao instituicao = null;
		InstituicaoDAO instituicaoDAO = null;
		AdministradorDeInstituicao administradorDeInstituicao = null;
		AdministradorDeInstituicaoDAO administradorDeInstituicaoDAO = null;
		
		List<AdministradorDeInstituicao> administradoresDeInstituicao = null;
		List<Instituicao> instituicoes = null;
		
		String id = null;
		String idInstituicao = null;
		String nome = null;
		String sobrenome = null;
		String matricula = null;
		String email = null;
		String telefone = null;
		String setor = null;
		String cargo = null;
		String nomeDeUsuario = null;
		String senha = null;
		Date dataDeRegistro = null;
		Date dataDeModificacao = null;
		
		String acao = req.getParameter("acao");
		
		try {
			
			switch(acao) {
			
			case "novoCadastro":
				
				instituicaoDAO = new InstituicaoDAO(conexao);
				instituicoes = instituicaoDAO.listar();
				
				req.setAttribute("instituicoes", instituicoes);
				req.getRequestDispatcher("cadastro-administrador-de-instituicao.jsp").forward(req, res);
				
				break;
				
			case "cadastrar":
				
				idInstituicao = req.getParameter("idInstituicao");
				nome = req.getParameter("nome");
				sobrenome = req.getParameter("sobrenome");
				matricula = req.getParameter("matricula");
				email = req.getParameter("email");
				telefone = req.getParameter("telefone");
				setor = req.getParameter("setor");
				cargo = req.getParameter("cargo");
				nomeDeUsuario = req.getParameter("nomeDeUsuario");
				senha = req.getParameter("senha");
				dataDeRegistro = new Date();
						
				administradorDeInstituicao = (AdministradorDeInstituicao) FuncionarioFactory.getFuncionario("administradorDeInstituicao");
				
				instituicaoDAO = new InstituicaoDAO(conexao);
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(Long.parseLong(idInstituicao));
				
				administradorDeInstituicao.setInstituicao(instituicao);
				administradorDeInstituicao.setNome(nome);
				administradorDeInstituicao.setSobrenome(sobrenome);
				administradorDeInstituicao.setMatricula(matricula);
				administradorDeInstituicao.setEmail(email);
				administradorDeInstituicao.setTelefone(telefone);
				administradorDeInstituicao.setSetor(setor);
				administradorDeInstituicao.setCargo(cargo);
				administradorDeInstituicao.setNomeDeUsuario(nomeDeUsuario);
				administradorDeInstituicao.setSenha(senha);
				administradorDeInstituicao.setDataDeRegistro(dataDeRegistro);
				
				administradorDeInstituicaoDAO = new AdministradorDeInstituicaoDAO(conexao);
				administradorDeInstituicaoDAO.adicionar(administradorDeInstituicao);
				
				administradoresDeInstituicao = administradorDeInstituicaoDAO.listar();
				
				req.setAttribute("administradoresDeInstituicao", administradoresDeInstituicao);
				req.setAttribute("successMessage", "Administrador de Instituição cadastrado com sucesso.");
				req.getRequestDispatcher("lista-de-administradores-de-instituicao.jsp").forward(req, res);
			
				break;
				
			case "visualizar":
				
				long idAdministradorDeInstituicao = Long.parseLong(req.getParameter("id"));
				
				administradorDeInstituicaoDAO = new AdministradorDeInstituicaoDAO(conexao);
				administradorDeInstituicao = (AdministradorDeInstituicao) administradorDeInstituicaoDAO.buscarPorId(idAdministradorDeInstituicao);
				
				instituicaoDAO = new InstituicaoDAO(conexao);
				instituicoes = instituicaoDAO.listar();
				
				req.setAttribute("instituicoes", instituicoes);
				req.setAttribute("administradorDeInstituicao", administradorDeInstituicao);
				req.getRequestDispatcher("cadastro-administrador-de-instituicao.jsp").forward(req, res);
				
				break;
				
			case "editar":
				
				id = req.getParameter("id");
				idInstituicao = req.getParameter("idInstituicao");
				nome = req.getParameter("nome");
				sobrenome = req.getParameter("sobrenome");
				matricula = req.getParameter("matricula");
				email = req.getParameter("email");
				telefone = req.getParameter("telefone");
				setor = req.getParameter("setor");
				cargo = req.getParameter("cargo");
				nomeDeUsuario = req.getParameter("nomeDeUsuario");
				senha = req.getParameter("senha");
				dataDeModificacao = new Date();
						
				administradorDeInstituicao = (AdministradorDeInstituicao) FuncionarioFactory.getFuncionario("administradorDeInstituicao");
				
				instituicaoDAO = new InstituicaoDAO(conexao);
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(Long.parseLong(idInstituicao));
				
				administradorDeInstituicao.setId(Long.parseLong(id));
				administradorDeInstituicao.setInstituicao(instituicao);
				administradorDeInstituicao.setNome(nome);
				administradorDeInstituicao.setSobrenome(sobrenome);
				administradorDeInstituicao.setMatricula(matricula);
				administradorDeInstituicao.setEmail(email);
				administradorDeInstituicao.setTelefone(telefone);
				administradorDeInstituicao.setSetor(setor);
				administradorDeInstituicao.setCargo(cargo);
				administradorDeInstituicao.setNomeDeUsuario(nomeDeUsuario);
				administradorDeInstituicao.setSenha(senha);
				administradorDeInstituicao.setDataDeModificacao(dataDeModificacao);
				
				administradorDeInstituicaoDAO = new AdministradorDeInstituicaoDAO(conexao);
				administradorDeInstituicaoDAO.editar(administradorDeInstituicao);
				
				instituicaoDAO = new InstituicaoDAO(conexao);
				instituicoes = instituicaoDAO.listar();
				
				req.setAttribute("instituicoes", instituicoes);
				req.setAttribute("administradorDeInstituicao", administradorDeInstituicao);
				req.setAttribute("successMessage", "Cadastro atualizado.");
				req.getRequestDispatcher("cadastro-administrador-de-instituicao.jsp").forward(req, res);
				
				break;
				
			case "excluir":
				
				id = req.getParameter("id");
				
				administradorDeInstituicaoDAO = new AdministradorDeInstituicaoDAO(conexao);
				administradorDeInstituicaoDAO.excluir(Long.parseLong(id));
				administradoresDeInstituicao = administradorDeInstituicaoDAO.listar();
				
				req.setAttribute("administradoresDeInstituicao", administradoresDeInstituicao);
				req.setAttribute("successMessage", "Administrador de Instituição excluído com sucesso.");
				req.getRequestDispatcher("lista-de-administradores-de-instituicao.jsp").forward(req, res);
			
			}
			
		} catch (NullPointerException e){
			
			administradorDeInstituicaoDAO = new AdministradorDeInstituicaoDAO(conexao);
			administradoresDeInstituicao = administradorDeInstituicaoDAO.listar();
			
			req.setAttribute("administradoresDeInstituicao", administradoresDeInstituicao);
			req.getRequestDispatcher("lista-de-administradores-de-instituicao.jsp").forward(req, res);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}
	
}
