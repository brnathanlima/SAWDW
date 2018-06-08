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
	List<EstruturaDeWebsite> estruturasDeWebsites = null;
	
	Categoria categoria = null;
	CategoriaDAO categoriaDAO = null;
	
	public EstruturaDeWebsiteDAO(Connection connection) {
		
		super(connection);
		this.connection = connection;
		
	}
	
	public void adicionar(EstruturaDeWebsite estruturaDeWebsite) {
		
		String insertSQL = "INSERT INTO estruturas_de_websites (id_categoria, nome, descricao, data_de_criacao) VALUES (?, ?, ?, ?)";
		
		super.salvar(insertSQL, estruturaDeWebsite.getCategoria().getId(), estruturaDeWebsite.getNome(), estruturaDeWebsite.getDescricao(), 
				estruturaDeWebsite.getDataDeCriacao());
		
	}
	
	public void editar(EstruturaDeWebsite estruturaDeWebsite) {
		
		String updateSQL = "UPDATE estruturas_de_websites SET id_categoria=?, nome=?, descricao=?, data_de_modificacao=? WHERE id=?";
		
		super.atualizar(updateSQL, estruturaDeWebsite.getId(), estruturaDeWebsite.getCategoria().getId(), estruturaDeWebsite.getNome(), estruturaDeWebsite.getDescricao(), 
				estruturaDeWebsite.getDataDeModificacao());
		
	}
	
	public void excluir(long id)  {
		
		String deleteSQL = "DELETE FROM estruturas_de_websites WHERE id=?";
		super.deletar(deleteSQL, id);
		
	}
	
	public List<EstruturaDeWebsite> listarEstruturasDeWebsitesDaInstituicao(long idInstituicao) {
		
		try {
			
			estruturasDeWebsites = new ArrayList<EstruturaDeWebsite>();
			
			String busca = "SELECT e.id FROM estruturas_de_websites AS e INNER JOIN  categorias_de_websites as c ON e.id_categoria = c.id WHERE "
					+ "c.id_instituicao=?";
			
			PreparedStatement stmt = this.connection.prepareStatement(busca);
			stmt.setLong(1, idInstituicao);
			ResultSet rs = stmt.executeQuery();
			
			obterEstruturasDaLista(rs);
			
			stmt.close();
			
			return estruturasDeWebsites;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}
	
	public List<EstruturaDeWebsite> listarEstruturasDeWebsitesDaCategoria(long idCategoria) {
		
		try {
			
			estruturasDeWebsites = new ArrayList<EstruturaDeWebsite>();
			
			String busca = "SELECT e.id FROM estruturas_de_websites AS e INNER JOIN categorias_de_websites AS c ON e.id_categoria = c.id WHERE c.id=?";
			
			PreparedStatement stmt = this.connection.prepareStatement(busca);
			stmt.setLong(1, idCategoria);
			ResultSet rs = stmt.executeQuery();
			
			obterEstruturasDaLista(rs);

			stmt.close();
			
			return estruturasDeWebsites;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}
	
	public List<EstruturaDeWebsite> listarEstruturasDeWebsitesDaSolicitacao(long idSolicitacao) {
		
		try {
			
			estruturasDeWebsites = new ArrayList<EstruturaDeWebsite>();
			
			String buscaEstruturas = "SELECT e.id FROM estruturas_de_websites AS e "
					+ "INNER JOIN estruturas_de_websites_das_solicitacoes AS es ON e.id = es.id_estrutura_de_website "
					+ "INNER JOIN solicitacoes_de_desenvolvimento AS s ON s.id = es.id_solicitacao_de_desenvolvimento "
					+ "WHERE s.id=?";
			
			PreparedStatement pstmt = connection.prepareStatement(buscaEstruturas);
			pstmt.setLong(1, idSolicitacao);
			ResultSet rs = pstmt.executeQuery();
			
			obterEstruturasDaLista(rs);
			
			return estruturasDeWebsites;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}
	
	@Override
	public EstruturaDeWebsite buscarPorId(long id) {
		
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
				
				EstruturaDePaginaDAO estruturaDePaginaDAO = new EstruturaDePaginaDAO(connection);
				estruturaDeWebsite.setEstruturasDePaginasDoWebsite(estruturaDePaginaDAO.listarEstruturasDePaginasDoWebsite(rs.getLong("id")));
				
			}
			
			rs.close();
			stmt.close();
			
			return estruturaDeWebsite;
		
		} catch (SQLException e) {
			
			throw new RuntimeException(e);
			
		}
	}
	
	private void obterEstruturasDaLista(ResultSet rs) throws SQLException {
		
		estruturasDeWebsites = new ArrayList<EstruturaDeWebsite>();
		
		if (rs != null) {
			
			while(rs.next()) {
				
				estruturaDeWebsite = buscarPorId(rs.getLong("id"));
				
				estruturasDeWebsites.add(estruturaDeWebsite);
				
			}
			
		}
		
		rs.close();
		
	}

}
