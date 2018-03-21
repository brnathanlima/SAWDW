package com.nathanaellima.factory;

import com.nathanaellima.modelo.AdministradorDeInstituicao;
import com.nathanaellima.modelo.Colaborador;
import com.nathanaellima.modelo.Funcionario;
import com.nathanaellima.modelo.Gerente;
import com.nathanaellima.modelo.WebDesigner;

public class FuncionarioFactory extends UsuarioFactory {
	
public static Funcionario getFuncionario(String tipoDeFuncionario) {
		
		Funcionario funcionario = null;
		
		switch(tipoDeFuncionario) {
		
		case "administradorDeInstituicao":	
			funcionario = new AdministradorDeInstituicao();
			break;
			
		case "colaborador":
			
			funcionario = new Colaborador();
			break;
			
		case "webDesigner":
			
			funcionario = new WebDesigner();
			break;
		
		case "gerente":
			
			funcionario = new Gerente();
			break;
			
		}
		
		return funcionario;
		
	}

}
