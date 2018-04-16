package com.nathanaellima.modelo;

import java.util.Date;

public class AvaliacaoDeSolicitacaoDeDesenvolvimento {
	
	private long id;
	private String avaliacao;
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
	
	public String getAvaliacao() {
		
		return avaliacao;
		
	}
	
	public void setAvaliacao(String avaliacao) {
		
		this.avaliacao = avaliacao;
		
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
