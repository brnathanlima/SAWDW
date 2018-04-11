package com.nathanaellima.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nathanaellima.model.EstruturaDeWebsiteDAO;
import com.nathanaellima.model.SolicitacaoDeDesenvolvimentoDAO;
import com.nathanaellima.modelo.EstruturaDeWebsite;
import com.nathanaellima.modelo.Funcionario;
import com.nathanaellima.modelo.Gerente;
import com.nathanaellima.modelo.SolicitacaoDeDesenvolvimento;
import com.nathanaellima.modelo.WebDesigner;

@WebServlet("/SolicitacaoDeDesenvolvimentoController")
public class SolicitacaoDeDesenvolvimentoController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Connection conexao = (Connection) getServletContext().getAttribute("ConexaoComBD");
		HttpSession session = req.getSession();
		
		Funcionario funcionario = null;
		Gerente gerente;
		WebDesigner webDesigner;
		
		SolicitacaoDeDesenvolvimento solicitacaoDeDesenvolvimento;
		EstruturaDeWebsite estruturaDeWebsite;
		
		List<SolicitacaoDeDesenvolvimento> solicitacoesDeDesenvolvimento;
		List<EstruturaDeWebsite> estruturasDeWebsites;
		
		SolicitacaoDeDesenvolvimentoDAO solicitacaoDeDesenvolvimentoDAO;
		EstruturaDeWebsiteDAO estruturaDeWebsiteDAO;
		
		String id = null;
		String[] estruturasDeWebsitesSolicitadas = null;
		String titulo = null;
		String justificativa = null;
		String status = null;
		Date dataDeRealizacao = null;
		Date dataDeModificacao = null;
		
		String acao = req.getParameter("acao");
		
		try {
			
			switch(acao) {
			
			case "novoCadastro":
				
				funcionario = (Gerente) session.getAttribute("usuario");
				
				estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(conexao);
				estruturasDeWebsites = estruturaDeWebsiteDAO.listarEstruturasDeWebsitesDaInstituicao(funcionario.getInstituicao().getId());
				
				req.setAttribute("estruturasDeWebsites", estruturasDeWebsites);
				req.getRequestDispatcher("cadastro-solicitacao-de-desenvolvimento.jsp").forward(req, res);
				
				break;
			
			case "cadastrar":
				
				titulo = req.getParameter("titulo");
				justificativa = req.getParameter("justificativa");
				status = "Nova";
				estruturasDeWebsitesSolicitadas = req.getParameterValues("estruturasDeWebsitesSolicitadas");
				dataDeRealizacao = new Date();
				
				gerente = (Gerente) session.getAttribute("usuario");
				
				estruturasDeWebsites = new ArrayList<EstruturaDeWebsite>();
				estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(conexao);
				
				for (int i = 0; i < estruturasDeWebsitesSolicitadas.length; i++) {
					
					estruturaDeWebsite = estruturaDeWebsiteDAO.buscarPorId(Long.parseLong(estruturasDeWebsitesSolicitadas[i]));
					estruturasDeWebsites.add(estruturaDeWebsite);
					
				}
				
				solicitacaoDeDesenvolvimento = new SolicitacaoDeDesenvolvimento.Builder()
																						.titulo(titulo)
																						.justificativa(justificativa)
																						.status(status)
																						.solicitante(gerente)
																						.estruturasDeWebsites(estruturasDeWebsites)
																						.dataDeRealizacao(dataDeRealizacao)
																						.solicitar();
				
				solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(conexao);
				solicitacaoDeDesenvolvimentoDAO.adicionar(solicitacaoDeDesenvolvimento);
				solicitacoesDeDesenvolvimento = solicitacaoDeDesenvolvimentoDAO.listarSolicitacoesDeDesenvolvimentoDoGerente(gerente.getId());
				
				req.setAttribute("solicitacoesDeDesenvolvimento", solicitacoesDeDesenvolvimento);
				req.setAttribute("successMessage", "Solicitação de desenvolvimento realizada com sucesso.");
				req.getRequestDispatcher("lista-de-solicitacoes-de-desenvolvimento.jsp").forward(req, res);
				
				break;	
			
			case "visualizar":
				
				id = req.getParameter("id");
				
				if (session.getAttribute("tipoDeUsuario").equals("webDesigner")) {

					funcionario = (WebDesigner) session.getAttribute("usuario");
					
				} else if (session.getAttribute("tipoDeUsuario").equals("gerente")) {
					
					funcionario = (Gerente) session.getAttribute("usuario");
					
				}
				
				solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(conexao);
				solicitacaoDeDesenvolvimento = (SolicitacaoDeDesenvolvimento) solicitacaoDeDesenvolvimentoDAO.buscarPorId(Long.parseLong(id));
				
				estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(conexao);
				estruturasDeWebsites = estruturaDeWebsiteDAO.listarEstruturasDeWebsitesDaInstituicao(funcionario.getInstituicao().getId());
				
				req.setAttribute("estruturasDeWebsites", estruturasDeWebsites);
				req.setAttribute("solicitacaoDeDesenvolvimento", solicitacaoDeDesenvolvimento);
				req.getRequestDispatcher("cadastro-solicitacao-de-desenvolvimento.jsp").forward(req, res);
				
				break;
				
			case "editar":
				
				id = req.getParameter("id");
				titulo = req.getParameter("titulo");
				justificativa = req.getParameter("justificativa");
				estruturasDeWebsitesSolicitadas = req.getParameterValues("estruturasDeWebsitesSolicitadas");
				dataDeModificacao = new Date();
				
				estruturasDeWebsites = new ArrayList<EstruturaDeWebsite>();
				estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(conexao);
				
				for (int i = 0; i < estruturasDeWebsitesSolicitadas.length; i++) {
					
					estruturaDeWebsite = estruturaDeWebsiteDAO.buscarPorId(Long.parseLong(estruturasDeWebsitesSolicitadas[i]));
					estruturasDeWebsites.add(estruturaDeWebsite);
					
				}
				
				solicitacaoDeDesenvolvimento = new SolicitacaoDeDesenvolvimento.Builder()
																						.id(Long.parseLong(id))
																						.titulo(titulo)
																						.justificativa(justificativa)
																						.estruturasDeWebsites(estruturasDeWebsites)
																						.dataDeModificacao(dataDeModificacao)
																						.solicitar();
				
				solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(conexao);
				solicitacaoDeDesenvolvimentoDAO.editar(solicitacaoDeDesenvolvimento);
				solicitacaoDeDesenvolvimento = (SolicitacaoDeDesenvolvimento) solicitacaoDeDesenvolvimentoDAO.buscarPorId(Long.parseLong(id));
				
				gerente = (Gerente) session.getAttribute("usuario");
				
				estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(conexao);
				estruturasDeWebsites = estruturaDeWebsiteDAO.listarEstruturasDeWebsitesDaInstituicao(gerente.getInstituicao().getId());
				
				req.setAttribute("estruturasDeWebsites", estruturasDeWebsites);
				req.setAttribute("solicitacaoDeDesenvolvimento", solicitacaoDeDesenvolvimento);
				req.setAttribute("successMessage", "edição realizada com sucesso.");
				req.getRequestDispatcher("cadastro-solicitacao-de-desenvolvimento.jsp").forward(req, res);
				
				break;
				
			case "excluir":
				
				id = req.getParameter("id");
				gerente = (Gerente) session.getAttribute("usuario");
				
				solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(conexao);
				solicitacaoDeDesenvolvimentoDAO.excluir(Long.parseLong(id));
				solicitacoesDeDesenvolvimento = 
						solicitacaoDeDesenvolvimentoDAO.listarSolicitacoesDeDesenvolvimentoDoGerente(gerente.getId());
				
				req.setAttribute("solicitacoesDeDesenvolvimento", solicitacoesDeDesenvolvimento);
				req.setAttribute("successMessage", "Solicitação de desenvolvimento de website excluída com sucesso.");
				req.getRequestDispatcher("lista-de-solicitacoes-de-desenvolvimento.jsp").forward(req, res);
				
				break;
			}
			
		} catch (NullPointerException e) {

			solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(conexao);
			
			if (session.getAttribute("tipoDeUsuario").equals("webDesigner")) {
				
				webDesigner = (WebDesigner) session.getAttribute("usuario");
				
				solicitacoesDeDesenvolvimento = solicitacaoDeDesenvolvimentoDAO.listarSolicitacoesDaInstituicao(webDesigner.getInstituicao().getId());

				req.setAttribute("solicitacoesDeDesenvolvimento", solicitacoesDeDesenvolvimento);
				
			} else if (session.getAttribute("tipoDeUsuario").equals("gerente")) {
				
				gerente = (Gerente) session.getAttribute("usuario");
				
				if (gerente.getDepartamento().equals("TI")) {
					
					solicitacoesDeDesenvolvimento = solicitacaoDeDesenvolvimentoDAO.listarSolicitacoesDaInstituicao(gerente.getInstituicao().getId());
					
				} else {
					
					solicitacoesDeDesenvolvimento = solicitacaoDeDesenvolvimentoDAO.listarSolicitacoesDeDesenvolvimentoDoGerente(gerente.getId());
					
				}
				
				req.setAttribute("solicitacoesDeDesenvolvimento", solicitacoesDeDesenvolvimento);
				
			}
			
			req.getRequestDispatcher("lista-de-solicitacoes-de-desenvolvimento.jsp").forward(req, res);
						
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}

}
