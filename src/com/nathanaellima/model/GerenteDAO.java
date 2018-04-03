package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nathanaellima.factory.FuncionarioFactory;
import com.nathanaellima.modelo.Gerente;
import com.nathanaellima.modelo.Instituicao;

public class GerenteDAO extends GenericoDAO {

	Connection connection;
	
	Gerente gerente = null;
	Instituicao instituicao = null;
	InstituicaoDAO instituicaoDAO = null;
	List<Gerente> gerentes = null;

	public GerenteDAO(Connection connection) {
		
		super(connection);
		this.connection = connection;

	}
	
	public void adicionar(Gerente gerente) throws SQLException {
		
		String insertSQL = "INSERT INTO clientes(id_instituicao, nome,  sobrenome,  matricula, email, telefone, departamento, "
				+ "tipo_de_usuario, nome_de_usuario, senha, data_de_registro) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		super.salvar(insertSQL, gerente.getInstituicao().getId(), gerente.getNome(), gerente.getSobrenome(), gerente.getMatricula(), 
				gerente.getEmail(), gerente.getTelefone(), gerente.getDepartamento(), "gerente", gerente.getNomeDeUsuario(), 
				gerente.getSenha(), gerente.getDataDeRegistro());
		
	}
	
	public void editar(Gerente gerente) throws SQLException {
		
		String updateSQL = "UPDATE clientes SET id_instituicao=?, nome=?, sobrenome=?, matricula=?, email=?, telefone=?, departamento=?, "
				+ "tipo_de_usuario=?, nome_de_usuario=?, senha=?, data_de_modificacao=? WHERE id=?";
		
		super.atualizar(updateSQL, gerente.getId(), gerente.getInstituicao().getId(), gerente.getNome(), gerente.getSobrenome(), 
				gerente.getMatricula(), gerente.getEmail(), gerente.getTelefone(), gerente.getDepartamento(), "gerente", gerente.getNomeDeUsuario(), 
				gerente.getSenha(), gerente.getDataDeModificacao());
		
	}
	
	public void excluir(long id) throws SQLException {
		
		String deleteSQL =  "DELETE FROM clientes WHERE id=?";
		super.deletar(deleteSQL, id);
		
	}
	
	public List<Gerente> listarGerentesDaInstituicao(long idInstituicao) {
		
		try {
			
			gerentes = new ArrayList<Gerente>();
			
			String busca = "SELECT * FROM clientes WHERE id_instituicao=? AND tipo_de_usuario=?";
			
			PreparedStatement stmt = this.connection.prepareStatement(busca);
			stmt.setLong(1, idInstituicao);
			stmt.setString(2, "gerente");
			ResultSet rs = stmt.executeQuery();
			
			if(rs != null) {
				
				while(rs.next()) {
					
					gerente = (Gerente) FuncionarioFactory.getFuncionario("gerente");
					
					instituicaoDAO = new InstituicaoDAO(connection);
					instituicao = (Instituicao) instituicaoDAO.buscarPorId(rs.getLong("id_instituicao"));
					
					gerente.setInstituicao(instituicao);
					gerente.setId(rs.getLong("id"));
					gerente.setNome(rs.getString("nome"));
					gerente.setSobrenome(rs.getString("sobrenome"));
					gerente.setMatricula(rs.getString("matricula"));
					gerente.setEmail(rs.getString("email"));
					gerente.setTelefone(rs.getString("telefone"));
					gerente.setDepartamento(rs.getString("departamento"));
					gerente.setNomeDeUsuario(rs.getString("nome_de_usuario"));
					gerente.setSenha(rs.getString("senha"));
					gerente.setDataDeRegistro(rs.getDate("data_de_registro"));
					gerente.setDataDeModificacao(rs.getDate("data_de_modificacao"));
					
					gerentes.add(gerente);
					
				}
				
			}
			
			rs.close();
			stmt.close();
			
			return gerentes;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}

	@Override
	public Object buscarPorId(long id) {
		

		try {
			
			gerente = (Gerente) FuncionarioFactory.getFuncionario("gerente");
			
			PreparedStatement pstmt = this.connection.prepareStatement("SELECT * FROM clientes WHERE id=?");
			pstmt.setLong(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs != null && rs.next()) {
				
				instituicaoDAO = new InstituicaoDAO(connection);
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(rs.getLong("id_instituicao"));
				
				gerente.setInstituicao(instituicao);
				gerente.setId(rs.getLong("id"));
				gerente.setNome(rs.getString("nome"));
				gerente.setSobrenome(rs.getString("sobrenome"));
				gerente.setMatricula(rs.getString("matricula"));
				gerente.setEmail(rs.getString("email"));
				gerente.setTelefone(rs.getString("telefone"));
				gerente.setDepartamento(rs.getString("departamento"));
				gerente.setNomeDeUsuario(rs.getString("nome_de_usuario"));
				gerente.setSenha(rs.getString("senha"));
				gerente.setDataDeRegistro(rs.getDate("data_de_registro"));
				gerente.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			pstmt.close();
			
			return gerente;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}		
		
	}
	
	@SuppressWarnings("finally")
	public Object autenticarUsuario(String nomeDeUsuario, String senha) {
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			ps = connection.prepareStatement("SELECT * FROM clientes WHERE nome_de_usuario=? AND senha=? AND tipo_de_usuario=? LIMIT 1");
			ps.setString(1, nomeDeUsuario);
			ps.setString(2, senha);
			ps.setString(3, "gerente");
			
			rs = ps.executeQuery();
			
			if (rs != null && rs.next()) {
				
				gerente = (Gerente) FuncionarioFactory.getFuncionario("gerente");
				
				instituicaoDAO = new InstituicaoDAO(connection);
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(rs.getLong("id_instituicao"));
				
				gerente.setInstituicao(instituicao);
				gerente.setId(rs.getLong("id"));
				gerente.setNome(rs.getString("nome"));
				gerente.setSobrenome(rs.getString("sobrenome"));
				gerente.setMatricula(rs.getString("matricula"));
				gerente.setEmail(rs.getString("email"));
				gerente.setTelefone(rs.getString("telefone"));
				gerente.setDepartamento(rs.getString("departamento"));
				gerente.setNomeDeUsuario(rs.getString("nome_de_usuario"));
				gerente.setSenha(rs.getString("senha"));
				gerente.setDataDeRegistro(rs.getDate("data_de_registro"));
				gerente.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			ps.close();
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			
			return gerente;
			
		}
		
	}

}
