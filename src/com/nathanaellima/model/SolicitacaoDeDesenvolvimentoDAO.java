package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.nathanaellima.modelo.AvaliacaoDeSolicitacaoDeDesenvolvimento;
import com.nathanaellima.modelo.EstruturaDeWebsite;
import com.nathanaellima.modelo.Gerente;
import com.nathanaellima.modelo.Parecer;
import com.nathanaellima.modelo.Projeto;
import com.nathanaellima.modelo.SolicitacaoDeDesenvolvimento;

public class SolicitacaoDeDesenvolvimentoDAO extends GenericoDAO {
	
	private Connection connection;
	
	SolicitacaoDeDesenvolvimento solicitacaoDeDesenvolvimento;
	Gerente solicitante;
	Parecer parecer;
	AvaliacaoDeSolicitacaoDeDesenvolvimento avaliacaoDaSolicitacao;
	Projeto projeto;
	
	List<SolicitacaoDeDesenvolvimento> solicitacoesDeDesenvolvimento;
	List<EstruturaDeWebsite> estruturasDeWebsitesDaSolicitacao;
	
	GerenteDAO gerenteDAO;
	EstruturaDeWebsiteDAO estruturaDeWebsiteDAO;
	ParecerDAO parecerDAO;
	AvaliacaoDeSolicitacaoDeDesenvolvimentoDAO avaliacaoDeSolicitacaoDeDesenvolvimentoDAO;
	ProjetoDAO projetoDAO;
	
	public SolicitacaoDeDesenvolvimentoDAO(Connection connection) {
		
		super(connection);
		this.connection = connection;
		
	}
	
	public void adicionar(SolicitacaoDeDesenvolvimento solicitacaoDeDesenvolvimento) {
		
		String insertSolicitacao = "INSERT INTO solicitacoes_de_desenvolvimento(id_solicitante, titulo, justificativa,"
				+ "status, data_de_realizacao) VALUES (?, ?, ?, ?, ?)";
		String insertEstruturas = "INSERT INTO estruturas_de_websites_das_solicitacoes(id_solicitacao_de_desenvolvimento, id_estrutura_de_website) "
				+ "VALUES(?, ?)";
		
		try {
			
			PreparedStatement stmt1 = connection.prepareStatement(insertSolicitacao, Statement.RETURN_GENERATED_KEYS);
			
			stmt1.setLong(1, solicitacaoDeDesenvolvimento.getSolicitante().getId());
			stmt1.setString(2, solicitacaoDeDesenvolvimento.getTitulo());
			stmt1.setString(3, solicitacaoDeDesenvolvimento.getJustificativa());
			stmt1.setString(4, solicitacaoDeDesenvolvimento.getStatus());
			stmt1.setDate(5, new java.sql.Date(solicitacaoDeDesenvolvimento.getDataDeRealizacao().getTime()));
			
			int linhasAfetadas = stmt1.executeUpdate();
			
			if(linhasAfetadas == 0) {
				
				throw new SQLException("Falha ao adicionar solicitação.");
				
			}
			
			try(ResultSet idGerado = stmt1.getGeneratedKeys()) {
				
				if(idGerado.next()) {
					
					solicitacaoDeDesenvolvimento.setId(idGerado.getLong(1));
					
					PreparedStatement stmt2 = connection.prepareStatement(insertEstruturas);
					
					for(EstruturaDeWebsite estruturaDeWebsite : solicitacaoDeDesenvolvimento.getEstruturasDeWebsitesSolicitadas()) {
						
						stmt2.setLong(1, solicitacaoDeDesenvolvimento.getId());
						stmt2.setLong(2, estruturaDeWebsite.getId());
						
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
	
	public void editar(SolicitacaoDeDesenvolvimento solicitacaoDeDesenvolvimento) {	
		
		String updateSolicitacao = "UPDATE solicitacoes_de_desenvolvimento SET titulo=?, justificativa=?, data_de_modificacao=? WHERE id=?";
		
		try {
			
			PreparedStatement stmt1 = connection.prepareStatement(updateSolicitacao);

			stmt1.setString(1, solicitacaoDeDesenvolvimento.getTitulo());
			stmt1.setString(2, solicitacaoDeDesenvolvimento.getJustificativa());
			stmt1.setDate(3, new java.sql.Date(solicitacaoDeDesenvolvimento.getDataDeModificacao().getTime()));
			stmt1.setLong(4, solicitacaoDeDesenvolvimento.getId());
			
			stmt1.execute();
			stmt1.close();

			
			String apagarEstruturasDaSolicitacao = "DELETE FROM estruturas_de_websites_das_solicitacoes WHERE id_solicitacao_de_desenvolvimento=?";
			
			PreparedStatement stmt2 = connection.prepareStatement(apagarEstruturasDaSolicitacao);
			stmt2.setLong(1, solicitacaoDeDesenvolvimento.getId());

			stmt2.execute();
			stmt2.close();
			
			String inserirEstruturas = "INSERT INTO estruturas_de_websites_das_solicitacoes(id_solicitacao_de_desenvolvimento,"
					+ "id_estrutura_de_website) VALUES(?, ?)";
			
			PreparedStatement stmt3 = connection.prepareStatement(inserirEstruturas);
			
			for(EstruturaDeWebsite estruturaDeWebsite : solicitacaoDeDesenvolvimento.getEstruturasDeWebsitesSolicitadas()) {

				stmt3.setLong(1, solicitacaoDeDesenvolvimento.getId());
				stmt3.setLong(2, estruturaDeWebsite.getId());

				stmt3.execute();
				
			}
			
			stmt3.close();
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	public void excluir(long id) {
		
		String deleteSQL =  "DELETE FROM solicitacoes_de_desenvolvimento WHERE id=?";
		deletar(deleteSQL, id);
		
	}
	
	public void mudarStatus(String status, long id) {
		
		String updateStaus = "UPDATE solicitacoes_de_desenvolvimento SET status=? WHERE id=?";
		
		try {
			
			PreparedStatement stmt = connection.prepareStatement(updateStaus);

			stmt.setString(1, status);
			stmt.setLong(2, id);
			
			stmt.execute();
			stmt.close();
			
		} catch(SQLException e) {
		
			e.printStackTrace();
			
		}
		
	}
	
	public List<SolicitacaoDeDesenvolvimento> listarSolicitacoesDaInstituicao(long idInstituicao) {
		
		try {
			
			solicitacoesDeDesenvolvimento = new ArrayList<SolicitacaoDeDesenvolvimento>();
			
			PreparedStatement pstmt = this.connection.prepareStatement("SELECT s.id, s.id_solicitante, s.titulo, s.justificativa, s.status, "
					+ "s.data_de_realizacao, s.data_de_modificacao FROM solicitacoes_de_desenvolvimento as s INNER JOIN "
					+ "clientes as c ON s.id_solicitante = c.id WHERE c.id_instituicao=?");
			
			pstmt.setLong(1, idInstituicao);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				gerenteDAO = new GerenteDAO(connection);
				solicitante = gerenteDAO.buscarPorId(rs.getLong("id_solicitante"));
				
				SolicitacaoDeDesenvolvimento solicitacaoDeDesenvolvimento = 
						new SolicitacaoDeDesenvolvimento.Builder()
																  .id(rs.getLong("id"))
																  .titulo(rs.getString("titulo"))
																  .justificativa(rs.getString("justificativa"))
																  .status(rs.getString("status"))
																  .dataDeRealizacao(rs.getDate("data_de_realizacao"))
																  .dataDeModificacao(rs.getDate("data_de_modificacao"))
																  .solicitante(solicitante)
																  .solicitar();
				
				solicitacoesDeDesenvolvimento.add(solicitacaoDeDesenvolvimento);
				
			}
			
			rs.close();
			pstmt.close();
			
			return solicitacoesDeDesenvolvimento;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}
	
	public List<SolicitacaoDeDesenvolvimento> listarSolicitacoesDeDesenvolvimentoDoGerente(long idSolicitante) {
		
		try {
			
			solicitacoesDeDesenvolvimento = new ArrayList<SolicitacaoDeDesenvolvimento>();
			
			PreparedStatement pstmt = this.connection.prepareStatement("SELECT * FROM solicitacoes_de_desenvolvimento WHERE "
					+ "id_solicitante=?");
			pstmt.setLong(1, idSolicitante);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				SolicitacaoDeDesenvolvimento solicitacaoDeDesenvolvimento = 
						new SolicitacaoDeDesenvolvimento.Builder()
																  .id(rs.getLong("id"))
																  .titulo(rs.getString("titulo"))
																  .justificativa(rs.getString("justificativa"))
																  .status(rs.getString("status"))
																  .dataDeRealizacao(rs.getDate("data_de_realizacao"))
																  .dataDeModificacao(rs.getDate("data_de_modificacao"))
																  .solicitar();
				
				solicitacoesDeDesenvolvimento.add(solicitacaoDeDesenvolvimento);
				
			}
			
			rs.close();
			pstmt.close();
			
			return solicitacoesDeDesenvolvimento;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}
	
	public List<SolicitacaoDeDesenvolvimento> listarSolicitacoesDeDesenvolvimentoDaEstruturaDeWebsite(long idEstruturaDeWebsite) {
		
		try {
			
			String busca = "SELECT s.* FROM solicitacoes_de_desenvolvimento AS s INNER JOIN estruturas_de_websites_das_solicitacoes AS es "
					+ "ON s.id = es.id_solicitacao_de_desenvolvimento WHERE es.id_estrutura_de_website=? AND s.status = 'Nova'";
			
			solicitacoesDeDesenvolvimento = new ArrayList<SolicitacaoDeDesenvolvimento>();
						
			PreparedStatement pstmt = this.connection.prepareStatement(busca);
			pstmt.setLong(1, idEstruturaDeWebsite);
			ResultSet rs = pstmt.executeQuery();
			
			obterEstruturasDaLista(rs);
			
			pstmt.close();
			
			return solicitacoesDeDesenvolvimento;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}
	
	public List<SolicitacaoDeDesenvolvimento> listarSolicitacoesDeDesenvolvimentoAprovadasDaInstituicao(long idInstituicao) {
		
		try {
			
			solicitacoesDeDesenvolvimento = new ArrayList<SolicitacaoDeDesenvolvimento>();
			
			PreparedStatement pstmt = this.connection.prepareStatement("SELECT s.id, s.id_solicitante, s.titulo, s.justificativa, s.status, "
					+ "s.data_de_realizacao, s.data_de_modificacao FROM solicitacoes_de_desenvolvimento as s INNER JOIN clientes as c "
					+ "ON s.id_solicitante = c.id WHERE s.status='Aceita' AND c.id_instituicao=?");
			
			pstmt.setLong(1, idInstituicao);
			ResultSet rs = pstmt.executeQuery();
			
			obterEstruturasDaLista(rs);
			
			pstmt.close();
			
			return solicitacoesDeDesenvolvimento;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}
	
	public List<SolicitacaoDeDesenvolvimento> listarSolicitacoesDeDesenvolvimentoDoProjeto(long idProjeto) {
		
		try {
			
			solicitacoesDeDesenvolvimento = new ArrayList<SolicitacaoDeDesenvolvimento>();
			
			PreparedStatement pstmt = 
					this.connection.prepareStatement("SELECT * FROM solicitacoes_de_desenvolvimento AS s "
							+ "INNER JOIN solicitacoes_de_desenvolvimento_do_projeto AS sp ON s.id = sp.id_solicitacao_de_desenvolvimento "
							+ "INNER JOIN projetos AS p ON p.id = sp.id_projeto WHERE p.id=?");
			
			pstmt.setLong(1, idProjeto);
			ResultSet rs = pstmt.executeQuery();
			
			obterEstruturasDaLista(rs);
			
			pstmt.close();
			
			return solicitacoesDeDesenvolvimento;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}
	
	private void obterEstruturasDaLista(ResultSet rs) throws SQLException {
		
		solicitacoesDeDesenvolvimento = new ArrayList<SolicitacaoDeDesenvolvimento>();
		
		if (rs != null) {
			
			while(rs.next()) {
			
				SolicitacaoDeDesenvolvimento solicitacaoDeDesenvolvimento = 
						new SolicitacaoDeDesenvolvimento.Builder()
																  .id(rs.getLong("id"))
																  .titulo(rs.getString("titulo"))
																  .justificativa(rs.getString("justificativa"))
																  .status(rs.getString("status"))
																  .dataDeRealizacao(rs.getDate("data_de_realizacao"))
																  .dataDeModificacao(rs.getDate("data_de_modificacao"))
																  .solicitante(solicitante)
																  .solicitar();
				
				solicitacoesDeDesenvolvimento.add(solicitacaoDeDesenvolvimento);
			
			}
			
		}

		rs.close();
		
	}

	@Override
	public Object buscarPorId(long id) {
		
		try {
			
			String buscaSolicitacao = "SELECT * FROM solicitacoes_de_desenvolvimento AS s LEFT JOIN pareceres AS pc "
					+ "ON s.id = pc.id_solicitacao LEFT JOIN avaliacoes_de_solicitacoes_de_desenvolvimento AS a "
					+ "ON s.id = a.id_solicitacao LEFT JOIN solicitacoes_de_desenvolvimento_do_projeto AS sp "
					+ "ON s.id = sp.id_solicitacao_de_desenvolvimento LEFT JOIN projetos AS pj ON sp.id_projeto = pj.id WHERE s.id=?;";
			
			PreparedStatement pstmt = connection.prepareStatement(buscaSolicitacao);
			
			pstmt.setLong(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs != null && rs.next()) {
				
				gerenteDAO = new GerenteDAO(connection);
				solicitante = gerenteDAO.buscarPorId(rs.getLong("s.id_solicitante"));
				
				estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(connection);
				estruturasDeWebsitesDaSolicitacao = estruturaDeWebsiteDAO.listarEstruturasDeWebsitesDaSolicitacao(rs.getLong("s.id"));
				
				parecerDAO = new ParecerDAO(connection);
				parecer = (Parecer) parecerDAO.buscarPorId(rs.getLong("pc.id"));
				
				avaliacaoDeSolicitacaoDeDesenvolvimentoDAO = new AvaliacaoDeSolicitacaoDeDesenvolvimentoDAO(connection);
				avaliacaoDaSolicitacao = 
						(AvaliacaoDeSolicitacaoDeDesenvolvimento) avaliacaoDeSolicitacaoDeDesenvolvimentoDAO.buscarPorId(rs.getLong("a.id"));
				
				projetoDAO = new ProjetoDAO(connection);
				projeto = (Projeto) projetoDAO.buscarPorId(rs.getLong("pj.id"));
				
				solicitacaoDeDesenvolvimento = new SolicitacaoDeDesenvolvimento.Builder()
																  .id(rs.getLong("s.id"))
																  .titulo(rs.getString("s.titulo"))
																  .justificativa(rs.getString("s.justificativa"))
																  .status(rs.getString("s.status"))
																  .estruturasDeWebsites(estruturasDeWebsitesDaSolicitacao)
																  .dataDeRealizacao(rs.getDate("s.data_de_realizacao"))
																  .dataDeModificacao(rs.getDate("s.data_de_modificacao"))
																  .solicitante(solicitante)
																  .parecer(parecer)
																  .avaliacaoDaSolicitacao(avaliacaoDaSolicitacao)
																  .projetoDaSolicitacao(projeto)
																  .solicitar();
				
			}
			
			rs.close();
			pstmt.close();
			
			return solicitacaoDeDesenvolvimento;
			
		} catch (SQLException e) {
			
			throw new RuntimeException(e);
			
		} 
		
	}

}
