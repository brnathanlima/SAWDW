package com.nathanaellima.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public abstract class GenericoDAO {
	
	private Connection connection;
	
	protected GenericoDAO(Connection connection) {
		
		this.connection = connection;
		
	}
	
	protected void salvar(String insertSQL, Object... parametros) {
		
		try {
			
			PreparedStatement pstmt = connection.prepareStatement(insertSQL);
			
			for(int i=0; i<parametros.length; i++) {
				
				pstmt.setObject(i+1, parametros[i]);
				
			}
				
			pstmt.execute();
			pstmt.close();
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	protected void atualizar(String updateSQL, Object id, Object... parametros) {
		
		try {
			
			PreparedStatement pstmt = connection.prepareStatement(updateSQL);
			
			for(int i=0; i<parametros.length; i++) {
				
				pstmt.setObject(i+1, parametros[i]);
				
			}
			
			pstmt.setObject(parametros.length+1, id);
			pstmt.execute();
			pstmt.close();
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		} 
		
	}
	
	protected void deletar(String deleteSQL, long id) {
		
		try {
			
			PreparedStatement pstmt = connection.prepareStatement(deleteSQL);
			
			pstmt.setObject(1, id);
			pstmt.execute();
			pstmt.close();
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		}		
		
	}
	
	protected abstract Object buscarPorId(long id);

}
