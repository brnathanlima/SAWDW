package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.nathanaellima.modelo.AvaliacaoDeSolicitacaoDeDesenvolvimento;

public class AvaliacaoDeSolicitacaoDeDesenvolvimentoDAO extends GenericoDAO {
	
	Connection connection;
	
	AvaliacaoDeSolicitacaoDeDesenvolvimento avaliacaoDaSolicitacao;
	
	public AvaliacaoDeSolicitacaoDeDesenvolvimentoDAO(Connection connection) {
		
		super(connection);
		this.connection = connection;
		
	}
	
	public void adicionar(AvaliacaoDeSolicitacaoDeDesenvolvimento avaliacaoDaSolicitacao) throws SQLException {
		
		String insertSQL = "INSERT INTO avaliacoes_de_solicitacoes_de_desenvolvimento (id_solicitacao, avaliacao, justificativa, data_de_emissao) "
				+ "VALUES (?, ?, ?, ?)";
		
		super.salvar(insertSQL, avaliacaoDaSolicitacao.getSolicitacaoDeDesenvolvimento().getId(), avaliacaoDaSolicitacao.getAvaliacao(),
				avaliacaoDaSolicitacao.getJustificativa(), avaliacaoDaSolicitacao.getDataDeEmissao());
		
	}
	
	public void editar(AvaliacaoDeSolicitacaoDeDesenvolvimento avaliacaoDaSolicitacao) throws SQLException {
		
		String updateSQL = "UPDATE avaliacoes_de_solicitacoes_de_desenvolvimento SET avaliacao=?, justificativa=?, data_de_modificacao=? WHERE id=?";
		
		super.atualizar(updateSQL, avaliacaoDaSolicitacao.getId(), avaliacaoDaSolicitacao.getAvaliacao(), avaliacaoDaSolicitacao.getJustificativa(),
				avaliacaoDaSolicitacao.getDataDeModificacao());
		
	}
	
	public void excluir(long id) throws SQLException {
		
		String deleteSQL =  "DELETE FROM avaliacoes_de_solicitacoes_de_desenvolvimento WHERE id=?";
		super.deletar(deleteSQL, id);
		
	}

	@Override
	protected Object buscarPorId(long id) {
		
		try {
			
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM avaliacoes_de_solicitacoes_de_desenvolvimento WHERE id=?");
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				
				avaliacaoDaSolicitacao = new AvaliacaoDeSolicitacaoDeDesenvolvimento();
				
				avaliacaoDaSolicitacao.setId(rs.getLong("id"));
				avaliacaoDaSolicitacao.setAvaliacao(rs.getString("avaliacao"));
				avaliacaoDaSolicitacao.setJustificativa(rs.getString("justificativa"));
				avaliacaoDaSolicitacao.setDataDeEmissao(rs.getDate("data_de_emissao"));
				avaliacaoDaSolicitacao.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			stmt.close();
			
			return avaliacaoDaSolicitacao;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}

}
