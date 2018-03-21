package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.nathanaellima.factory.UsuarioFactory;
import com.nathanaellima.modelo.SuperAdministrador;
import com.nathanaellima.modelo.Usuario;

public class SuperAdministradorDAO extends GenericoDAO {
	
	Connection connection;

	public SuperAdministradorDAO(Connection connection) {
		
		super(connection);
		this.connection = connection;

	}
	
	public void adicionar(SuperAdministrador superAdministrador) throws SQLException {
		
		String insertSQL = "INSERT INTO super_administradores(nome,  sobrenome,  email, telefone, "
				+ "nome_de_usuario, senha, data_de_registro) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		super.salvar(insertSQL, superAdministrador.getNome(), superAdministrador.getSobrenome(), superAdministrador.getEmail(), 
				superAdministrador.getTelefone(), superAdministrador.getNomeDeUsuario(), superAdministrador.getSenha(), 
				superAdministrador.getDataDeRegistro());
		
	}
	
	public void editar(SuperAdministrador superAdministrador) throws SQLException {
		
		String updateSQL = "UPDATE super_administradores SET nome=?,  sobrenome=?,  email=?, telefone=?, nome_de_usuario=?,"
				+ "senha=?, data_de_modificacao=? WHERE id=?";
		
		super.atualizar(updateSQL, superAdministrador.getId(), superAdministrador.getNome(), superAdministrador.getSobrenome(), 
				superAdministrador.getEmail(), superAdministrador.getTelefone(), superAdministrador.getNomeDeUsuario(), 
				superAdministrador.getSenha(), superAdministrador.getDataDeModificacao());
		
	}
	
	public void excluir(long id) throws SQLException {
		
		String deleteSQL =  "DELETE FROM super_administradores WHERE id=?";
		super.deletar(deleteSQL, id);
		
	}
	
	public List<Object> listar() {
		
		try {
			
			List<Object> superAdministradores = new ArrayList<Object>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM super_administradores");
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				SuperAdministrador superAdministrador = new SuperAdministrador();
				superAdministrador.setId(rs.getLong("id"));
				superAdministrador.setNome(rs.getString("nome"));
				superAdministrador.setSobrenome(rs.getString("sobrenome"));
				superAdministrador.setEmail(rs.getString("email"));
				superAdministrador.setTelefone(rs.getString("telefone"));
				superAdministrador.setNomeDeUsuario(rs.getString("nome_de_usuario"));
				superAdministrador.setSenha(rs.getString("senha"));
				superAdministrador.setDataDeRegistro(rs.getDate("data_de_registro"));
				superAdministrador.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
				superAdministradores.add(superAdministrador);
				
			}
			
			rs.close();
			stmt.close();
			
			return superAdministradores;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}

	@Override
	public Object buscarPorId(long id) {

		return null;
		
	}

	@SuppressWarnings("finally")
	@Override
	public Object autenticarUsuario(String nomeDeUsuario, String senha) {
		
		Usuario superAdministrador = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			ps = connection.prepareStatement("SELECT * FROM super_administradores WHERE nome_de_usuario=? AND senha=? LIMIT 1");
			ps.setString(1, nomeDeUsuario);
			ps.setString(2, senha);
			
			rs = ps.executeQuery();
			
			if (rs != null && rs.next()) {
				
				superAdministrador = UsuarioFactory.getUsuario("superAdministrador");
				
				superAdministrador.setId(rs.getLong("id"));
				superAdministrador.setNome(rs.getString("nome"));
				superAdministrador.setSobrenome(rs.getString("sobrenome"));
				superAdministrador.setEmail(rs.getString("email"));
				superAdministrador.setTelefone(rs.getString("telefone"));
				superAdministrador.setNomeDeUsuario(rs.getString("nome_de_usuario"));
				superAdministrador.setDataDeRegistro(rs.getDate("data_de_registro"));
				superAdministrador.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			ps.close();
		
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			
			return superAdministrador;
			
		}
		
	}

}
