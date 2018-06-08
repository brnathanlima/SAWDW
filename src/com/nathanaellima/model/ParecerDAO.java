package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.nathanaellima.modelo.Parecer;

public class ParecerDAO extends GenericoDAO {
	
	Connection connection;
	
	Parecer parecer;
	
	public ParecerDAO(Connection connection) {
		
		super(connection);
		this.connection = connection;
		
	}
	
	public void adicionar(Parecer parecer) {
		
		String insertSQL = "INSERT INTO pareceres (id_solicitacao, recomendacao, justificativa, data_de_emissao) "
				+ "VALUES (?, ?, ?, ?)";
		
		super.salvar(insertSQL, parecer.getSolicitacaoDeDesenvolvimento().getId(), parecer.getRecomendacao(), parecer.getJustificativa(), 
				parecer.getDataDeEmissao());
		
	}
	
	public void editar(Parecer parecer) {
		
		String insertSQL = "UPDATE pareceres SET recomendacao=?, justificativa=?, data_de_modificacao=? WHERE id=?";
		
		super.atualizar(insertSQL, parecer.getId(), parecer.getRecomendacao(), parecer.getJustificativa(), parecer.getDataDeModificacao());
		
	}
	
	public void excluir(long id) {
		
		String deleteSQL =  "DELETE FROM pareceres WHERE id=?";
		super.deletar(deleteSQL, id);
		
	}

	@Override
	protected Object buscarPorId(long id) {
		
		try {
			
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM pareceres WHERE id=?");
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				
				parecer = new Parecer();
				
				parecer.setId(rs.getLong("id"));
				parecer.setRecomendacao(rs.getString("recomendacao"));
				parecer.setJustificativa(rs.getString("justificativa"));
				parecer.setDataDeEmissao(rs.getDate("data_de_emissao"));
				parecer.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			stmt.close();
			
			return parecer;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
	}

}
