package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nathanaellima.modelo.Categoria;
import com.nathanaellima.modelo.EstruturaDeWebsite;

public class CategoriaDAO extends GenericoDAO {
	
	Connection connection;
	
	public CategoriaDAO(Connection connection) {
		
		super(connection);
		this.connection = connection;
		
	}
	
	public void adicionar(Categoria categoria) {
		
		String insertSQL = "INSERT INTO categorias_de_websites(id_instituicao, nome, descricao, data_de_criacao) "
				+ "VALUES (?, ?, ?, ?)";
		
		super.salvar(insertSQL, categoria.getInstituicao().getId(), categoria.getNome(), categoria.getDescricao(), categoria.getDataDeCriacao());
		
	}
	
	public void editar(Categoria categoria) {
		
		String updateSQL = "UPDATE categorias_de_websites SET nome=?, descricao=?, data_de_modificacao=? WHERE id=?";
		
		super.atualizar(updateSQL, categoria.getId(), categoria.getNome(), categoria.getDescricao(),
				categoria.getDataDeModificacao());
		
	}
	
	public void excluir(long id) {
		
		String deleteSQL =  "DELETE FROM categorias_de_websites WHERE id=?";
		super.deletar(deleteSQL, id);
		
	}
	
	@Override
	public Object buscarPorId(long id) {
		
		try {
			
			Categoria categoria = null;
			
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM categorias_de_websites WHERE id=?");
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			
			if(rs != null && rs.next()) {
				
				categoria = new Categoria();
				
				categoria.setId(rs.getLong("id"));
				categoria.setNome(rs.getString("nome"));
				categoria.setDescricao(rs.getString("descricao"));
				categoria.setDataDeCriacao(rs.getDate("data_de_criacao"));
				categoria.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			stmt.close();
			
			return categoria;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
		
	}
	
	public List<Categoria> listarCategoriasDaInstituicao(long idInstituicao) {
		
		try {
			
			List<Categoria> categoriasDeWebsites = new ArrayList<Categoria>();
			
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM categorias_de_websites WHERE id_instituicao=?");
			stmt.setLong(1, idInstituicao);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				Categoria categoria = new Categoria();
				
				categoria.setId(rs.getLong("id"));
				categoria.setNome(rs.getString("nome"));
				categoria.setDescricao(rs.getString("descricao"));
				categoria.setDataDeCriacao(rs.getDate("data_de_criacao"));
				categoria.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
				EstruturaDeWebsiteDAO estruturaDeWebsiteDAO = new EstruturaDeWebsiteDAO(connection);
				List<EstruturaDeWebsite> estruturasDeWebsitesDaCategoria = 
						estruturaDeWebsiteDAO.listarEstruturasDeWebsitesDaCategoria(rs.getLong("id"));
				
				categoria.setEstruturasDeWebsitesDaCategoria(estruturasDeWebsitesDaCategoria);
				
				categoriasDeWebsites.add(categoria);
				
			}
			
			rs.close();
			stmt.close();
			
			return categoriasDeWebsites;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}

	

}
