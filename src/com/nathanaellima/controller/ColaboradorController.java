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

import com.nathanaellima.factory.FuncionarioFactory;
import com.nathanaellima.model.ColaboradorDAO;
import com.nathanaellima.model.InstituicaoDAO;
import com.nathanaellima.modelo.AdministradorDeInstituicao;
import com.nathanaellima.modelo.Colaborador;
import com.nathanaellima.modelo.Instituicao;

@WebServlet("/ColaboradorController")
public class ColaboradorController extends HttpServlet {

	private static final long serialVersionUID = -4994835505155527306L;
	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Connection conexao = (Connection) getServletContext().getAttribute("ConexaoComBD");
		
		HttpSession session = req.getSession();
		
		Instituicao instituicao = null;
		InstituicaoDAO instituicaoDAO = null;
		AdministradorDeInstituicao administradorDeInstituicao = null;
		Colaborador colaborador = null;
		ColaboradorDAO colaboradorDAO = null;
		
		List<Colaborador> colaboradores = null;
		
		String id = null;
		String idInstituicao = null;
		String nome = null;
		String sobrenome = null;
		String matricula = null;
		String email = null;
		String telefone = null;
		String setor = null;
		String cargo = null;
		String nomeDeUsuario = null;
		String senha = null;
		Date dataDeRegistro = null;
		Date dataDeModificacao = null;
		
		String acao = req.getParameter("acao");
		
		try {
			
			switch(acao) {
				
			case "cadastrar":
				
				idInstituicao = req.getParameter("idInstituicao");
				nome = req.getParameter("nome");
				sobrenome = req.getParameter("sobrenome");
				matricula = req.getParameter("matricula");
				email = req.getParameter("email");
				telefone = req.getParameter("telefone");
				setor = req.getParameter("setor");
				cargo = req.getParameter("cargo");
				nomeDeUsuario = req.getParameter("nomeDeUsuario");
				senha = req.getParameter("senha");
				dataDeRegistro = new Date();
						
				colaborador = (Colaborador) FuncionarioFactory.getFuncionario("colaborador");
				
				instituicaoDAO = new InstituicaoDAO(conexao);
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(Long.parseLong(idInstituicao));
				
				colaborador.setInstituicao(instituicao);
				colaborador.setNome(nome);
				colaborador.setSobrenome(sobrenome);
				colaborador.setMatricula(matricula);
				colaborador.setEmail(email);
				colaborador.setTelefone(telefone);
				colaborador.setSetor(setor);
				colaborador.setCargo(cargo);
				colaborador.setNomeDeUsuario(nomeDeUsuario);
				colaborador.setSenha(senha);
				colaborador.setDataDeRegistro(dataDeRegistro);
				
				colaboradorDAO = new ColaboradorDAO(conexao);
				colaboradorDAO.adicionar(colaborador);
				
				administradorDeInstituicao = (AdministradorDeInstituicao) session.getAttribute("usuario");
				colaboradores = colaboradorDAO.listarColaboradoresDaInstituicao(administradorDeInstituicao.getInstituicao().getId());
				
				req.setAttribute("colaboradores", colaboradores);
				req.setAttribute("successMessage", "Colaborador cadastrado com sucesso.");
				req.getRequestDispatcher("lista-de-colaboradores.jsp").forward(req, res);
			
				break;
				
			case "visualizar":
				
				long idColaborador = Long.parseLong(req.getParameter("id"));
				
				colaboradorDAO = new ColaboradorDAO(conexao);
				colaborador = (Colaborador) colaboradorDAO.buscarPorId(idColaborador);
				
				req.setAttribute("colaborador", colaborador);
				req.getRequestDispatcher("cadastro-colaborador.jsp").forward(req, res);
				
				break;
				
			case "editar":
				
				id = req.getParameter("id");
				idInstituicao = req.getParameter("idInstituicao");
				nome = req.getParameter("nome");
				sobrenome = req.getParameter("sobrenome");
				matricula = req.getParameter("matricula");
				email = req.getParameter("email");
				telefone = req.getParameter("telefone");
				setor = req.getParameter("setor");
				cargo = req.getParameter("cargo");
				nomeDeUsuario = req.getParameter("nomeDeUsuario");
				senha = req.getParameter("senha");
				dataDeModificacao = new Date();
						
				colaborador = (Colaborador) FuncionarioFactory.getFuncionario("colaborador");
				
				instituicaoDAO = new InstituicaoDAO(conexao);
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(Long.parseLong(idInstituicao));
				
				colaborador.setId(Long.parseLong(id));
				colaborador.setInstituicao(instituicao);
				colaborador.setNome(nome);
				colaborador.setSobrenome(sobrenome);
				colaborador.setMatricula(matricula);
				colaborador.setEmail(email);
				colaborador.setTelefone(telefone);
				colaborador.setSetor(setor);
				colaborador.setCargo(cargo);
				colaborador.setNomeDeUsuario(nomeDeUsuario);
				colaborador.setSenha(senha);
				colaborador.setDataDeModificacao(dataDeModificacao);
				
				colaboradorDAO = new ColaboradorDAO(conexao);
				colaboradorDAO.editar(colaborador);
				
				req.setAttribute("colaborador", colaborador);
				req.setAttribute("successMessage", "Cadastro atualizado.");
				req.getRequestDispatcher("cadastro-colaborador.jsp").forward(req, res);
				
				break;
				
			case "excluir":
				
				id = req.getParameter("id");
				
				colaboradorDAO = new ColaboradorDAO(conexao);
				colaboradorDAO.excluir(Long.parseLong(id));
				
				administradorDeInstituicao = (AdministradorDeInstituicao) session.getAttribute("usuario");
				colaboradores = colaboradorDAO.listarColaboradoresDaInstituicao(administradorDeInstituicao.getInstituicao().getId());
				
				req.setAttribute("colaboradores", colaboradores);
				req.setAttribute("successMessage", "Colaborador excluído com sucesso.");
				req.getRequestDispatcher("lista-de-colaboradores.jsp").forward(req, res);
			
			}
			
		} catch (NullPointerException e){
			
			colaboradorDAO = new ColaboradorDAO(conexao);
			
			administradorDeInstituicao = (AdministradorDeInstituicao) session.getAttribute("usuario");
			colaboradores = colaboradorDAO.listarColaboradoresDaInstituicao(administradorDeInstituicao.getInstituicao().getId());
			
			req.setAttribute("colaboradores", colaboradores);
			req.getRequestDispatcher("lista-de-colaboradores.jsp").forward(req, res);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}

}
