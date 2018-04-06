package com.nathanaellima.modelo;

import java.util.Date;

public class EstruturaDePagina {
	
	private long id;
	private String titulo;
	private String conteudo;
	private Date dataDeCriacao;
	private Date dataDeModificacao;
	private EstruturaDeWebsite estruturaDeWebsite;
	
	public long getId() {
		
		return id;
		
	}
	
	public void setId(long id) {
		
		this.id = id;
		
	}
	
	public String getTitulo() {
		
		return titulo;
		
	}
	
	public void setTitulo(String titulo) {
		
		this.titulo = titulo;
		
	}
	public String getConteudo() {
		
		return conteudo;
		
	}
	
	public void setConteudo(String conteudo) {
		
		this.conteudo = conteudo;
		
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

	public EstruturaDeWebsite getEstruturaDeWebsite() {
		
		return estruturaDeWebsite;
		
	}

	public void setEstruturaDeWebsite(EstruturaDeWebsite estruturaDeWebsite) {
		
		this.estruturaDeWebsite = estruturaDeWebsite;
		
	}
	
}
