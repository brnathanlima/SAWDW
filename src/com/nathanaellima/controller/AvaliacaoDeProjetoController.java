package com.nathanaellima.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nathanaellima.model.AvaliacaoDeProjetoDAO;
import com.nathanaellima.model.ProjetoDAO;
import com.nathanaellima.modelo.AvaliacaoDeProjeto;
import com.nathanaellima.modelo.Projeto;

@WebServlet(name="AvaliacaoDeProjetoController", urlPatterns= {"/avaliacaoDeProjeto"})
public class AvaliacaoDeProjetoController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Connection connection = (Connection) getServletContext().getAttribute("ConexaoComBD");
		
		AvaliacaoDeProjeto avaliacaoDeProjeto;
		Projeto projeto;
		
		AvaliacaoDeProjetoDAO avaliacaoDeProjetoDAO;
		ProjetoDAO projetoDAO;
		
		String id = null;
		String idProjeto = null;
		String titulo = null;
		String nota = null;
		String comentario = null;
		String statusDoProjeto = null;
		Date dataDeEmissao = null;
		Date dataDeModificacao = null;
		
		String acao = req.getParameter("acao");
			
		switch(acao){
		
		case "emitir":
			
			idProjeto = req.getParameter("id");
			titulo = req.getParameter("titulo");
			nota = req.getParameter("nota");
			comentario = req.getParameter("comentario");
			dataDeEmissao = new Date();
			
			statusDoProjeto = "Avaliado";
			
			projetoDAO = new ProjetoDAO(connection);
			projeto = (Projeto) projetoDAO.buscarPorId(Long.parseLong(idProjeto));
			
			avaliacaoDeProjeto = new AvaliacaoDeProjeto();
			
			avaliacaoDeProjeto.setTitulo(titulo);
			avaliacaoDeProjeto.setNota(nota);
			avaliacaoDeProjeto.setComentario(comentario);
			avaliacaoDeProjeto.setDataDeEmissao(dataDeEmissao);
			avaliacaoDeProjeto.setProjeto(projeto);
			
			avaliacaoDeProjetoDAO = new AvaliacaoDeProjetoDAO(connection);
			avaliacaoDeProjetoDAO.adicionar(avaliacaoDeProjeto);
			
			projetoDAO.mudarStatus(statusDoProjeto, projeto.getId());
			projeto = (Projeto) projetoDAO.buscarPorId(projeto.getId());
			
			req.setAttribute("successMessage", "Avaliação emitida com sucesso.");
			req.setAttribute("projeto", projeto);
			req.getRequestDispatcher("cadastro-projeto.jsp").forward(req, res);
			
			break;
			
		case "editar":
			
			id = req.getParameter("id");
			idProjeto = req.getParameter("idProjeto");
			titulo = req.getParameter("titulo");
			nota = req.getParameter("nota");
			comentario = req.getParameter("comentario");
			dataDeModificacao = new Date();
			
			avaliacaoDeProjeto = new AvaliacaoDeProjeto();
			
			avaliacaoDeProjeto.setId(Long.parseLong(id));
			avaliacaoDeProjeto.setTitulo(titulo);
			avaliacaoDeProjeto.setNota(nota);
			avaliacaoDeProjeto.setComentario(comentario);
			avaliacaoDeProjeto.setDataDeModificacao(dataDeModificacao);
			
			avaliacaoDeProjetoDAO = new AvaliacaoDeProjetoDAO(connection);
			avaliacaoDeProjetoDAO.editar(avaliacaoDeProjeto);
			
			projetoDAO = new ProjetoDAO(connection);
			
			projeto = (Projeto) projetoDAO.buscarPorId(Long.parseLong(idProjeto));
			
			req.setAttribute("successMessage", "Avaliação editada com sucesso.");
			req.setAttribute("projeto", projeto);
			req.getRequestDispatcher("cadastro-projeto.jsp").forward(req, res);
			
			
			break;
			
		case "excluir":
			
			id = req.getParameter("id");
			idProjeto = req.getParameter("idProjeto");
			
			avaliacaoDeProjetoDAO = new AvaliacaoDeProjetoDAO(connection);
			avaliacaoDeProjetoDAO.excluir(Long.parseLong(id));
			
			projetoDAO = new ProjetoDAO(connection);
			
			projeto = (Projeto) projetoDAO.buscarPorId(Long.parseLong(idProjeto));
			projetoDAO.mudarStatus("Finalizado", projeto.getId());
			projeto = (Projeto) projetoDAO.buscarPorId(projeto.getId());
			
			req.setAttribute("successMessage", "Avaliação excluída com sucesso.");
			req.setAttribute("projeto", projeto);
			req.getRequestDispatcher("cadastro-projeto.jsp").forward(req, res);
			
			break;
		
		}	
		
	}
	
}
