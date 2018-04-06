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

import com.nathanaellima.model.EstruturaDePaginaDAO;
import com.nathanaellima.model.EstruturaDeWebsiteDAO;
import com.nathanaellima.modelo.EstruturaDePagina;
import com.nathanaellima.modelo.EstruturaDeWebsite;

@WebServlet("/EstruturaDePaginaController")
public class EstruturaDePaginaController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Connection conexao = (Connection) getServletContext().getAttribute("ConexaoComBD");
		
		EstruturaDePagina estruturaDePagina = null;
		EstruturaDePaginaDAO estruturaDePaginaDAO = null;
		
		EstruturaDeWebsite estruturaDeWebsite = null;
		EstruturaDeWebsiteDAO estruturaDeWebsiteDAO = null;
		
		String id = null;
		String idEstruturaDeWebsite = null;
		String titulo = null;
		String conteudo = null;
		Date dataDeCriacao = null;
		Date dataDeModificacao = null;
		
		String acao = req.getParameter("acao");
		
		try {
			
			switch (acao) {
			
			case "novoCadastro":
				
				idEstruturaDeWebsite = req.getParameter("idEstruturaDeWebsite");
				
				req.setAttribute("idEstruturaDeWebsite", idEstruturaDeWebsite);
				req.getRequestDispatcher("cadastro-estrutura-de-pagina.jsp").forward(req, res);
				
				break;
			
			case "cadastrar":
				
				idEstruturaDeWebsite = req.getParameter("idEstruturaDeWebsite");
				titulo = req.getParameter("titulo");
				conteudo = req.getParameter("conteudo");
				dataDeCriacao = new Date();
				
				estruturaDePagina = new EstruturaDePagina();
				
				estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(conexao);
				estruturaDeWebsite = estruturaDeWebsiteDAO.buscarPorId(Long.parseLong(idEstruturaDeWebsite));
				
				estruturaDePagina.setEstruturaDeWebsite(estruturaDeWebsite);
				estruturaDePagina.setTitulo(titulo);
				estruturaDePagina.setConteudo(conteudo);
				estruturaDePagina.setDataDeCriacao(dataDeCriacao);
				
				estruturaDePaginaDAO = new EstruturaDePaginaDAO(conexao);
				estruturaDePaginaDAO.adicionar(estruturaDePagina);
				
				estruturaDeWebsite = estruturaDeWebsiteDAO.buscarPorId(Long.parseLong(idEstruturaDeWebsite));
				
				req.setAttribute("estruturaDeWebsite", estruturaDeWebsite);
				req.setAttribute("successMessage", "Página adicionada com sucesso à estrutura.");
				req.getRequestDispatcher("cadastro-estrutura-de-website.jsp").forward(req, res);
				
				break;
				
			case "visualizar":
				
				id = req.getParameter("idEstruturaDePagina");
				idEstruturaDeWebsite = req.getParameter("idEstruturaDeWebsite");
				
				estruturaDePaginaDAO = new EstruturaDePaginaDAO(conexao);
				estruturaDePagina = (EstruturaDePagina) estruturaDePaginaDAO.buscarPorId(Long.parseLong(id));
				
				req.setAttribute("estruturaDePagina", estruturaDePagina);
				req.setAttribute("idEstruturaDeWebsite", idEstruturaDeWebsite);
				req.getRequestDispatcher("cadastro-estrutura-de-pagina.jsp").forward(req, res);
				
				break;
				
			case "editar":
				
				id = req.getParameter("id");
				titulo = req.getParameter("titulo");
				conteudo = req.getParameter("conteudo");
				dataDeModificacao = new Date();
				
				estruturaDePagina = new EstruturaDePagina();
				
				estruturaDePagina.setId(Long.parseLong(id));
				estruturaDePagina.setTitulo(titulo);
				estruturaDePagina.setConteudo(conteudo);
				estruturaDePagina.setDataDeModificacao(dataDeModificacao);
				
				estruturaDePaginaDAO = new EstruturaDePaginaDAO(conexao);
				estruturaDePaginaDAO.editar(estruturaDePagina);
				
				req.setAttribute("estruturaDePagina", estruturaDePagina);
				req.setAttribute("successMessage", "Página editada com sucesso.");
				req.getRequestDispatcher("cadastro-estrutura-de-pagina.jsp").forward(req, res);
				
				break;
				
			case "excluir":
				
				id = req.getParameter("idEstruturaDePagina");
				idEstruturaDeWebsite = req.getParameter("idEstruturaDeWebsite");
				
				estruturaDePaginaDAO = new EstruturaDePaginaDAO(conexao);
				estruturaDePaginaDAO.excluir(Long.parseLong(id));
				
				estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(conexao);
				estruturaDeWebsite = estruturaDeWebsiteDAO.buscarPorId(Long.parseLong(idEstruturaDeWebsite));
				
				req.setAttribute("estruturaDeWebsite", estruturaDeWebsite);
				req.setAttribute("successMessage", "Página excluída com sucesso da estrutura.");
				req.getRequestDispatcher("cadastro-estrutura-de-website.jsp").forward(req, res);
				
				break;
				
			}
			
		} catch (NullPointerException e) {
			
			e.printStackTrace();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}

}
