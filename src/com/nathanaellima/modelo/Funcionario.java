package com.nathanaellima.modelo;

public class Funcionario extends Usuario {
	
	private String matricula;
	private Instituicao instituicao;

	public String getMatricula() {
		
		return matricula;
		
	}

	public void setMatricula(String matricula) {
		
		this.matricula = matricula;
		
	}

	public Instituicao getInstituicao() {
		
		return instituicao;
		
	}

	public void setInstituicao(Instituicao instituicao) {
		
		this.instituicao = instituicao;
		
	}
	
}
