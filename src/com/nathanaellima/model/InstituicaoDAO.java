package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nathanaellima.modelo.Instituicao;

public class InstituicaoDAO extends GenericoDAO {
	
	Connection connection;
	
	public InstituicaoDAO(Connection connection) {
		
		super(connection);
		this.connection = connection;
		
	}
	
	public void adicionar(Instituicao instituicao) throws SQLException {
		
		String insert = "INSERT INTO instituicoes(nome_fantasia, nome_empresarial, cnpj, setor_de_atuacao, endereco, "
				+ "cidade, estado, telefone, data_de_registro)"
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		super.salvar(insert, instituicao.getNomeFantasia(), instituicao.getNomeEmpresarial(), instituicao.getCnpj(), 
				instituicao.getSetorDeAtuacao(), instituicao.getEndereco(), instituicao.getCidade(), 
				instituicao.getEstado(), instituicao.getTelefone(), instituicao.getDataDeRegistro());
		
	}
	
	public void editar(Instituicao instituicao) throws SQLException {
		
		String updateSQL = "UPDATE instituicoes SET nome_fantasia=?, nome_empresarial=?, cnpj=?, setor_de_atuacao=?, "
				+ "endereco=?, cidade=?, estado=?, telefone=?, data_de_modificacao=? WHERE id=?";
		
		super.atualizar(updateSQL, instituicao.getId(), instituicao.getNomeFantasia(), instituicao.getNomeEmpresarial(), 
				instituicao.getCnpj(), instituicao.getSetorDeAtuacao(), instituicao.getEndereco(), instituicao.getCidade(), 
				instituicao.getEstado(), instituicao.getTelefone(), instituicao.getDataDeModificacao());
		
	}
	
	public void excluir(long id) throws SQLException {
		
		String deleteSQL =  "DELETE FROM instituicoes WHERE id=?";
		super.deletar(deleteSQL, id);
		
	}
	
	@Override
	public List<Object> listar() {
		
		try {
			
			List<Object> instituicoes = new ArrayList<Object>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM instituicoes");
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				Instituicao instituicao = new Instituicao();
				instituicao.setId(rs.getLong("id"));
				instituicao.setNomeFantasia(rs.getString("nome_fantasia"));
				instituicao.setNomeEmpresarial(rs.getString("nome_empresarial"));
				instituicao.setCnpj(rs.getString("cnpj"));
				instituicao.setSetorDeAtuacao(rs.getString("setor_de_atuacao"));
				instituicao.setEndereco(rs.getString("endereco"));
				instituicao.setCidade(rs.getString("cidade"));
				instituicao.setEstado(rs.getString("estado"));
				instituicao.setTelefone(rs.getString("telefone"));
				instituicao.setDataDeRegistro(rs.getDate("data_de_registro"));
				instituicao.setDataDeModificacao(rs.getDate("data_de_modificacao"));
				
				instituicoes.add(instituicao);
				
			}
			
			rs.close();
			stmt.close();
			
			return instituicoes;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}
	
	@Override
	public Object buscarPorId(long id) {
		
		try {
			
			Instituicao instituicao = new Instituicao();
			
			String busca = "SELECT * FROM instituicoes WHERE id=?";
			
			PreparedStatement pstmt = connection.prepareStatement(busca);
			pstmt.setLong(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				instituicao.setId(rs.getLong("id"));
				instituicao.setNomeFantasia(rs.getString("nome_fantasia"));
				instituicao.setNomeEmpresarial(rs.getString("nome_empresarial"));
				instituicao.setCnpj(rs.getString("cnpj"));
				instituicao.setSetorDeAtuacao(rs.getString("setor_de_atuacao"));
				instituicao.setEndereco(rs.getString("endereco"));
				instituicao.setCidade(rs.getString("cidade"));
				instituicao.setEstado(rs.getString("estado"));
				instituicao.setTelefone(rs.getString("telefone"));
				instituicao.setDataDeRegistro(rs.getDate("data_de_registro"));
				instituicao.setDataDeModificacao(rs.getDate("data_de_modificacao"));
			}
			
			rs.close();
			pstmt.close();
			
			return instituicao;
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		}
		
	}

}
