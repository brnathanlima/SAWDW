package com.nathanaellima.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nathanaellima.model.ProjetoDAO;
import com.nathanaellima.model.SolicitacaoDeDesenvolvimentoDAO;
import com.nathanaellima.modelo.Funcionario;
import com.nathanaellima.modelo.Gerente;
import com.nathanaellima.modelo.Projeto;
import com.nathanaellima.modelo.SolicitacaoDeDesenvolvimento;
import com.nathanaellima.modelo.WebDesigner;

@WebServlet(name="ProjetoController", urlPatterns= {"/projeto"})
public class ProjetoController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Connection connection = (Connection) getServletContext().getAttribute("ConexaoComBD");
		HttpSession session = req.getSession();
		
		Funcionario funcionario = null;
		Gerente gerente;
		WebDesigner webDesigner;
		
		Projeto projeto;
		SolicitacaoDeDesenvolvimento solicitacaoDeDesenvolvimento;
		
		List<Projeto> projetos;
		List<SolicitacaoDeDesenvolvimento> solicitacoesDeDesenvolvimento;
		
		ProjetoDAO projetoDAO;
		SolicitacaoDeDesenvolvimentoDAO solicitacaoDeDesenvolvimentoDAO;
		
		String id = null;
		String titulo = null;
		String status = null;
		String descricao = null;
		String resumo = null;
		String[] solicitacoesDeDesenvolvimentoIncluidas = null;
		Date dataDeInicio = null;
		Date dataDeModificacao = null;
		Date dataDeConclusao = null;
		
		String acao = req.getParameter("acao");
			
		switch(acao) {
		
		case "novoCadastro":
			
			gerente = (Gerente) session.getAttribute("usuario");
			
			solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(connection);
			solicitacoesDeDesenvolvimento = 
					solicitacaoDeDesenvolvimentoDAO.listarSolicitacoesDeDesenvolvimentoAprovadasDaInstituicao(gerente.getInstituicao().getId());
			
			req.setAttribute("solicitacoesDeDesenvolvimento", solicitacoesDeDesenvolvimento);
			req.getRequestDispatcher("cadastro-projeto.jsp").forward(req, res);
			
			break;
			
		case "cadastrar":
			
			titulo = req.getParameter("titulo");
			descricao = req.getParameter("descricao");
			solicitacoesDeDesenvolvimentoIncluidas = req.getParameterValues("solicitacoesDeDesenvolvimentoIncluidas");
			dataDeInicio = new Date();
			status = "Novo";
			
			gerente = (Gerente) session.getAttribute("usuario");
			
			solicitacoesDeDesenvolvimento = new ArrayList<SolicitacaoDeDesenvolvimento>();
			solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(connection);
			
			for(int i = 0; i < solicitacoesDeDesenvolvimentoIncluidas.length; i++) {
				
				solicitacaoDeDesenvolvimento = (SolicitacaoDeDesenvolvimento)
						solicitacaoDeDesenvolvimentoDAO.buscarPorId(Long.parseLong(solicitacoesDeDesenvolvimentoIncluidas[i]));
				
				solicitacoesDeDesenvolvimento.add(solicitacaoDeDesenvolvimento);
				
				solicitacaoDeDesenvolvimentoDAO.mudarStatus("Incluída em Projeto", solicitacaoDeDesenvolvimento.getId());
				
			}
			
			projeto = new Projeto();
			
			projeto.setTitulo(titulo);
			projeto.setDescricao(descricao);
			projeto.setStatus(status);
			projeto.setGerenteDoProjeto(gerente);
			projeto.setDataDeCriacao(dataDeInicio);
			projeto.setSolicitacoesDeDesenvolvimentoDoProjeto(solicitacoesDeDesenvolvimento);
			
			projetoDAO = new ProjetoDAO(connection);
			projetoDAO.adicionar(projeto);
			projetos = projetoDAO.listarProjetosDaInstituicao(gerente.getInstituicao().getId());
			
			req.setAttribute("projetos", projetos);
			req.setAttribute("successMessage", "Projeto criado com sucesso.");
			req.getRequestDispatcher("lista-de-projetos.jsp").forward(req, res);
			
			break;
			
		case "visualizar":
			
			id = req.getParameter("id");
			
			if (session.getAttribute("tipoDeUsuario").equals("webDesigner")) {

				funcionario = (WebDesigner) session.getAttribute("usuario");
				
			} else if (session.getAttribute("tipoDeUsuario").equals("gerente")) {
				
				funcionario = (Gerente) session.getAttribute("usuario");
				
			}
			
			projetoDAO = new ProjetoDAO(connection);
			projeto = (Projeto) projetoDAO.buscarPorId(Long.parseLong(id));
			
			solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(connection);
			solicitacoesDeDesenvolvimento = 
					solicitacaoDeDesenvolvimentoDAO.listarSolicitacoesDeDesenvolvimentoParaEdicaoDeProjeto(funcionario.getInstituicao().getId(), projeto.getId());
			
			req.setAttribute("projeto", projeto);
			req.setAttribute("solicitacoesDeDesenvolvimento", solicitacoesDeDesenvolvimento);
			req.getRequestDispatcher("cadastro-projeto.jsp").forward(req, res);
			
			break;
			
		case "editar":
			
			id = req.getParameter("id");
			titulo = req.getParameter("titulo");
			descricao = req.getParameter("descricao");
			solicitacoesDeDesenvolvimentoIncluidas = req.getParameterValues("solicitacoesDeDesenvolvimentoIncluidas");
			dataDeModificacao = new Date();
			
			solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(connection);
			solicitacoesDeDesenvolvimento = new ArrayList<SolicitacaoDeDesenvolvimento>();
			
			solicitacoesDeDesenvolvimento = 
					solicitacaoDeDesenvolvimentoDAO.listarSolicitacoesDeDesenvolvimentoDoProjeto(Long.parseLong(id));
			
			for(int i = 0; i < solicitacoesDeDesenvolvimento.size(); i++) {
				
				solicitacaoDeDesenvolvimentoDAO.mudarStatus("Aceita", solicitacoesDeDesenvolvimento.get(i).getId());
				
			}
			
			solicitacoesDeDesenvolvimento.clear();
			
			for(int i = 0; i < solicitacoesDeDesenvolvimentoIncluidas.length; i++) {
				
				solicitacaoDeDesenvolvimento = (SolicitacaoDeDesenvolvimento)
						solicitacaoDeDesenvolvimentoDAO.buscarPorId(Long.parseLong(solicitacoesDeDesenvolvimentoIncluidas[i]));
				
				solicitacoesDeDesenvolvimento.add(solicitacaoDeDesenvolvimento);
				
				solicitacaoDeDesenvolvimentoDAO.mudarStatus("Incluída em Projeto", solicitacaoDeDesenvolvimento.getId());
				
			}
			
			projeto = new Projeto();
			
			projeto.setId(Long.parseLong(id));
			projeto.setTitulo(titulo);
			projeto.setDescricao(descricao);
			projeto.setDataDeModificacao(dataDeModificacao);
			projeto.setSolicitacoesDeDesenvolvimentoDoProjeto(solicitacoesDeDesenvolvimento);
			
			projetoDAO = new ProjetoDAO(connection);
			projetoDAO.editar(projeto);
			projeto = (Projeto) projetoDAO.buscarPorId(Long.parseLong(id));
			
			gerente = (Gerente) session.getAttribute("usuario");
			
			solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(connection);
			solicitacoesDeDesenvolvimento = 
					solicitacaoDeDesenvolvimentoDAO.listarSolicitacoesDeDesenvolvimentoParaEdicaoDeProjeto(gerente.getInstituicao().getId(), projeto.getId());
			
			req.setAttribute("projeto", projeto);
			req.setAttribute("solicitacoesDeDesenvolvimento", solicitacoesDeDesenvolvimento);
			req.setAttribute("successMessage", "edição realizada com sucesso.");
			req.getRequestDispatcher("cadastro-projeto.jsp").forward(req, res);
			
			break;
			
		case "excluir":
			
			id = req.getParameter("id");
			
			projetoDAO = new ProjetoDAO(connection);
			projeto = (Projeto) projetoDAO.buscarPorId(Long.parseLong(id));
			
			for(int i = 0; i < projeto.getSolicitacoesDeDesenvolvimentoDoProjeto().size(); i++) {
				
				solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(connection);
				solicitacaoDeDesenvolvimento = projeto.getSolicitacoesDeDesenvolvimentoDoProjeto().get(i);
				solicitacaoDeDesenvolvimentoDAO.mudarStatus("Aceita", solicitacaoDeDesenvolvimento.getId());
				
			}
			
			projetoDAO.excluir(Long.parseLong(id));
			
			gerente = (Gerente) session.getAttribute("usuario");
			
			projetos = projetoDAO.listarProjetosDaInstituicao(gerente.getInstituicao().getId());
			
			req.setAttribute("projetos", projetos);
			req.setAttribute("successMessage", "edição realizada com sucesso.");
			req.getRequestDispatcher("lista-de-projetos.jsp").forward(req, res);
			
			break;
			
		case "finalizar":
			
			id = req.getParameter("id");
			resumo = req.getParameter("resumo");
			
			status = "Finalizado";
			dataDeConclusao = new Date();
			
			projetoDAO = new ProjetoDAO(connection);
			projetoDAO.mudarStatus(status, Long.parseLong(id));
			
			projeto = (Projeto) projetoDAO.buscarPorId(Long.parseLong(id));
			projeto.setResumo(resumo);
			projeto.setDataDeConclusao(dataDeConclusao);
			projetoDAO.finalizar(projeto);
			
			solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(connection);
			
			solicitacoesDeDesenvolvimento = new ArrayList<SolicitacaoDeDesenvolvimento>();
			
			for(int i = 0; i < projeto.getSolicitacoesDeDesenvolvimentoDoProjeto().size(); i++) {
				
				solicitacaoDeDesenvolvimento = (SolicitacaoDeDesenvolvimento)
						solicitacaoDeDesenvolvimentoDAO.buscarPorId(projeto.getSolicitacoesDeDesenvolvimentoDoProjeto().get(i).getId());
				
				solicitacoesDeDesenvolvimento.add(solicitacaoDeDesenvolvimento);
				
				solicitacaoDeDesenvolvimentoDAO.mudarStatus("Atendida", solicitacaoDeDesenvolvimento.getId());
				
			}
			
			req.setAttribute("projeto", projeto);
			req.setAttribute("solicitacoesDeDesenvolvimento", solicitacoesDeDesenvolvimento);
			req.setAttribute("successMessage", "projeto finalizado com sucesso.");
			req.getRequestDispatcher("cadastro-projeto.jsp").forward(req, res);
			
			break;
			
		case "editarFinalizacao":
			
			id = req.getParameter("id");
			resumo = req.getParameter("resumo");
			
			projetoDAO = new ProjetoDAO(connection);
			
			projeto = (Projeto) projetoDAO.buscarPorId(Long.parseLong(id));
			projeto.setResumo(resumo);
			projetoDAO.editarFinalizacao(projeto);
			
			projeto = (Projeto) projetoDAO.buscarPorId(Long.parseLong(id));
			
			solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(connection);
			solicitacoesDeDesenvolvimento = solicitacaoDeDesenvolvimentoDAO.listarSolicitacoesDeDesenvolvimentoDoProjeto(Long.parseLong(id));
			
			req.setAttribute("projeto", projeto);
			req.setAttribute("solicitacoesDeDesenvolvimento", solicitacoesDeDesenvolvimento);
			req.setAttribute("successMessage", "Resumo do projeto atualizado com sucesso.");
			req.getRequestDispatcher("cadastro-projeto.jsp").forward(req, res);
			
			break;
			
		case "reabrirProjeto":
			
			id = req.getParameter("id");
			resumo = req.getParameter("resumo");
			
			status = "Novo";
			dataDeConclusao = new Date();
			
			projetoDAO = new ProjetoDAO(connection);
			projetoDAO.mudarStatus(status, Long.parseLong(id));
			
			projeto = (Projeto) projetoDAO.buscarPorId(Long.parseLong(id));
			projeto.setResumo(resumo);
			projeto.setDataDeConclusao(dataDeConclusao);
			projetoDAO.finalizar(projeto);
			
			solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(connection);
			
			solicitacoesDeDesenvolvimento = new ArrayList<SolicitacaoDeDesenvolvimento>();
			
			for(int i = 0; i < projeto.getSolicitacoesDeDesenvolvimentoDoProjeto().size(); i++) {
				
				solicitacaoDeDesenvolvimento = (SolicitacaoDeDesenvolvimento)
						solicitacaoDeDesenvolvimentoDAO.buscarPorId(projeto.getSolicitacoesDeDesenvolvimentoDoProjeto().get(i).getId());
				
				solicitacoesDeDesenvolvimento.add(solicitacaoDeDesenvolvimento);
				
				solicitacaoDeDesenvolvimentoDAO.mudarStatus("Incluída em Projeto", solicitacaoDeDesenvolvimento.getId());
				
			}
			
			req.setAttribute("projeto", projeto);
			req.setAttribute("solicitacoesDeDesenvolvimento", solicitacoesDeDesenvolvimento);
			req.setAttribute("successMessage", "projeto reaberto com sucesso.");
			req.getRequestDispatcher("cadastro-projeto.jsp").forward(req, res);
			
			break;
			
		case "listar":
			
			projetoDAO = new ProjetoDAO(connection);
			
			if (session.getAttribute("tipoDeUsuario").equals("webDesigner")) {
				
				webDesigner = (WebDesigner) session.getAttribute("usuario");
				
				projetos = projetoDAO.listarProjetosDaInstituicao(webDesigner.getInstituicao().getId());
				
				req.setAttribute("projetos", projetos);
				
			} else if (session.getAttribute("tipoDeUsuario").equals("gerente")) {
				
				gerente = (Gerente) session.getAttribute("usuario");
				
				if (gerente.getDepartamento().equals("TI")) {
					
					projetos = projetoDAO.listarProjetosDaInstituicao(gerente.getInstituicao().getId());
					
				} else {

					projetos = projetoDAO.listarProjetosDoGerente(gerente.getId());
					
				}
				
				req.setAttribute("projetos", projetos);
				
			}
			
			req.getRequestDispatcher("lista-de-projetos.jsp").forward(req, res);
			
			break;
			
		}
		
	}

}
