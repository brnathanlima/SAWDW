package com.nathanaellima.modelo;

import java.util.Date;

public class Parecer {
	
	private long id;
	private String recomendacao;
	private String justificativa;
	private Date dataDeEmissao;
	private Date dataDeModificacao;
	private SolicitacaoDeDesenvolvimento solicitacaoDeDesenvolvimento;
	
	public long getId() {
		
		return id;
		
	}
	
	public void setId(long id) {
		
		this.id = id;
		
	}
	
	public String getRecomendacao() {
		
		return recomendacao;
		
	}
	
	public void setRecomendacao(String recomendacao) {
		
		this.recomendacao = recomendacao;
		
	}
	
	public String getJustificativa() {
		
		return justificativa;
		
	}

	public void setJustificativa(String justificativa) {
		
		this.justificativa = justificativa;
		
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

	public SolicitacaoDeDesenvolvimento getSolicitacaoDeDesenvolvimento() {
		
		return solicitacaoDeDesenvolvimento;
		
	}

	public void setSolicitacaoDeDesenvolvimento(SolicitacaoDeDesenvolvimento solicitacaoDeDesenvolvimento) {
		
		this.solicitacaoDeDesenvolvimento = solicitacaoDeDesenvolvimento;
		
	}
	
}
