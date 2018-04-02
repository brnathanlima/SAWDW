package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nathanaellima.modelo.Categoria;
import com.nathanaellima.modelo.EstruturaDeWebsite;

public class EstruturaDeWebsiteDAO extends GenericoDAO {
	
	Connection connection;
	
	EstruturaDeWebsite estruturaDeWebsite = null;
	List<Object> estruturasDeWebsites = null;
	
	Categoria categoria = null;
	CategoriaDAO categoriaDAO = null;
	
	public EstruturaDeWebsiteDAO(Connection connection) {
		
		super(connection);
		this.connection = connection;
		
	}
	
	public void adicionar(EstruturaDeWebsite estruturaDeWebsite) throws SQLException {
		
		String insertSQL = "INSERT INTO estruturas_de_websites (id_categoria, nome, descricao, data_de_criacao) VALUES (?, ?, ?, ?)";
		
		super.salvar(insertSQL, estruturaDeWebsite.getCategoria().getId(), estruturaDeWebsite.getNome(), estruturaDeWebsite.getDescricao(), 
				estruturaDeWebsite.getDataDeCriacao());
		
	}
	
	public void editar(EstruturaDeWebsite estruturaDeWebsite) throws SQLException {
		
		String updateSQL = "UPDATE estruturas_de_websites SET id_categoria=?, nome=?, descricao=?, data_de_modificacao=? WHERE id=?";
		
		super.atualizar(updateSQL, estruturaDeWebsite.getId(), estruturaDeWebsite.getCategoria().getId(), estruturaDeWebsite.getNome(), estruturaDeWebsite.getDescricao(), 
				estruturaDeWebsite.getDataDeModificacao());
		
	}
	
	public void excluir(long id)  throws SQLException {
		
		String deleteSQL = "DELETE FROM estruturas_de_websites WHERE id=?";
		super.deletar(deleteSQL, id);
		
	}
	
	public List<Object> listarEstruturasDeWebsitesDaInstituicao(long idInstituicao) {
		
		try {
			
			estruturasDeWebsites = new ArrayList<Object>();
			
			String busca = "SELECT * FROM estruturas_de_websites AS e INNER JOIN  categorias_de_websites as c ON e.id_categoria = c.id WHERE "
					+ "c.id_instituicao=?";
			
			PreparedStatement stmt = this.connection.prepareStatement(busca);
			stmt.setLong(1, idInstituicao);
			ResultSet rs = stmt.executeQuery();
			
			if (rs != null) {
				
				while (rs.next()) {
					
					estruturaDeWebsite = new EstruturaDeWebsite();
					
					categoriaDAO = new CategoriaDAO(connection);
					categoria = (Categoria) categoriaDAO.buscarPorId(rs.getLong("id_categoria"));
					
					estruturaDeWebsite.setId(rs.getLong("id"));
					estruturaDeWebsite.setCategoria(categoria);
					estruturaDeWebsite.setNome(rs.getString("nome"));
					estruturaDeWebsite.setDescricao(rs.getString("descricao"));
					estruturaDeWebsite.setDataDeCriacao(rs.getDate("data_de_criacao"));
					estruturaDeWebsite.setDataDeModificacao(rs.getDate("data_de_modificacao"));
					
					estruturasDeWebsites.add(estruturaDeWebsite);
					
				}
				
			}
			
			rs.close();
			stmt.close();
			
			return estruturasDeWebsites;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}
	
	public List<Object> listarEstruturasDeWebsitesDaCategoria(long idCategoria) {
		
		try {
			
			estruturasDeWebsites = new ArrayList<Object>();
			
			String busca = "SELECT e.* FROM estruturas_de_websites AS e INNER JOIN categorias_de_websites AS c sON e.id_categoria = c.id WHERE c.id=?";
			
			PreparedStatement stmt = this.connection.prepareStatement(busca);
			stmt.setLong(1, idCategoria);
			ResultSet rs = stmt.executeQuery();
			
			if (rs != null) {
				
				while (rs.next()) {
					
					estruturaDeWebsite = new EstruturaDeWebsite();
					
					categoriaDAO = new CategoriaDAO(connection);
					categoria = (Categoria) categoriaDAO.buscarPorId(rs.getLong("id_categoria"));
					
					estruturaDeWebsite.setId(rs.getLong("id"));
					estruturaDeWebsite.setCategoria(categoria);
					estruturaDeWebsite.setNome(rs.getString("nome"));
					estruturaDeWebsite.setDescricao(rs.getString("descricao"));
					estruturaDeWebsite.setDataDeCriacao(rs.getDate("data_de_criacao"));
					estruturaDeWebsite.setDataDeModificacao(rs.getDate("data_de_modificacao"));
					
					estruturasDeWebsites.add(estruturaDeWebsite);
					
				}
				
			}
			
			rs.close();
			stmt.close();
			
			return estruturasDeWebsites;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}
	
	@Override
	public Object buscarPorId(long id) {
		
		try {
			
			estruturaDeWebsite = new EstruturaDeWebsite();
			
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM estruturas_de_websites WHERE id=?");
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				
				categoriaDAO = new CategoriaDAO(connection);
				categoria = (Categoria) categoriaDAO.buscarPorId(rs.getLong("id_categoria"));
				
				estruturaDeWebsite.setId(rs.getLong("id"));
				estruturaDeWebsite.setCategoria(categoria);
				estruturaDeWebsite.setNome(rs.getString("nome"));
				estruturaDeWebsite.setDescricao(rs.getString("descricao"));
				estruturaDeWebsite.setDataDeCriacao(rs.getDate("data_de_criacao"));
				estruturaDeWebsite.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			stmt.close();
			
			return estruturaDeWebsite;
		
		} catch (SQLException e) {
			
			throw new RuntimeException(e);
			
		}
	}

}
