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
import com.nathanaellima.model.InstituicaoDAO;
import com.nathanaellima.modelo.Categoria;
import com.nathanaellima.modelo.Instituicao;
import com.nathanaellima.modelo.WebDesigner;

@WebServlet("/CategoriaDeWebsitesController")
public class CategoriaDeWebsitesController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Connection conexao = (Connection) getServletContext().getAttribute("ConexaoComBD");
		HttpSession session = req.getSession();
		
		Categoria categoria = null;
		CategoriaDAO categoriaDAO = new CategoriaDAO(conexao);
		InstituicaoDAO instituicaoDAO = null;
		Instituicao instituicao = null;
		List<Categoria> categorias = null;
		WebDesigner webDesigner = (WebDesigner) session.getAttribute("usuario");
		
		String id = null;
		String nome = null;
		String descricao = null;
		Date dataDeCriacao = null;
		Date dataDeModificacao = null;
		
		String acao = req.getParameter("acao");
		
		try {
			
			switch(acao) {
			
			case "novoCadastro":
				
				categorias = categoriaDAO.listarCategoriasDaInstituicao(webDesigner.getInstituicao().getId());
				
				req.setAttribute("categorias", categorias);
				req.getRequestDispatcher("cadastro-categoria-de-websites.jsp").forward(req, res);
				
				break;
				
			case "cadastrar":
				
				nome = req.getParameter("nome");
				descricao = req.getParameter("descricao");
				dataDeCriacao = new Date();
				
				categoria = new Categoria();
				instituicaoDAO = new InstituicaoDAO(conexao);
				
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(webDesigner.getInstituicao().getId());
			
				categoria.setInstituicao(instituicao);
				categoria.setNome(nome);
				categoria.setDescricao(descricao);
				categoria.setDataDeCriacao(dataDeCriacao);
				
				categoriaDAO.adicionar(categoria);
				categorias = categoriaDAO.listarCategoriasDaInstituicao(webDesigner.getInstituicao().getId());
				
				req.setAttribute("categorias", categorias);
				req.setAttribute("successMessage", "Categoria de Websites cadastrada com sucesso.");
				req.getRequestDispatcher("lista-de-categorias-de-websites.jsp").forward(req, res);
				
				break;
				
			case "visualizar":
				
				id = req.getParameter("id");
				
				categoria = (Categoria) categoriaDAO.buscarPorId(Long.parseLong(id));
				
				req.setAttribute("categoria", categoria);
				req.getRequestDispatcher("cadastro-categoria-de-websites.jsp").forward(req, res);
				
				break;
				
			case "editar":
				
				id = req.getParameter("id");
				nome = req.getParameter("nome");
				descricao = req.getParameter("descricao");
				dataDeModificacao = new Date();
				
				categoria = new Categoria();
					
				categoria.setId(Long.parseLong(id));
				categoria.setNome(nome);
				categoria.setDescricao(descricao);
				categoria.setDataDeModificacao(dataDeModificacao);
				
				categoriaDAO.editar(categoria);
				
				req.setAttribute("categoria", categoria);
				req.setAttribute("successMessage", "Cadastro atualizado.");
				req.getRequestDispatcher("cadastro-categoria-de-websites.jsp").forward(req, res);
				
				break;
			
			case "excluir":
				
				id = req.getParameter("id");
				
				categoriaDAO.excluir(Long.parseLong(id));
				
				categorias = categoriaDAO.listarCategoriasDaInstituicao(webDesigner.getInstituicao().getId());
				
				req.setAttribute("categorias", categorias);
				req.setAttribute("successMessage", "Categoria de Websites excluída com sucesso.");
				req.getRequestDispatcher("lista-de-categorias-de-websites.jsp").forward(req, res);
				
				break;
					
			}
			
		} catch(NullPointerException e) {

			categorias = categoriaDAO.listarCategoriasDaInstituicao(webDesigner.getInstituicao().getId());
			
			req.setAttribute("categorias", categorias);
			req.getRequestDispatcher("lista-de-categorias-de-websites.jsp").forward(req, res);
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}

}
