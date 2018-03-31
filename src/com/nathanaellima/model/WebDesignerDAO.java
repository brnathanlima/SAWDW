package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nathanaellima.factory.FuncionarioFactory;
import com.nathanaellima.modelo.Instituicao;
import com.nathanaellima.modelo.WebDesigner;

public class WebDesignerDAO extends GenericoDAO {

Connection connection;
	
	WebDesigner webDesigner = null;
	Instituicao instituicao = null;
	InstituicaoDAO instituicaoDAO = null;
	List<Object> webDesigners = null;

	public WebDesignerDAO(Connection connection) {
		
		super(connection);
		this.connection = connection;

	}
	
	public void adicionar(WebDesigner webDesigner) throws SQLException {
		
		String insertSQL = "INSERT INTO clientes(id_instituicao, nome,  sobrenome,  matricula, email, telefone, nivel, tipo_de_usuario, nome_de_usuario, senha, data_de_registro) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		super.salvar(insertSQL, webDesigner.getInstituicao().getId(), webDesigner.getNome(), webDesigner.getSobrenome(), webDesigner.getMatricula(), 
				webDesigner.getEmail(), webDesigner.getTelefone(), webDesigner.getNivel(), "webDesigner", webDesigner.getNomeDeUsuario(), 
				webDesigner.getSenha(), webDesigner.getDataDeRegistro());
		
	}
	
	public void editar(WebDesigner webDesigner) throws SQLException {
		
		String updateSQL = "UPDATE clientes SET id_instituicao=?, nome=?, sobrenome=?, matricula=?, email=?, telefone=?, nivel=?, tipo_de_usuario=?, "
				+ "nome_de_usuario=?, senha=?, data_de_modificacao=? WHERE id=?";
		
		super.atualizar(updateSQL, webDesigner.getId(), webDesigner.getInstituicao().getId(), webDesigner.getNome(), webDesigner.getSobrenome(), 
				webDesigner.getMatricula(), webDesigner.getEmail(), webDesigner.getTelefone(), webDesigner.getNivel(), "webDesigner", 
				webDesigner.getNomeDeUsuario(), webDesigner.getSenha(), webDesigner.getDataDeModificacao());
		
	}
	
	public void excluir(long id) throws SQLException {
		
		String deleteSQL =  "DELETE FROM clientes WHERE id=?";
		super.deletar(deleteSQL, id);
		
	}
	
	public List<Object> listarWebDesignersDaInstituicao(long idInstituicao) {
		
		try {
			
			webDesigners = new ArrayList<Object>();
			
			String busca = "SELECT * FROM clientes WHERE id_instituicao=? AND tipo_de_usuario=?";
			
			PreparedStatement stmt = this.connection.prepareStatement(busca);
			stmt.setLong(1, idInstituicao);
			stmt.setString(2, "webDesigner");
			ResultSet rs = stmt.executeQuery();
			
			if(rs != null) {
				
				while(rs.next()) {
					
					webDesigner = (WebDesigner) FuncionarioFactory.getFuncionario("webDesigner");
					
					instituicaoDAO = new InstituicaoDAO(connection);
					instituicao = (Instituicao) instituicaoDAO.buscarPorId(rs.getLong("id_instituicao"));
					
					webDesigner.setInstituicao(instituicao);
					webDesigner.setId(rs.getLong("id"));
					webDesigner.setNome(rs.getString("nome"));
					webDesigner.setSobrenome(rs.getString("sobrenome"));
					webDesigner.setMatricula(rs.getString("matricula"));
					webDesigner.setEmail(rs.getString("email"));
					webDesigner.setTelefone(rs.getString("telefone"));
					webDesigner.setNivel(rs.getString("nivel"));
					webDesigner.setNomeDeUsuario(rs.getString("nome_de_usuario"));
					webDesigner.setSenha(rs.getString("senha"));
					webDesigner.setDataDeRegistro(rs.getDate("data_de_registro"));
					webDesigner.setDataDeModificacao(rs.getDate("data_de_modificacao"));
					
					webDesigners.add(webDesigner);
					
				}
				
			}
			
			rs.close();
			stmt.close();
			
			return webDesigners;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}

	@Override
	public Object buscarPorId(long id) {
		

		try {
			
			webDesigner = new WebDesigner();
			
			PreparedStatement pstmt = this.connection.prepareStatement("SELECT * FROM clientes WHERE id=?");
			pstmt.setLong(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs != null && rs.next()) {
				
				instituicaoDAO = new InstituicaoDAO(connection);
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(rs.getLong("id_instituicao"));
				
				webDesigner.setInstituicao(instituicao);
				webDesigner.setId(rs.getLong("id"));
				webDesigner.setNome(rs.getString("nome"));
				webDesigner.setSobrenome(rs.getString("sobrenome"));
				webDesigner.setMatricula(rs.getString("matricula"));
				webDesigner.setEmail(rs.getString("email"));
				webDesigner.setTelefone(rs.getString("telefone"));
				webDesigner.setNivel(rs.getString("nivel"));
				webDesigner.setNomeDeUsuario(rs.getString("nome_de_usuario"));
				webDesigner.setSenha(rs.getString("senha"));
				webDesigner.setDataDeRegistro(rs.getDate("data_de_registro"));
				webDesigner.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			pstmt.close();
			
			return webDesigner;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}		
		
	}
	
	@SuppressWarnings("finally")
	public Object autenticarUsuario(String nomeDeUsuario, String senha) {
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			ps = connection.prepareStatement("SELECT * FROM clientes WHERE nome_de_usuario=? AND senha=? AND tipo_de_usuario=?");
			ps.setString(1, nomeDeUsuario);
			ps.setString(2, senha);
			ps.setString(3, "webDesigner");
			
			rs = ps.executeQuery();
			
			if (rs != null && rs.next()) {
				
				webDesigner = (WebDesigner) FuncionarioFactory.getFuncionario("webDesigner");
				
				instituicaoDAO = new InstituicaoDAO(connection);
				instituicao = (Instituicao) instituicaoDAO.buscarPorId(rs.getLong("id_instituicao"));
				
				webDesigner.setInstituicao(instituicao);
				webDesigner.setId(rs.getLong("id"));
				webDesigner.setNome(rs.getString("nome"));
				webDesigner.setSobrenome(rs.getString("sobrenome"));
				webDesigner.setMatricula(rs.getString("matricula"));
				webDesigner.setEmail(rs.getString("email"));
				webDesigner.setTelefone(rs.getString("telefone"));
				webDesigner.setNivel(rs.getString("nivel"));
				webDesigner.setNomeDeUsuario(rs.getString("nome_de_usuario"));
				webDesigner.setSenha(rs.getString("senha"));
				webDesigner.setDataDeRegistro(rs.getDate("data_de_registro"));
				webDesigner.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
			}
			
			rs.close();
			ps.close();
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			
			return webDesigner;
			
		}
		
	}

}
