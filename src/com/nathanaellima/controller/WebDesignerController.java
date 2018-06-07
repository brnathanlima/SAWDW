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
import javax.servlet.http.HttpSession;

import com.nathanaellima.factory.FuncionarioFactory;
import com.nathanaellima.model.InstituicaoDAO;
import com.nathanaellima.model.WebDesignerDAO;
import com.nathanaellima.modelo.AdministradorDeInstituicao;
import com.nathanaellima.modelo.Instituicao;
import com.nathanaellima.modelo.WebDesigner;

@WebServlet(name="WebDesignerController", urlPatterns= {"/webDesigner"})
public class WebDesignerController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Connection conexao = (Connection) getServletContext().getAttribute("ConexaoComBD");
		
		HttpSession session = req.getSession();
		
		Instituicao instituicao = null;
		InstituicaoDAO instituicaoDAO = null;
		AdministradorDeInstituicao administradorDeInstituicao = null;
		WebDesigner webDesigner = null;
		WebDesignerDAO webDesignerDAO = null;
		
		List<WebDesigner> webDesigners = null;
		
		String id = null;
		String idInstituicao = null;
		String nome = null;
		String sobrenome = null;
		String matricula = null;
		String email = null;
		String telefone = null;
		String nivel = null;
		String nomeDeUsuario = null;
		String senha = null;
		Date dataDeRegistro = null;
		Date dataDeModificacao = null;
		
		String acao = req.getParameter("acao");
			
		switch(acao) {
		
		case "novoCadastro":
			
			req.getRequestDispatcher("cadastro-web-designer.jsp").forward(req, res);
			
			break;
			
		case "cadastrar":
			
			idInstituicao = req.getParameter("idInstituicao");
			nome = req.getParameter("nome");
			sobrenome = req.getParameter("sobrenome");
			matricula = req.getParameter("matricula");
			email = req.getParameter("email");
			telefone = req.getParameter("telefone");
			nivel = req.getParameter("nivel");
			nomeDeUsuario = req.getParameter("nomeDeUsuario");
			senha = req.getParameter("senha");
			dataDeRegistro = new Date();
					
			webDesigner = (WebDesigner) FuncionarioFactory.getFuncionario("webDesigner");
			
			instituicaoDAO = new InstituicaoDAO(conexao);
			instituicao = (Instituicao) instituicaoDAO.buscarPorId(Long.parseLong(idInstituicao));
			
			webDesigner.setInstituicao(instituicao);
			webDesigner.setNome(nome);
			webDesigner.setSobrenome(sobrenome);
			webDesigner.setMatricula(matricula);
			webDesigner.setEmail(email);
			webDesigner.setTelefone(telefone);
			webDesigner.setNivel(nivel);
			webDesigner.setNomeDeUsuario(nomeDeUsuario);
			webDesigner.setSenha(senha);
			webDesigner.setDataDeRegistro(dataDeRegistro);
			
			webDesignerDAO = new WebDesignerDAO(conexao);
			webDesignerDAO.adicionar(webDesigner);
			
			administradorDeInstituicao = (AdministradorDeInstituicao) session.getAttribute("usuario");
			webDesigners = webDesignerDAO.listarWebDesignersDaInstituicao(administradorDeInstituicao.getInstituicao().getId());
			
			req.setAttribute("webDesigners", webDesigners);
			req.setAttribute("successMessage", "Web Designer cadastrado com sucesso.");
			req.getRequestDispatcher("lista-de-web-designers.jsp").forward(req, res);
		
			break;
			
		case "visualizar":
			
			long idWebDesigner = Long.parseLong(req.getParameter("id"));
			
			webDesignerDAO = new WebDesignerDAO(conexao);
			webDesigner = (WebDesigner) webDesignerDAO.buscarPorId(idWebDesigner);
			
			req.setAttribute("webDesigner", webDesigner);
			req.getRequestDispatcher("cadastro-web-designer.jsp").forward(req, res);
			
			break;
			
		case "editar":
			
			id = req.getParameter("id");
			idInstituicao = req.getParameter("idInstituicao");
			nome = req.getParameter("nome");
			sobrenome = req.getParameter("sobrenome");
			matricula = req.getParameter("matricula");
			email = req.getParameter("email");
			telefone = req.getParameter("telefone");
			nivel = req.getParameter("nivel");
			nomeDeUsuario = req.getParameter("nomeDeUsuario");
			senha = req.getParameter("senha");
			dataDeModificacao = new Date();
					
			webDesigner = (WebDesigner) FuncionarioFactory.getFuncionario("webDesigner");
			
			instituicaoDAO = new InstituicaoDAO(conexao);
			instituicao = (Instituicao) instituicaoDAO.buscarPorId(Long.parseLong(idInstituicao));
			
			webDesigner.setInstituicao(instituicao);
			webDesigner.setId(Long.parseLong(id));
			webDesigner.setNome(nome);
			webDesigner.setSobrenome(sobrenome);
			webDesigner.setMatricula(matricula);
			webDesigner.setEmail(email);
			webDesigner.setTelefone(telefone);
			webDesigner.setNivel(nivel);
			webDesigner.setNomeDeUsuario(nomeDeUsuario);
			webDesigner.setSenha(senha);
			webDesigner.setDataDeModificacao(dataDeModificacao);
			
			webDesignerDAO = new WebDesignerDAO(conexao);
			webDesignerDAO.editar(webDesigner);
			
			req.setAttribute("webDesigner", webDesigner);
			req.setAttribute("successMessage", "Cadastro atualizado.");
			req.getRequestDispatcher("cadastro-web-designer.jsp").forward(req, res);
			
			break;
			
		case "excluir":
			
			id = req.getParameter("id");
			
			webDesignerDAO = new WebDesignerDAO(conexao);
			webDesignerDAO.excluir(Long.parseLong(id));
			
			administradorDeInstituicao = (AdministradorDeInstituicao) session.getAttribute("usuario");
			webDesigners = webDesignerDAO.listarWebDesignersDaInstituicao(administradorDeInstituicao.getInstituicao().getId());
			
			req.setAttribute("webDesigners", webDesigners);
			req.setAttribute("successMessage", "Web Designer excluído com sucesso.");
			req.getRequestDispatcher("lista-de-web-designers.jsp").forward(req, res);
			
			break;
			
		case "listar":
			
			webDesignerDAO = new WebDesignerDAO(conexao);
			
			administradorDeInstituicao = (AdministradorDeInstituicao) session.getAttribute("usuario");
			webDesigners = webDesignerDAO.listarWebDesignersDaInstituicao(administradorDeInstituicao.getInstituicao().getId());
			
			req.setAttribute("webDesigners", webDesigners);
			req.getRequestDispatcher("lista-de-web-designers.jsp").forward(req, res);
			
			break;
		
		}
		
	}
	
}
