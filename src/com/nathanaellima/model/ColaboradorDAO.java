package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nathanaellima.factory.FuncionarioFactory;
import com.nathanaellima.modelo.Colaborador;
import com.nathanaellima.modelo.Instituicao;

public class ColaboradorDAO extends GenericoDAO {

	Connection connection;
	
	Colaborador colaborador = null;
	Instituicao instituicao = null;
	
	InstituicaoDAO instituicaoDAO = null;
	
	List<Colaborador> colaboradores = null;

	public ColaboradorDAO(Connection connection) {
		
		super(connection);
		this.connection = connection;

	}
	
	public void adicionar(Colaborador colaborador) throws SQLException {
		
		String insertSQL = "INSERT INTO clientes(id_instituicao, nome,  sobrenome,  matricula, email, telefone, setor, cargo, tipo_de_usuario, nome_de_usuario, senha, data_de_registro) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		super.salvar(insertSQL, colaborador.getInstituicao().getId(), colaborador.getNome(), colaborador.getSobrenome(), colaborador.getMatricula(), 
				colaborador.getEmail(), colaborador.getTelefone(), colaborador.getSetor(), colaborador.getCargo(), "colaborador", 
				colaborador.getNomeDeUsuario(), colaborador.getSenha(), colaborador.getDataDeRegistro());
		
	}
	
	public void editar(Colaborador colaborador) throws SQLException {
		
		String updateSQL = "UPDATE clientes SET id_instituicao=?, nome=?,  sobrenome=?,  matricula=?, email=?, telefone=?, setor=?,"
				+ "cargo=?, tipo_de_usuario=?, nome_de_usuario=?, senha=?, data_de_modificacao=? WHERE id=?";
		
		super.atualizar(updateSQL, colaborador.getId(), colaborador.getInstituicao().getId(), colaborador.getNome(), colaborador.getSobrenome(), 
				colaborador.getMatricula(), colaborador.getEmail(), colaborador.getTelefone(), colaborador.getSetor(), colaborador.getCargo(), 
				"colaborador", colaborador.getNomeDeUsuario(), colaborador.getSenha(), colaborador.getDataDeModificacao());
		
	}
	
	public void excluir(long id) throws SQLException {
		
		String deleteSQL =  "DELETE FROM clientes WHERE id=?";
		super.deletar(deleteSQL, id);
		
	}
	
	public List<Colaborador> listarColaboradoresDaInstituicao(long idInstituicao) {
		
		try {
			
			colaboradores = new ArrayList<Colaborador>();
			
			String busca = "SELECT * FROM clientes WHERE id_instituicao=? AND tipo_de_usuario=?";
			
			PreparedStatement stmt = this.connection.prepareStatement(busca);
			stmt.setLong(1, idInstituicao);
			stmt.setString(2, "colaborador");
			ResultSet rs = stmt.executeQuery();
			
			if(rs != null) {
				
				while(rs.next()) {
					
					colaborador = (Colaborador) FuncionarioFactory.getFuncionario("colaborador");
					
					instituicaoDAO = new InstituicaoDAO(connection);
					instituicao = (Instituicao) instituicaoDAO.buscarPorId(rs.getLong("id_instituicao"));
					
					colaborador.setInstituicao(instituicao);
					colaborador.setId(rs.getLong("id"));
					colaborador.setNome(rs.getString("nome"));
					colaborador.setSobrenome(rs.getString("sobrenome"));
					colaborador.setMatricula(rs.getString("matricula"));
					colaborador.setEmail(rs.getString("email"));
					colaborador.setTelefone(rs.getString("telefone"));
					colaborador.setSetor(rs.getString("setor"));
					colaborador.setCargo(rs.getString("cargo"));
					colaborador.setNomeDeUsuario(rs.getString("nome_de_usuario"));
					colaborador.setSenha(rs.getString("senha"));
					colaborador.setDataDeRegistro(rs.getDate("data_de_registro"));
					colaborador.setDataDeModificacao(rs.getDate("data_de_modificacao"));
					
					colaboradores.add(colaborador);
					
				}
				
			}
			
			rs.close();
			stmt.close();
			
			return colaboradores;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}

	@Override
	public Object buscarPorId(long id) {
		

		try {
			
			colaborador = new Colaborador();
			
			PreparedStatement pstmt = this.connection.prepareStatement("SELECT * FROM clientes WHERE id=?");
			pstmt.setLong(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs != null && rs.next()) {
				
				instituicaoDAO = new InstituicaoDAO(connection);
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(rs.getLong("id_instituicao"));
				
				colaborador.setInstituicao(instituicao);
				colaborador.setId(rs.getLong("id"));
				colaborador.setNome(rs.getString("nome"));
				colaborador.setSobrenome(rs.getString("sobrenome"));
				colaborador.setMatricula(rs.getString("matricula"));
				colaborador.setEmail(rs.getString("email"));
				colaborador.setTelefone(rs.getString("telefone"));
				colaborador.setSetor(rs.getString("setor"));
				colaborador.setCargo(rs.getString("cargo"));
				colaborador.setNomeDeUsuario(rs.getString("nome_de_usuario"));
				colaborador.setSenha(rs.getString("senha"));
				colaborador.setDataDeRegistro(rs.getDate("data_de_registro"));
				colaborador.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			pstmt.close();
			
			return colaborador;
			
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
			ps.setString(3, "colaborador");
			
			rs = ps.executeQuery();
			
			if (rs != null && rs.next()) {
				
				colaborador = (Colaborador) FuncionarioFactory.getFuncionario("colaborador");
				
				instituicaoDAO = new InstituicaoDAO(connection);
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(rs.getLong("id_instituicao"));
				
				colaborador.setInstituicao(instituicao);
				colaborador.setId(rs.getLong("id"));
				colaborador.setNome(rs.getString("nome"));
				colaborador.setSobrenome(rs.getString("sobrenome"));
				colaborador.setMatricula(rs.getString("matricula"));
				colaborador.setEmail(rs.getString("email"));
				colaborador.setTelefone(rs.getString("telefone"));
				colaborador.setSetor(rs.getString("setor"));
				colaborador.setCargo(rs.getString("cargo"));
				colaborador.setNomeDeUsuario(rs.getString("nome_de_usuario"));
				colaborador.setSenha(rs.getString("senha"));
				colaborador.setDataDeRegistro(rs.getDate("data_de_registro"));
				colaborador.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			ps.close();
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			
			return colaborador;
			
		}
		
	}

}
