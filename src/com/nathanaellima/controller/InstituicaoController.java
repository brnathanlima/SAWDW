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

import com.nathanaellima.model.InstituicaoDAO;
import com.nathanaellima.modelo.Instituicao;

@WebServlet("/InstituicaoController")
public class InstituicaoController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Connection conexao = (Connection) getServletContext().getAttribute("ConexaoComBD");
		
		InstituicaoDAO instituicaoDAO = null;
		Instituicao instituicao = null;
		List<Instituicao> instituicoes = null;
		
		Long id = null;
		String nomeFantasia = null;
		String nomeEmpresarial = null;
		String cnpj = null;
		String setorDeAtuacao = null;
		String endereco = null;
		String cidade = null;
		String estado = null;
		String telefone = null;
		Date dataDeRegistro = null;
		Date dataDeModificacao = null;
		
		String acao = req.getParameter("acao");
		
		try {
			
			switch(acao) {
			
			case "cadastrar":
				
				nomeFantasia = req.getParameter("nomeFantasia");
				nomeEmpresarial = req.getParameter("nomeEmpresarial");
				cnpj = req.getParameter("cnpj");
				setorDeAtuacao = req.getParameter("setorDeAtuacao");
				endereco = req.getParameter("endereco");
				cidade = req.getParameter("cidade");
				estado = req.getParameter("estado");
				telefone = req.getParameter("telefone");
				dataDeRegistro = new Date();
				
				instituicao = new Instituicao();
				
				instituicao.setNomeFantasia(nomeFantasia);
				instituicao.setNomeEmpresarial(nomeEmpresarial);
				instituicao.setCnpj(cnpj);
				instituicao.setSetorDeAtuacao(setorDeAtuacao);
				instituicao.setEndereco(endereco);
				instituicao.setCidade(cidade);
				instituicao.setEstado(estado);
				instituicao.setTelefone(telefone);
				instituicao.setDataDeRegistro(dataDeRegistro);
				
				instituicaoDAO = new InstituicaoDAO(conexao);
				
				instituicaoDAO.adicionar(instituicao);
				instituicoes = instituicaoDAO.listar();
				
				req.setAttribute("instituicoes", instituicoes);
				req.setAttribute("successMessage", "Instituição cadastrada com sucesso.");
				req.getRequestDispatcher("lista-de-instituicoes.jsp").forward(req, res);
				
				break;
				
			case "visualizar":
				
				long idInstituicao = Long.parseLong(req.getParameter("id"));
				
				instituicaoDAO = new InstituicaoDAO(conexao);
				
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(idInstituicao);
				
				req.setAttribute("instituicao", instituicao);
				req.getRequestDispatcher("cadastro-instituicao.jsp").forward(req, res);
				
				break;
				
			case "editar":
				
				id = Long.parseLong(req.getParameter("id"));
				nomeFantasia = req.getParameter("nomeFantasia");
				nomeEmpresarial = req.getParameter("nomeEmpresarial");
				cnpj = req.getParameter("cnpj");
				setorDeAtuacao = req.getParameter("setorDeAtuacao");
				endereco = req.getParameter("endereco");
				cidade = req.getParameter("cidade");
				estado = req.getParameter("estado");
				telefone = req.getParameter("telefone");
				dataDeModificacao = new Date();
				
				instituicao = new Instituicao();
				
				instituicao.setId(id);
				instituicao.setNomeFantasia(nomeFantasia);
				instituicao.setNomeEmpresarial(nomeEmpresarial);
				instituicao.setCnpj(cnpj);
				instituicao.setSetorDeAtuacao(setorDeAtuacao);
				instituicao.setEndereco(endereco);
				instituicao.setCidade(cidade);
				instituicao.setEstado(estado);
				instituicao.setTelefone(telefone);
				instituicao.setDataDeModificacao(dataDeModificacao);
				
				instituicaoDAO = new InstituicaoDAO(conexao);

				instituicaoDAO.editar(instituicao);
				
				req.setAttribute("instituicao", instituicao);
				req.setAttribute("successMessage", "Cadastro atualizado.");
				req.getRequestDispatcher("cadastro-instituicao.jsp").forward(req, res);
				
				break;
			
			case "excluir":
				
				id = Long.parseLong(req.getParameter("id"));
				
				instituicaoDAO = new InstituicaoDAO(conexao);

				instituicaoDAO.excluir(id);
				instituicoes = instituicaoDAO.listar();
				
				req.setAttribute("instituicoes", instituicoes);
				req.setAttribute("successMessage", "Instituição excluída com sucesso.");
				req.getRequestDispatcher("lista-de-instituicoes.jsp").forward(req, res);
				
				break;
				
			}
			
			
		} catch (NullPointerException e){
			
			instituicaoDAO = new InstituicaoDAO(conexao);
			
			instituicoes = instituicaoDAO.listar();
			
			req.setAttribute("instituicoes", instituicoes);
			req.getRequestDispatcher("lista-de-instituicoes.jsp").forward(req, res);
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}
		
	}

}
