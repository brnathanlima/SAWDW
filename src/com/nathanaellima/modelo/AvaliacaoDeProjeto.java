package com.nathanaellima.modelo;

import java.util.Date;

public class AvaliacaoDeProjeto {
	
	private long id;
	private Projeto projeto;
	private String titulo;
	private String nota;
	private String comentario;
	private Date dataDeEmissao;
	private Date dataDeModificacao;
	
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
	
	public String getNota() {
		
		return nota;
		
	}
	
	public void setNota(String nota) {
		
		this.nota = nota;
		
	}
	
	public String getComentario() {
		
		return comentario;
		
	}
	
	public void setComentario(String comentario) {
		
		this.comentario = comentario;
		
	}
	
	public Date getDataDeEmissao() {
		
		return dataDeEmissao;
		
	}
	
	public void setDataDeEmissao(Date dataDeEmissao) {
		
		this.dataDeEmissao = dataDeEmissao;
		
	}
	
	public Date getDataDeModificacao() {
		
		return dataDeModificacao;
		
	}
	
	public void setDataDeModificacao(Date dataDeModificacao) {
		
		this.dataDeModificacao = dataDeModificacao;
		
	}

	public Projeto getProjeto() {
		
		return projeto;
		
	}

	public void setProjeto(Projeto projeto) {
		
		this.projeto = projeto;
		
	}
	
}
