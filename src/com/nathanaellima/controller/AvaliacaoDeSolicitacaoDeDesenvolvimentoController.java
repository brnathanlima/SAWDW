package com.nathanaellima.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nathanaellima.model.AvaliacaoDeSolicitacaoDeDesenvolvimentoDAO;
import com.nathanaellima.model.SolicitacaoDeDesenvolvimentoDAO;
import com.nathanaellima.modelo.AvaliacaoDeSolicitacaoDeDesenvolvimento;
import com.nathanaellima.modelo.SolicitacaoDeDesenvolvimento;

@WebServlet("/AvaliacaoDeSolicitacaoDeDesenvolvimentoController")
public class AvaliacaoDeSolicitacaoDeDesenvolvimentoController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Connection conexao = (Connection) getServletContext().getAttribute("ConexaoComBD");
		
		AvaliacaoDeSolicitacaoDeDesenvolvimento avaliacaoDaSolicitacao;
		SolicitacaoDeDesenvolvimento solicitacaoDeDesenvolvimento;
		
		AvaliacaoDeSolicitacaoDeDesenvolvimentoDAO avaliacaoDaSolicitacaoDAO;
		SolicitacaoDeDesenvolvimentoDAO solicitacaoDeDesenvolvimentoDAO;
		
		String id = null;
		String idSolicitacaoDeDesenvolvimento = null;
		String avaliacao = null;
		String justificativa = null;
		String statusDaSolicitacao = null;
		Date dataDeEmissao = null;
		Date dataDeModificacao = null;
		
		String acao = req.getParameter("acao");
		
		try {
			
			switch(acao) {
			
			case "emitir":
				
				idSolicitacaoDeDesenvolvimento = req.getParameter("idSolicitacaoDeDesenvolvimento");
				avaliacao = req.getParameter("avaliacao");
				justificativa = req.getParameter("justificativa");
				dataDeEmissao = new Date();
				
				statusDaSolicitacao = avaliacao;
				
				solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(conexao);
				solicitacaoDeDesenvolvimento = 
						(SolicitacaoDeDesenvolvimento) solicitacaoDeDesenvolvimentoDAO.buscarPorId(Long.parseLong(idSolicitacaoDeDesenvolvimento));
				
				avaliacaoDaSolicitacao = new AvaliacaoDeSolicitacaoDeDesenvolvimento();
				
				avaliacaoDaSolicitacao.setAvaliacao(avaliacao);
				avaliacaoDaSolicitacao.setJustificativa(justificativa);
				avaliacaoDaSolicitacao.setSolicitacaoDeDesenvolvimento(solicitacaoDeDesenvolvimento);
				avaliacaoDaSolicitacao.setDataDeEmissao(dataDeEmissao);
				
				avaliacaoDaSolicitacaoDAO = new AvaliacaoDeSolicitacaoDeDesenvolvimentoDAO(conexao);
				avaliacaoDaSolicitacaoDAO.adicionar(avaliacaoDaSolicitacao);
				
				solicitacaoDeDesenvolvimentoDAO.mudarStatus(statusDaSolicitacao, solicitacaoDeDesenvolvimento.getId());
				solicitacaoDeDesenvolvimento = 
						(SolicitacaoDeDesenvolvimento) solicitacaoDeDesenvolvimentoDAO.buscarPorId(Long.parseLong(idSolicitacaoDeDesenvolvimento));
				
				req.setAttribute("successMessage", "Avaliação emitida com sucesso.");
				req.setAttribute("solicitacaoDeDesenvolvimento", solicitacaoDeDesenvolvimento);
				req.getRequestDispatcher("cadastro-solicitacao-de-desenvolvimento.jsp").forward(req, res);
				
				break;
				
			case "editar":
				
				id = req.getParameter("id");
				idSolicitacaoDeDesenvolvimento = req.getParameter("idSolicitacaoDeDesenvolvimento");
				avaliacao = req.getParameter("avaliacao");
				justificativa = req.getParameter("justificativa");
				dataDeModificacao = new Date();
				
				statusDaSolicitacao = avaliacao;
				
				avaliacaoDaSolicitacao = new AvaliacaoDeSolicitacaoDeDesenvolvimento();
				
				avaliacaoDaSolicitacao.setId(Long.parseLong(id));
				avaliacaoDaSolicitacao.setAvaliacao(avaliacao);
				avaliacaoDaSolicitacao.setJustificativa(justificativa);
				avaliacaoDaSolicitacao.setDataDeModificacao(dataDeModificacao);
				
				avaliacaoDaSolicitacaoDAO = new AvaliacaoDeSolicitacaoDeDesenvolvimentoDAO(conexao);
				avaliacaoDaSolicitacaoDAO.editar(avaliacaoDaSolicitacao);
				
				
				
				solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(conexao);
				
				solicitacaoDeDesenvolvimento = 
						(SolicitacaoDeDesenvolvimento) solicitacaoDeDesenvolvimentoDAO.buscarPorId(Long.parseLong(idSolicitacaoDeDesenvolvimento));
				
				solicitacaoDeDesenvolvimentoDAO.mudarStatus(statusDaSolicitacao, solicitacaoDeDesenvolvimento.getId());
				
				solicitacaoDeDesenvolvimento = 
						(SolicitacaoDeDesenvolvimento) solicitacaoDeDesenvolvimentoDAO.buscarPorId(Long.parseLong(idSolicitacaoDeDesenvolvimento));
				
				req.setAttribute("successMessage", "Edição da avaliação realizada com sucesso.");
				req.setAttribute("solicitacaoDeDesenvolvimento", solicitacaoDeDesenvolvimento);
				req.getRequestDispatcher("cadastro-solicitacao-de-desenvolvimento.jsp").forward(req, res);
			
				break;
				
			case "excluir":
				
				id = req.getParameter("id");
				idSolicitacaoDeDesenvolvimento = req.getParameter("idSolicitacaoDeDesenvolvimento");
				
				statusDaSolicitacao = "Aguardando Avaliação";
				
				avaliacaoDaSolicitacaoDAO = new AvaliacaoDeSolicitacaoDeDesenvolvimentoDAO(conexao);
				avaliacaoDaSolicitacaoDAO.excluir(Long.parseLong(id));
				
				solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(conexao);
				solicitacaoDeDesenvolvimento = 
						(SolicitacaoDeDesenvolvimento) solicitacaoDeDesenvolvimentoDAO.buscarPorId(Long.parseLong(idSolicitacaoDeDesenvolvimento));
				solicitacaoDeDesenvolvimentoDAO.mudarStatus(statusDaSolicitacao, solicitacaoDeDesenvolvimento.getId());
				solicitacaoDeDesenvolvimento.setStatus(statusDaSolicitacao);
				
				req.setAttribute("solicitacaoDeDesenvolvimento", solicitacaoDeDesenvolvimento);
				req.setAttribute("successMessage", "Exclusão da avaliação realizada com sucesso.");
				req.getRequestDispatcher("cadastro-solicitacao-de-desenvolvimento.jsp").forward(req, res);
				
				break;
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}
	
}
