package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public abstract class GenericoDAO {
	
	private Connection connection;
	
	protected GenericoDAO(Connection connection) {
		
		this.connection = connection;
		
	}
	
	protected void salvar(String insertSQL, Object... parametros) throws SQLException {
		
		PreparedStatement pstmt = connection.prepareStatement(insertSQL);
		
		for(int i=0; i<parametros.length; i++) {
			
			pstmt.setObject(i+1, parametros[i]);
			
		}
			
		pstmt.execute();
		pstmt.close();
		
	}
	
	protected void atualizar(String updateSQL, Object id, Object... parametros) throws SQLException {
		
		PreparedStatement pstmt = connection.prepareStatement(updateSQL);
		
		for(int i=0; i<parametros.length; i++) {
			
			pstmt.setObject(i+1, parametros[i]);
			
		}
		
		pstmt.setObject(parametros.length+1, id);
		pstmt.execute();
		pstmt.close();
		
	}
	
	protected void deletar(String deleteSQL, long id) throws SQLException {
		
		PreparedStatement pstmt = connection.prepareStatement(deleteSQL);
		
		pstmt.setObject(1, id);
		pstmt.execute();
		pstmt.close();
		
	}
	
	protected abstract List<Object> listar();
	
	protected abstract Object buscarPorId(long id);
	
	protected abstract Object autenticarUsuario(String nomeDeUsuario, String senha);

}
