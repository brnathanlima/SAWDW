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

import com.nathanaellima.model.CategoriaDAO;
import com.nathanaellima.model.EstruturaDeWebsiteDAO;
import com.nathanaellima.modelo.Categoria;
import com.nathanaellima.modelo.EstruturaDeWebsite;
import com.nathanaellima.modelo.WebDesigner;

@WebServlet("/EstruturaDeWebsiteController")
public class EstruturaDeWebsiteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Connection conexao = (Connection) getServletContext().getAttribute("ConexaoComBD");
		HttpSession session = req.getSession();
		
		WebDesigner webDesigner = (WebDesigner) session.getAttribute("usuario");;
		
		EstruturaDeWebsite estruturaDeWebsite = null;
		EstruturaDeWebsiteDAO estruturaDeWebsiteDAO = null;
		Categoria categoria = null;
		CategoriaDAO categoriaDAO = null;
		
		List<EstruturaDeWebsite> estruturasDeWebsites = null;
		List<Categoria> categorias = null;
		
		String id = null;
		String idCategoria = null;
		String nome = null;
		String descricao = null;
		Date dataDeCriacao = null;
		Date dataDeModificacao = null;
		
		String acao = req.getParameter("acao");
		
		try {
			
			switch (acao) {
			
			case "novoCadastro":
				
				categoriaDAO = new CategoriaDAO(conexao);
				categorias = categoriaDAO.listarCategoriasDaInstituicao(webDesigner.getInstituicao().getId());
				
				req.setAttribute("categorias", categorias);
				req.getRequestDispatcher("cadastro-estrutura-de-website.jsp").forward(req, res);
				
				break;
				
			case "cadastrar":
				
				idCategoria = req.getParameter("idCategoria");
				nome = req.getParameter("nome");
				descricao = req.getParameter("descricao");
				dataDeCriacao = new Date();
				
				estruturaDeWebsite = new EstruturaDeWebsite();
				
				categoriaDAO = new CategoriaDAO(conexao);
				categoria = (Categoria) categoriaDAO.buscarPorId(Long.parseLong(idCategoria));
				
				estruturaDeWebsite.setCategoria(categoria);
				estruturaDeWebsite.setNome(nome);
				estruturaDeWebsite.setDescricao(descricao);
				estruturaDeWebsite.setDataDeCriacao(dataDeCriacao);
				
				estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(conexao);
				estruturaDeWebsiteDAO.adicionar(estruturaDeWebsite);
				
				estruturasDeWebsites = estruturaDeWebsiteDAO.listarEstruturasDeWebsitesDaInstituicao(webDesigner.getInstituicao().getId());
				
				req.setAttribute("estruturasDeWebsites", estruturasDeWebsites);
				req.setAttribute("successMessage", "Estrutura de Website cadastrada com sucesso.");
				req.getRequestDispatcher("lista-de-estruturas-de-websites.jsp").forward(req, res);
				
				break;
			
			case "visualizar":
				
				id = req.getParameter("id");
				
				estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(conexao);
				estruturaDeWebsite = (EstruturaDeWebsite) estruturaDeWebsiteDAO.buscarPorId(Long.parseLong(id));
				
				categoriaDAO = new CategoriaDAO(conexao);
				categorias = categoriaDAO.listarCategoriasDaInstituicao(webDesigner.getInstituicao().getId());
					
				req.setAttribute("categorias", categorias);
				req.setAttribute("estruturaDeWebsite", estruturaDeWebsite);
				req.getRequestDispatcher("cadastro-estrutura-de-website.jsp").forward(req, res);
				
				break;
			
			case "editar":
				
				id = req.getParameter("id");
				idCategoria = req.getParameter("idCategoria");
				nome = req.getParameter("nome");
				descricao = req.getParameter("descricao");
				dataDeModificacao = new Date();
				
				estruturaDeWebsite = new EstruturaDeWebsite();
				
				categoriaDAO = new CategoriaDAO(conexao);
				categoria = (Categoria) categoriaDAO.buscarPorId(Long.parseLong(idCategoria));
				
				estruturaDeWebsite.setId(Long.parseLong(id));
				estruturaDeWebsite.setCategoria(categoria);
				estruturaDeWebsite.setNome(nome);
				estruturaDeWebsite.setDescricao(descricao);
				estruturaDeWebsite.setDataDeModificacao(dataDeModificacao);
				
				estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(conexao);
				estruturaDeWebsiteDAO.editar(estruturaDeWebsite);
				
				categoriaDAO = new CategoriaDAO(conexao);
				categorias = categoriaDAO.listarCategoriasDaInstituicao(webDesigner.getInstituicao().getId());
								
				req.setAttribute("estruturaDeWebsite", estruturaDeWebsite);
				req.setAttribute("categorias", categorias);
				req.setAttribute("successMessage", "Cadastro atualizado.");
				req.getRequestDispatcher("cadastro-estrutura-de-website.jsp").forward(req, res);
								
				break;
			
			case "excluir":
				
				id = req.getParameter("id");
				
				estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(conexao);
				estruturaDeWebsiteDAO.excluir(Long.parseLong(id));
				estruturasDeWebsites = estruturaDeWebsiteDAO.listarEstruturasDeWebsitesDaInstituicao(webDesigner.getInstituicao().getId());
				
				req.setAttribute("estruturasDeWebsites", estruturasDeWebsites);
				req.setAttribute("successMessage", "Estrutura de website excluída com sucesso.");
				req.getRequestDispatcher("lista-de-estruturas-de-websites.jsp").forward(req, res);
				
				break;
				
			case "listarEstruturasDeWebsitesDaCategoria":
				
				idCategoria = req.getParameter("id");
				
				estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(conexao);
				estruturasDeWebsites = estruturaDeWebsiteDAO.listarEstruturasDeWebsitesDaCategoria(Long.parseLong(idCategoria));
				
				req.setAttribute("estruturasDeWebsites", estruturasDeWebsites);
				req.getRequestDispatcher("lista-de-estruturas-de-websites.jsp").forward(req, res);
				
				break;
				
			}
			
		} catch (NullPointerException e) {
			
			estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(conexao);
			estruturasDeWebsites = estruturaDeWebsiteDAO.listarEstruturasDeWebsitesDaInstituicao(webDesigner.getInstituicao().getId());
			
			req.setAttribute("estruturasDeWebsites", estruturasDeWebsites);
			req.getRequestDispatcher("lista-de-estruturas-de-websites.jsp").forward(req, res);
						
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}

}
