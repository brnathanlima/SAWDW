package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.api.jdbc.Statement;
import com.nathanaellima.modelo.AvaliacaoDeProjeto;
import com.nathanaellima.modelo.Gerente;
import com.nathanaellima.modelo.Projeto;
import com.nathanaellima.modelo.SolicitacaoDeDesenvolvimento;

public class ProjetoDAO extends GenericoDAO {
	
	Connection connection;
	
	Projeto projeto;
	Gerente gerenteDoProjeto;
	AvaliacaoDeProjeto avaliacaoDoProjeto;
	
	GerenteDAO gerenteDAO;
	SolicitacaoDeDesenvolvimentoDAO solicitacaoDeDesenvolvimentoDAO;
	AvaliacaoDeProjetoDAO avaliacaoDeProjetoDAO;
	
	List<Projeto> projetos;
	List<SolicitacaoDeDesenvolvimento> solicitacoesDeDesenvolvimentoDoProjeto;
	
	public ProjetoDAO(Connection connection) {
		
		super(connection);
		this.connection = connection;
		
	}
	
	public void adicionar(Projeto projeto) {
		
		try {
			
			String insertProjeto = "INSERT INTO projetos(id_gerente_do_projeto, titulo, descricao, status, data_de_criacao)"
					+ "VALUES(?, ?, ?, ?, ?)";
			String insertSolicitacoes = "INSERT INTO solicitacoes_de_desenvolvimento_do_projeto(id_projeto, id_solicitacao_de_desenvolvimento)"
					+ "VALUES(?, ?)";
			
			PreparedStatement stmt1 = connection.prepareStatement(insertProjeto, Statement.RETURN_GENERATED_KEYS);
			
			stmt1.setLong(1, projeto.getGerenteDoProjeto().getId());
			stmt1.setString(2, projeto.getTitulo());
			stmt1.setString(3, projeto.getDescricao());
			stmt1.setString(4, "Novo");
			stmt1.setDate(5, new java.sql.Date(projeto.getDataDeCriacao().getTime()));
			
			int linhasAfetadas = stmt1.executeUpdate();
			
			if(linhasAfetadas == 0) {
				
				throw new SQLException("Falha ao adicionar solicitação.");
				
			}
			
			try(ResultSet idGerado = stmt1.getGeneratedKeys()){
				
				if (idGerado.next()) {
					
					projeto.setId(idGerado.getLong(1));
					
					PreparedStatement stmt2 = connection.prepareStatement(insertSolicitacoes);
					
					for(SolicitacaoDeDesenvolvimento solicitacaoDeDesenvolvimento : projeto.getSolicitacoesDeDesenvolvimentoDoProjeto()) {
						
						stmt2.setLong(1, projeto.getId());
						stmt2.setLong(2, solicitacaoDeDesenvolvimento.getId());
						
						stmt2.execute();
						
					}
					
					stmt2.close();
					
				} else {
					
					throw new SQLException("Falha ao adicionar solicitação.");
					
				}
				
			}
			
			stmt1.close();
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	public void editar(Projeto projeto) {
		
		try {
			
			String updateProjeto = "UPDATE projetos SET titulo=?, descricao=?, data_de_modificacao=? WHERE id=?";
			
			PreparedStatement stmt1 = connection.prepareStatement(updateProjeto);
			
			stmt1.setString(1, projeto.getTitulo());
			stmt1.setString(2, projeto.getDescricao());
			stmt1.setDate(3, new java.sql.Date(projeto.getDataDeModificacao().getTime()));
			stmt1.setLong(4, projeto.getId());
			
			stmt1.execute();
			stmt1.close();
			
			String apagarSolicitacoesDoProjeto = "DELETE FROM solicitacoes_de_desenvolvimento_do_projeto WHERE id_projeto=?";
			
			PreparedStatement stmt2 = connection.prepareStatement(apagarSolicitacoesDoProjeto);
			stmt2.setLong(1, projeto.getId());
			
			stmt2.execute();
			stmt2.close();
			
			String insertSolicitacoes = "INSERT INTO solicitacoes_de_desenvolvimento_do_projeto(id_projeto, id_solicitacao_de_desenvolvimento)"
					+ "VALUES(?, ?)";
			
			PreparedStatement stmt3 = connection.prepareStatement(insertSolicitacoes);
			
			for(SolicitacaoDeDesenvolvimento solicitacaoDeDesenvolvimento : projeto.getSolicitacoesDeDesenvolvimentoDoProjeto()) {
				
				stmt3.setLong(1, projeto.getId());
				stmt3.setLong(2, solicitacaoDeDesenvolvimento.getId());
				
				stmt3.execute();
				
			}
			
			stmt3.close();
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	public void finalizar(Projeto projeto) {
		
		try {
			
			String updateProjeto = "UPDATE projetos SET resumo=?, data_de_conclusao=? WHERE id=?";
			
			PreparedStatement stmt1 = connection.prepareStatement(updateProjeto);
			
			stmt1.setString(1, projeto.getResumo());
			stmt1.setDate(2, new java.sql.Date(projeto.getDataDeConclusao().getTime()));
			stmt1.setLong(3, projeto.getId());
			
			stmt1.execute();
			stmt1.close();
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	public void editarFinalizacao(Projeto projeto) {
		
		try {
			
			String updateProjeto = "UPDATE projetos SET resumo=? WHERE id=?";
			
			PreparedStatement stmt1 = connection.prepareStatement(updateProjeto);
			
			stmt1.setString(1, projeto.getResumo());
			stmt1.setLong(2, projeto.getId());
			
			stmt1.execute();
			stmt1.close();
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	public void mudarStatus(String status, long id) {
		
		try {
			
			String updateStatus = "UPDATE projetos SET status=? WHERE id=?";
			
			PreparedStatement stmt = connection.prepareStatement(updateStatus);
			
			stmt.setString(1, status);
			stmt.setLong(2, id);
			
			stmt.execute();
			stmt.close();
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	public void excluir(long id) {
		
		String deleteSQL = "DELETE FROM projetos WHERE id=?";
		deletar(deleteSQL, id);
		
	}
	
	public List<Projeto> listarProjetosDaInstituicao(long idInstituicao) {
		
		try {
			
			projetos = new ArrayList<Projeto>();
			
			String consulta = "SELECT * FROM projetos AS p INNER JOIN clientes AS c ON p.id_gerente_do_projeto = c.id WHERE c.id_instituicao=?";
			
			PreparedStatement stmt = connection.prepareStatement(consulta);
			
			stmt.setLong(1, idInstituicao);
			
			ResultSet rs = stmt.executeQuery();
			
			obterEstruturasDaLista(rs);
			
			stmt.close();
			
			return projetos;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}
	
	public List<Projeto> listarProjetosDoGerente(long idGerente) {
		
		try {
			
			projetos = new ArrayList<Projeto>();
			
			String consulta = "SELECT * FROM projetos AS p INNER JOIN solicitacoes_de_desenvolvimento_do_projeto AS sp ON p.id = sp.id_projeto "
					+ "INNER JOIN solicitacoes_de_desenvolvimento AS s ON sp.id_solicitacao_de_desenvolvimento = s.id WHERE s.id_solicitante=?";
			
			PreparedStatement stmt = connection.prepareStatement(consulta);
			
			stmt.setLong(1, idGerente);
			
			ResultSet rs = stmt.executeQuery();
			
			obterEstruturasDaLista(rs);
			
			stmt.close();
			
			return projetos;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}
	
	private void obterEstruturasDaLista(ResultSet rs) throws SQLException {
		
		if(rs != null) {
			
			projetos = new ArrayList<Projeto>();
			
			while(rs.next()) {
				
				gerenteDAO = new GerenteDAO(connection);
				gerenteDoProjeto = gerenteDAO.buscarPorId(rs.getLong("id_gerente_do_projeto"));
				
				Projeto projeto = new Projeto();
				
				projeto.setId(rs.getLong("id"));
				projeto.setTitulo(rs.getString("titulo"));
				projeto.setStatus(rs.getString("status"));
				projeto.setDataDeCriacao(rs.getDate("data_de_criacao"));
				projeto.setGerenteDoProjeto(gerenteDoProjeto);
				
				projetos.add(projeto);
				
			}
			
		}
		
		rs.close();
		
	}

	@Override
	public Object buscarPorId(long id) {
		
		try {
			
			String buscarProjeto = "SELECT * FROM projetos p LEFT JOIN avaliacoes_de_projetos ap ON p.id = ap.id_projeto WHERE p.id=?";
			
			PreparedStatement stmt = connection.prepareStatement(buscarProjeto);
			
			stmt.setLong(1, id);
			
			ResultSet rs = stmt.executeQuery();
			
			if(rs != null && rs.next()) {
				
				gerenteDAO = new GerenteDAO(connection);
				gerenteDoProjeto = gerenteDAO.buscarPorId(rs.getLong("id_gerente_do_projeto"));
				
				avaliacaoDeProjetoDAO = new AvaliacaoDeProjetoDAO(connection);
				avaliacaoDoProjeto = 
						(AvaliacaoDeProjeto) avaliacaoDeProjetoDAO.buscarPorId(rs.getLong("ap.id"));
				
				projeto = new Projeto();
				
				projeto.setId(rs.getLong("id"));
				projeto.setTitulo(rs.getString("titulo"));
				projeto.setDescricao(rs.getString("descricao"));
				projeto.setStatus(rs.getString("status"));
				projeto.setResumo(rs.getString("resumo"));
				projeto.setGerenteDoProjeto(gerenteDoProjeto);
				projeto.setAvaliacaoDoProjeto(avaliacaoDoProjeto);
				projeto.setDataDeCriacao(rs.getDate("data_de_criacao"));
				projeto.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				projeto.setDataDeConclusao(rs.getDate("data_de_conclusao"));
				
				solicitacaoDeDesenvolvimentoDAO = new SolicitacaoDeDesenvolvimentoDAO(connection);
				solicitacoesDeDesenvolvimentoDoProjeto = solicitacaoDeDesenvolvimentoDAO.listarSolicitacoesDeDesenvolvimentoDoProjeto(rs.getLong("id"));
				
				projeto.setSolicitacoesDeDesenvolvimentoDoProjeto(solicitacoesDeDesenvolvimentoDoProjeto);
				
			}
			
			rs.close();
			stmt.close();
			
			return projeto;
			
		} catch (SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}

}
