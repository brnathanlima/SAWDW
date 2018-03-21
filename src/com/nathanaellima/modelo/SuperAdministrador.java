package com.nathanaellima.modelo;

import java.util.Date;

public class SuperAdministrador extends Usuario {
	
	private Date ultimoAcesso;

	public Date getUltimoAcesso() {
		
		return ultimoAcesso;
		
	}

	public void setUltimoAcesso(Date ultimoAcesso) {
		
		this.ultimoAcesso = ultimoAcesso;
		
	}

}
