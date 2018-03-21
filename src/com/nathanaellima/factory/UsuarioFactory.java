package com.nathanaellima.factory;

import com.nathanaellima.modelo.Colaborador;
import com.nathanaellima.modelo.Funcionario;
import com.nathanaellima.modelo.SuperAdministrador;
import com.nathanaellima.modelo.Usuario;

public class UsuarioFactory {
	
	public static Usuario getUsuario(String tipoDeUsuario) {
		
		Usuario usuario = null;
		
		switch(tipoDeUsuario) {
		
		case "superAdministrador":
			
			usuario = new SuperAdministrador();
			break;
			
		}
		
		return usuario;
		
	}
	
}
