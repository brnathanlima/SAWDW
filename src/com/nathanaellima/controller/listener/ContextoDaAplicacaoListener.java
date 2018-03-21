package com.nathanaellima.controller.listener;

import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.nathanaellima.util.GerenciadorDeConexaoBD;

@WebListener
public class ContextoDaAplicacaoListener implements ServletContextListener {

	@Override
	public void contextInitialized (ServletContextEvent servletContextEvent) {
		
		ServletContext ctx = servletContextEvent.getServletContext();
		
		// Inicializando conexão com o Banco de Dados
		
		String dbURL = ctx.getInitParameter("dbURL");
		String user = ctx.getInitParameter("dbUser");
    	String pwd = ctx.getInitParameter("dbPassword");
    	
    	try {
    		
    		GerenciadorDeConexaoBD connectionManager = new GerenciadorDeConexaoBD(dbURL, user, pwd);
    		ctx.setAttribute("ConexaoComBD", connectionManager.getConnection());
    		System.out.println("Conexao com o Banco estabelecida com sucesso.");
    		
    	} catch (ClassNotFoundException e) {
    		
    		e.printStackTrace();
    		
    	} catch (SQLException e) {
    		
    		e.printStackTrace();
    		
    	}

	}


	@Override
	public void contextDestroyed (ServletContextEvent servletContextEvent) {
		
		Connection con = (Connection) servletContextEvent.getServletContext().getAttribute("ConexaoComBD");
		
		try {
			
			con.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}

	}

}
