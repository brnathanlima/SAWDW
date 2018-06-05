package com.nathanaellima.factory;

import com.nathanaellima.modelo.AdministradorDeInstituicao;
import com.nathanaellima.modelo.Colaborador;
import com.nathanaellima.modelo.Gerente;
import com.nathanaellima.modelo.SuperAdministrador;
import com.nathanaellima.modelo.Usuario;
import com.nathanaellima.modelo.WebDesigner;

public class UsuarioFactory {
	
	public static Usuario getUsuario(String tipoDeUsuario) {
		
		Usuario usuario = null;
		
		switch(tipoDeUsuario) {
		
		case "superAdministrador":
			
			usuario = new SuperAdministrador();
			break;
			
		case "administradorDeInstituicao":
			
			usuario = new AdministradorDeInstituicao();
			break;
			
		case "gerente":
			
			usuario = new Gerente();
			break;
			
		case "webDesigner":
			
			usuario = new WebDesigner();
			break;
		
		case "colaborador":
			
			usuario = new Colaborador();
			break;
		}
		
		return usuario;
		
	}
	
}
