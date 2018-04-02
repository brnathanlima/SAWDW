package com.nathanaellima.modelo;

import java.util.Date;

public class EstruturaDeWebsite {

	private long id;
	private String nome;
	private String descricao;
	private Date dataDeCriacao;
	private Date dataDeModificacao;
	private Categoria categoria;
	
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
	
	public String getDescricao() {
		
		return descricao;
		
	}
	
	public void setDescricao(String descricao) {
		
		this.descricao = descricao;
		
	}
	
	public Date getDataDeCriacao() {
		
		return dataDeCriacao;
		
	}
	
	public void setDataDeCriacao(Date dataDeCriacao) {
		
		this.dataDeCriacao = dataDeCriacao;
		
	}
	
	public Date getDataDeModificacao() {
		
		return dataDeModificacao;
		
	}
	
	public void setDataDeModificacao(Date dataDeModificacao) {
		
		this.dataDeModificacao = dataDeModificacao;
		
	}
	
	public Categoria getCategoria() {
		
		return categoria;
		
	}
	
	public void setCategoria(Categoria categoria) {
		
		this.categoria = categoria;
		
	}
	
}
