package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.nathanaellima.modelo.AvaliacaoDeProjeto;

public class AvaliacaoDeProjetoDAO extends GenericoDAO {
	
	Connection connection;
	
	AvaliacaoDeProjeto avaliacaoDeProjeto;
	
	public AvaliacaoDeProjetoDAO(Connection connection) {
		super(connection);
		this.connection = connection;
	}

	public void adicionar(AvaliacaoDeProjeto avaliacaoDeProjeto) {
		
		String insertAvalicao = "INSERT INTO avaliacoes_de_projetos(id_projeto, titulo, nota, comentario, data_de_emissao)"
				+ "VALUES(?, ?, ?, ?, ?)";
		
		super.salvar(insertAvalicao, avaliacaoDeProjeto.getProjeto().getId(), avaliacaoDeProjeto.getTitulo(), avaliacaoDeProjeto.getNota(),
				avaliacaoDeProjeto.getComentario(), avaliacaoDeProjeto.getDataDeEmissao());
		
	}
	
	public void editar(AvaliacaoDeProjeto avaliacaoDeProjeto) {
		
		String updateAvaliacao = "UPDATE avaliacoes_de_projetos SET titulo=?, nota=?, comentario=?, data_de_modificacao=? WHERE id=?";
		
		super.atualizar(updateAvaliacao, avaliacaoDeProjeto.getId(), avaliacaoDeProjeto.getTitulo(), avaliacaoDeProjeto.getNota(),
				avaliacaoDeProjeto.getComentario(), avaliacaoDeProjeto.getDataDeModificacao());
		
	}
	
	public void excluir(long id) {
		
		String deleteAvaliacao = "DELETE FROM avaliacoes_de_projetos WHERE id=?";
		
		super.deletar(deleteAvaliacao, id);
		
	}
	
	
	@Override
	protected Object buscarPorId(long id) {
		
		try {
			
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM avaliacoes_de_projetos WHERE id=?");
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			
			if(rs != null && rs.next()) {
				
				avaliacaoDeProjeto = new AvaliacaoDeProjeto();
				
				avaliacaoDeProjeto.setId(rs.getLong("id"));
				avaliacaoDeProjeto.setTitulo(rs.getString("titulo"));
				avaliacaoDeProjeto.setNota(rs.getString("nota"));
				avaliacaoDeProjeto.setComentario(rs.getString("comentario"));
				avaliacaoDeProjeto.setDataDeEmissao(rs.getDate("data_de_emissao"));
				avaliacaoDeProjeto.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			stmt.close();
			
			return avaliacaoDeProjeto;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}

}
