package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nathanaellima.modelo.EstruturaDePagina;

public class EstruturaDePaginaDAO extends GenericoDAO {
	
	private Connection connection;
	
	EstruturaDePagina estruturaDePagina = null;
	List<EstruturaDePagina> estruturasDePaginas = null;
	
	public EstruturaDePaginaDAO(Connection connection) {
		
		super(connection);
		this.connection = connection;
		
	}
	
	public void adicionar(EstruturaDePagina estruturaDePagina) throws SQLException {
		
		String insertSQL = "INSERT INTO estruturas_de_paginas (id_estrutura_de_website	, titulo, conteudo, data_de_criacao) VALUES (?, ?, ?, ?)";
		
		super.salvar(insertSQL, estruturaDePagina.getEstruturaDeWebsite().getId(), estruturaDePagina.getTitulo(),
				estruturaDePagina.getConteudo(), estruturaDePagina.getDataDeCriacao());
		
	}
	
	public void editar(EstruturaDePagina estruturaDePagina) throws SQLException {
		
		String updateSQL = "UPDATE estruturas_de_paginas SET titulo=?, conteudo=?, data_de_modificacao=? WHERE id=?";
		
		super.atualizar(updateSQL, estruturaDePagina.getId(), estruturaDePagina.getTitulo(), estruturaDePagina.getConteudo(), 
				estruturaDePagina.getDataDeModificacao());
		
	}
	
	public void excluir(long id) throws SQLException {
		
		String deleteSQL = "DELETE FROM estruturas_de_paginas WHERE id=?";
		
		super.deletar(deleteSQL, id);
		
	}
	
	public List<EstruturaDePagina> listarEstruturasDePaginasDoWebsite(long idEstruturaDeWebsite) {
		
		try {
			
			estruturasDePaginas = new ArrayList<EstruturaDePagina>();
			
			String busca = "SELECT * FROM estruturas_de_paginas WHERE id_estrutura_de_website=?";
			
			PreparedStatement stmt = connection.prepareStatement(busca);
			stmt.setLong(1, idEstruturaDeWebsite);
			ResultSet rs = stmt.executeQuery();
			
			if (rs != null) {
				
				while (rs.next()) {
					
					estruturaDePagina = new EstruturaDePagina();
					
					estruturaDePagina.setId(rs.getLong("id"));
					estruturaDePagina.setTitulo(rs.getString("titulo"));
					estruturaDePagina.setConteudo(rs.getString("conteudo"));
					estruturaDePagina.setDataDeCriacao(rs.getDate("data_de_criacao"));
					estruturaDePagina.setDataDeModificacao(rs.getDate("data_de_modificacao"));
					
					estruturasDePaginas.add(estruturaDePagina);
					
				}
				
			}
			
			rs.close();
			stmt.close();
			
			return estruturasDePaginas;
			
		} catch (SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}
	
	@Override
	public Object buscarPorId(long id) {
		
		try {
			
			estruturaDePagina = new EstruturaDePagina();
			
			String busca = "SELECT * FROM estruturas_de_paginas WHERE id=?";
			
			PreparedStatement stmt = connection.prepareStatement(busca);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				
				estruturaDePagina.setId(rs.getLong("id"));
				estruturaDePagina.setTitulo(rs.getString("titulo"));
				estruturaDePagina.setConteudo(rs.getString("conteudo"));
				estruturaDePagina.setDataDeCriacao(rs.getDate("data_de_criacao"));
				estruturaDePagina.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			stmt.close();
			
			return estruturaDePagina;
			
		} catch (SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}

}
