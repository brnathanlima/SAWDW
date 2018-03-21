package com.nathanaellima.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GerenciadorDeConexaoBD {
	
private Connection connection;
	
	public GerenciadorDeConexaoBD(String dbURL, String user, String pwd) throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		this.connection = DriverManager.getConnection(dbURL, user, pwd);
		
	}
	
	public Connection getConnection() {
		
		return this.connection;
		
	}
	
}
