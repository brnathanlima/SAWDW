package com.nathanaellima.modelo;

import java.util.Date;

public class Instituicao {
	
	private Long id;
	private String nomeFantasia;
	private String nomeEmpresarial;
	private String cnpj;
	private String setorDeAtuacao;
	private String endereco;
	private String cidade;
	private String estado;
	private String telefone;
	private Date dataDeRegistro;
	private Date dataDeModificacao;
	
	public Long getId() {
		
		return id;
		
	}
	
	public String getNomeFantasia() {
		
		return nomeFantasia;
		
	}
	
	public void setNomeFantasia(String nomeFantasia) {
		
		this.nomeFantasia = nomeFantasia;
		
	}
	
	public void setId(Long id) {
		
		this.id = id;
		
	}
	
	public String getNomeEmpresarial() {
		
		return nomeEmpresarial;
		
	}
	
	public void setNomeEmpresarial(String nomeEmpresarial) {
		
		this.nomeEmpresarial = nomeEmpresarial;
		
	}
	
	public String getCnpj() {
		
		return cnpj;
		
	}
	
	public void setCnpj(String cnpj) {
		
		this.cnpj = cnpj;
		
	}
	
	public String getSetorDeAtuacao() {
		
		return setorDeAtuacao;
		
	}
	
	public void setSetorDeAtuacao(String setorDeAtuacao) {
		
		this.setorDeAtuacao = setorDeAtuacao;
		
	}
	
	public String getEndereco() {
		
		return endereco;
		
	}
	
	public void setEndereco(String endereco) {
		
		this.endereco = endereco;
		
	}
	
	public String getCidade() {
		
		return cidade;
		
	}
	
	public void setCidade(String cidade) {
		
		this.cidade = cidade;
		
	}
	
	public String getEstado() {
		
		return estado;
		
	}
	
	public void setEstado(String estado) {
		
		this.estado = estado;
		
	}
	
	public String getTelefone() {
		
		return telefone;
		
	}
	
	public void setTelefone(String telefone) {
		
		this.telefone = telefone;
		
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
