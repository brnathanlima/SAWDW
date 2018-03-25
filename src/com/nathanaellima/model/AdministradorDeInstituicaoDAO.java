package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nathanaellima.factory.FuncionarioFactory;
import com.nathanaellima.modelo.AdministradorDeInstituicao;
import com.nathanaellima.modelo.Funcionario;
import com.nathanaellima.modelo.Instituicao;

public class AdministradorDeInstituicaoDAO extends GenericoDAO {
	
	Connection connection;
	
	AdministradorDeInstituicao administradorDeInstituicao = null;
	Instituicao instituicao = null;
	
	InstituicaoDAO instituicaoDAO = null;
	
	List<Object> administradoresDeInstituicao = null;

	public AdministradorDeInstituicaoDAO(Connection connection) {
		
		super(connection);
		this.connection = connection;

	}
	
	public void adicionar(AdministradorDeInstituicao administradorDeInstituicao) throws SQLException {
		
		String insertSQL = "INSERT INTO clientes(id_instituicao, nome,  sobrenome,  matricula, email, telefone, setor, cargo, tipo_de_usuario, nome_de_usuario, senha, data_de_registro) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		super.salvar(insertSQL, administradorDeInstituicao.getInstituicao().getId(), administradorDeInstituicao.getNome(), 
				administradorDeInstituicao.getSobrenome(), administradorDeInstituicao.getMatricula(), administradorDeInstituicao.getEmail(), 
				administradorDeInstituicao.getTelefone(), administradorDeInstituicao.getSetor(), administradorDeInstituicao.getCargo(), 
				"administradorDeInstituicao", administradorDeInstituicao.getNomeDeUsuario(), administradorDeInstituicao.getSenha(), 
				administradorDeInstituicao.getDataDeRegistro());
		
	}
	
	public void editar(AdministradorDeInstituicao administradorDeInstituicao) throws SQLException {
		
		String updateSQL = "UPDATE clientes SET id_instituicao=?, nome=?,  sobrenome=?,  matricula=?, email=?, telefone=?, setor=?,"
				+ "cargo=?, tipo_de_usuario=?, nome_de_usuario=?, senha=?, data_de_modificacao=? WHERE id=?";
		
		super.atualizar(updateSQL, administradorDeInstituicao.getId(), administradorDeInstituicao.getInstituicao().getId(), administradorDeInstituicao.getNome(), 
				administradorDeInstituicao.getSobrenome(), administradorDeInstituicao.getMatricula(), administradorDeInstituicao.getEmail(), 
				administradorDeInstituicao.getTelefone(), administradorDeInstituicao.getSetor(), administradorDeInstituicao.getCargo(), 
				"administradorDeInstituicao", administradorDeInstituicao.getNomeDeUsuario(), administradorDeInstituicao.getSenha(), 
				administradorDeInstituicao.getDataDeModificacao());
		
	}
	
	public void excluir(long id) throws SQLException {
		
		String deleteSQL =  "DELETE FROM clientes WHERE id=?";
		super.deletar(deleteSQL, id);
		
	}

	@Override
	public List<Object> listar() {

		try {
			
			administradoresDeInstituicao = new ArrayList<Object>();
			
			String busca = "SELECT * FROM clientes WHERE tipo_de_usuario=?";
			
			PreparedStatement stmt = this.connection.prepareStatement(busca);
			stmt.setString(1, "administradorDeInstituicao");
			ResultSet rs = stmt.executeQuery();
			
			if(rs != null) {
				
				while(rs.next()) {
					
					administradorDeInstituicao = (AdministradorDeInstituicao) FuncionarioFactory.getFuncionario("administradorDeInstituicao");
					
					instituicaoDAO = new InstituicaoDAO(connection);
					instituicao = (Instituicao) instituicaoDAO.buscarPorId(rs.getLong("id_instituicao"));
					
					administradorDeInstituicao.setInstituicao(instituicao);
					administradorDeInstituicao.setId(rs.getLong("id"));
					administradorDeInstituicao.setNome(rs.getString("nome"));
					administradorDeInstituicao.setSobrenome(rs.getString("sobrenome"));
					administradorDeInstituicao.setEmail(rs.getString("email"));
					administradorDeInstituicao.setTelefone(rs.getString("telefone"));
					administradorDeInstituicao.setSetor(rs.getString("setor"));
					administradorDeInstituicao.setCargo(rs.getString("cargo"));
					administradorDeInstituicao.setNomeDeUsuario(rs.getString("nome_de_usuario"));
					administradorDeInstituicao.setSenha(rs.getString("senha"));
					administradorDeInstituicao.setDataDeRegistro(rs.getDate("data_de_registro"));
					administradorDeInstituicao.setDataDeModificacao(rs.getDate("data_de_modificacao"));
					
					administradoresDeInstituicao.add(administradorDeInstituicao);
					
				}
				
			}
			
			rs.close();
			stmt.close();
			
			return administradoresDeInstituicao;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}

	}

	@Override
	public Object buscarPorId(long id) {
		

		try {
			
			administradorDeInstituicao = new AdministradorDeInstituicao();
			
			PreparedStatement pstmt = this.connection.prepareStatement("SELECT * FROM clientes WHERE id=?");
			pstmt.setLong(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs != null && rs.next()) {
				
				instituicaoDAO = new InstituicaoDAO(connection);
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(rs.getLong("id_instituicao"));
				
				administradorDeInstituicao.setInstituicao(instituicao);
				administradorDeInstituicao.setId(rs.getLong("id"));
				administradorDeInstituicao.setNome(rs.getString("nome"));
				administradorDeInstituicao.setSobrenome(rs.getString("sobrenome"));
				administradorDeInstituicao.setMatricula(rs.getString("matricula"));
				administradorDeInstituicao.setEmail(rs.getString("email"));
				administradorDeInstituicao.setTelefone(rs.getString("telefone"));
				administradorDeInstituicao.setSetor(rs.getString("setor"));
				administradorDeInstituicao.setCargo(rs.getString("cargo"));
				administradorDeInstituicao.setNomeDeUsuario(rs.getString("nome_de_usuario"));
				administradorDeInstituicao.setSenha(rs.getString("senha"));
				administradorDeInstituicao.setDataDeRegistro(rs.getDate("data_de_registro"));
				administradorDeInstituicao.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			pstmt.close();
			
			return administradorDeInstituicao;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}		
		
	}
	
	@SuppressWarnings("finally")
	public Object autenticarUsuario(String nomeDeUsuario, String senha) {
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			administradorDeInstituicao = new AdministradorDeInstituicao();
			
			ps = connection.prepareStatement("SELECT * FROM clientes WHERE nome_de_usuario=? AND senha=? AND tipo_de_usuario='administradorDeInstituicao' LIMIT 1");
			ps.setString(1, nomeDeUsuario);
			ps.setString(2, senha);
			
			rs = ps.executeQuery();
			
			if (rs != null && rs.next()) {
				
				instituicaoDAO = new InstituicaoDAO(connection);
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(rs.getLong("id_instituicao"));
				
				administradorDeInstituicao.setInstituicao(instituicao);
				administradorDeInstituicao.setId(rs.getLong("id"));
				administradorDeInstituicao.setNome(rs.getString("nome"));
				administradorDeInstituicao.setSobrenome(rs.getString("sobrenome"));
				administradorDeInstituicao.setMatricula(rs.getString("matricula"));
				administradorDeInstituicao.setEmail(rs.getString("email"));
				administradorDeInstituicao.setTelefone(rs.getString("telefone"));
				administradorDeInstituicao.setSetor(rs.getString("setor"));
				administradorDeInstituicao.setCargo(rs.getString("cargo"));
				administradorDeInstituicao.setNomeDeUsuario(rs.getString("nome_de_usuario"));
				administradorDeInstituicao.setSenha(rs.getString("senha"));
				administradorDeInstituicao.setDataDeRegistro(rs.getDate("data_de_registro"));
				administradorDeInstituicao.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			ps.close();
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			
			return administradorDeInstituicao;
			
		}
		
	}

}
