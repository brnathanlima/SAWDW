package com.nathanaellima.modelo;

import java.util.Date;

public class Usuario {
	
	private long id;
	private String nome;
	private String sobrenome;
	private String email;
	private String telefone;
	private String nomeDeUsuario;
	private String senha;
	private String tipoDeUsuario;
	private Date dataDeRegistro;
	private Date dataDeModificacao;
	
	public long getId() {
		
		return id;
		
	}
	
	public void setId(long id) {
		
		this.id = id;
		
	}
	
	public String getNome() {
		
		return nome;
		
	}
	
	public void setNome(String nome) {
		
		this.nome = nome;
		
	}
	
	public String getSobrenome() {
		
		return sobrenome;
		
	}
	
	public void setSobrenome(String sobrenome) {
		
		this.sobrenome = sobrenome;
		
	}
	
	public String getEmail() {
		
		return email;
		
	}
	
	public void setEmail(String email) {
		
		this.email = email;
		
	}
	
	public String getTelefone() {
		
		return telefone;
		
	}
	
	public void setTelefone(String telefone) {
		
		this.telefone = telefone;
		
	}
	
	public String getNomeDeUsuario() {
		
		return nomeDeUsuario;
		
	}
	
	public void setNomeDeUsuario(String nomeDeUsuario) {
		
		this.nomeDeUsuario = nomeDeUsuario;
		
	}
	
	public String getSenha() {
		
		return senha;
		
	}
	
	public void setSenha(String senha) {
		
		this.senha = senha;
		
	}
	
	public String getTipoDeUsuario() {
		
		return tipoDeUsuario;
		
	}
	
	public void setTipoDeUsuario(String tipoDeUsuario) {
		
		this.tipoDeUsuario = tipoDeUsuario;
		
	}
	
	public Date getDataDeRegistro() {
		
		return dataDeRegistro;
		
	}
	
	public void setDataDeRegistro(Date dataDeRegistro) {
		
		this.dataDeRegistro = dataDeRegistro;
		
	}
	
	public Date getDataDeModificacao() {
		
		return dataDeModificacao;
		
	}
	
	public void setDataDeModificacao(Date dataDeModificacao) {
		
		this.dataDeModificacao = dataDeModificacao;
		
	}
	
}
