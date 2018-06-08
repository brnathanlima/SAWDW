package com.nathanaellima.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nathanaellima.model.ParecerDAO;
import com.nathanaellima.model.SolicitacaoDeDesenvolvimentoDAO;
import com.nathanaellima.modelo.Parecer;
import com.nathanaellima.modelo.SolicitacaoDeDesenvolvimento;

@WebServlet(name="ParecerController", urlPatterns= {"/parecer"})
public class ParecerController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Connection conexao = (Connection) getServletContext().getAttribute("ConexaoComBD");
		
		Parecer parecer;
		SolicitacaoDeDesenvolvimento solicitacaoDeDesenvolvimento;
		
		ParecerDAO parecerDAO;
		SolicitacaoDeDesenvolvimentoDAO solicitacaoDeDesenvolvimentoDAO;
		
		String id = null;
		String idSolicitacaoDeDesenvolvimento = null;
		String recomendacao = null;
		String justificativa = null;
		String statusDaSolicitacao = null;
		Date dataDeEmissao = null;
		Date dataDeModificacao = null;
		
		String acao = req.getParameter("acao");
			
		switch(acao) {
		
		case "emitir":
			
			idSolicitacaoDeDesenvolvimento = req.getParameter("idSolicitacaoDeDesenvolvimento");
			recomendacao = req.getParameter("recomendacao");
			justificativa = req.getParameter("justificativa");
			dataDeEmissao = new Date();
			
			statusDaSolicitacao = "Aguardando Avaliação";
			
			solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(conexao);
			solicitacaoDeDesenvolvimento = 
					(SolicitacaoDeDesenvolvimento) solicitacaoDeDesenvolvimentoDAO.buscarPorId(Long.parseLong(idSolicitacaoDeDesenvolvimento));
			
			parecer = new Parecer();
			
			parecer.setRecomendacao(recomendacao);
			parecer.setJustificativa(justificativa);
			parecer.setDataDeEmissao(dataDeEmissao);
			parecer.setSolicitacaoDeDesenvolvimento(solicitacaoDeDesenvolvimento);
			
			parecerDAO = new ParecerDAO(conexao);
			parecerDAO.adicionar(parecer);
			
			solicitacaoDeDesenvolvimentoDAO.mudarStatus(statusDaSolicitacao, solicitacaoDeDesenvolvimento.getId());
			solicitacaoDeDesenvolvimento = 
					(SolicitacaoDeDesenvolvimento) solicitacaoDeDesenvolvimentoDAO.buscarPorId(Long.parseLong(idSolicitacaoDeDesenvolvimento));
			
			req.setAttribute("successMessage", "Parecer emitido com sucesso.");
			req.setAttribute("solicitacaoDeDesenvolvimento", solicitacaoDeDesenvolvimento);
			req.getRequestDispatcher("cadastro-solicitacao-de-desenvolvimento.jsp").forward(req, res);
			
			break;
			
		case "editar":
			
			id = req.getParameter("id");
			idSolicitacaoDeDesenvolvimento = req.getParameter("idSolicitacaoDeDesenvolvimento");
			recomendacao = req.getParameter("recomendacao");
			justificativa = req.getParameter("justificativa");
			dataDeModificacao = new Date();
			
			parecer = new Parecer();
			
			parecer.setId(Long.parseLong(id));
			parecer.setRecomendacao(recomendacao);
			parecer.setJustificativa(justificativa);
			parecer.setDataDeModificacao(dataDeModificacao);
			
			parecerDAO = new ParecerDAO(conexao);
			parecerDAO.editar(parecer);
			
			solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(conexao);
			solicitacaoDeDesenvolvimento = 
					(SolicitacaoDeDesenvolvimento) solicitacaoDeDesenvolvimentoDAO.buscarPorId(Long.parseLong(idSolicitacaoDeDesenvolvimento));
			
			req.setAttribute("solicitacaoDeDesenvolvimento", solicitacaoDeDesenvolvimento);
			req.setAttribute("successMessage", "Edição do parecer realizada com sucesso.");
			req.getRequestDispatcher("cadastro-solicitacao-de-desenvolvimento.jsp").forward(req, res);
			
			break;
			
		case "excluir":
			
			id = req.getParameter("id");
			idSolicitacaoDeDesenvolvimento = req.getParameter("idSolicitacaoDeDesenvolvimento");
			
			statusDaSolicitacao = "Nova";
			
			parecerDAO = new ParecerDAO(conexao);
			parecerDAO.excluir(Long.parseLong(id));
			
			solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(conexao);
			solicitacaoDeDesenvolvimento = 
					(SolicitacaoDeDesenvolvimento) solicitacaoDeDesenvolvimentoDAO.buscarPorId(Long.parseLong(idSolicitacaoDeDesenvolvimento));
			solicitacaoDeDesenvolvimentoDAO.mudarStatus(statusDaSolicitacao, solicitacaoDeDesenvolvimento.getId());
			solicitacaoDeDesenvolvimento.setStatus(statusDaSolicitacao);
			
			req.setAttribute("solicitacaoDeDesenvolvimento", solicitacaoDeDesenvolvimento);
			req.setAttribute("successMessage", "Exclusão do parecer realizada com sucesso.");
			req.getRequestDispatcher("cadastro-solicitacao-de-desenvolvimento.jsp").forward(req, res);
			
			break;
			
		}
		
	}
}
