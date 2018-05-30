package com.nathanaellima.modelo;

import java.util.Date;
import java.util.List;

public class Projeto {
	
	private long id;
	private String titulo;
	private String descricao;
	private String status;
	private String resumo;
	private Gerente gerenteDoProjeto;
	private Date dataDeCriacao;
	private Date dataDeModificacao;
	private Date dataDeConclusao;
	private List<SolicitacaoDeDesenvolvimento> solicitacoesDeDesenvolvimentoDoProjeto;
	private AvaliacaoDeProjeto avaliacaoDoProjeto;
	
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
	
	public String getDescricao() {
		
		return descricao;
		
	}
	
	public void setDescricao(String descricao) {
		
		this.descricao = descricao;
		
	}
	
	public String getStatus() {
		
		return status;
		
	}
	
	public void setStatus(String status) {
		
		this.status = status;
		
	}
	
	public String getResumo() {
		
		return resumo;
		
	}
	
	public void setResumo(String resumo) {
		
		this.resumo = resumo;
		
	}

	public Gerente getGerenteDoProjeto() {
		
		return gerenteDoProjeto;
		
	}

	public void setGerenteDoProjeto(Gerente gerenteDoProjeto) {
		
		this.gerenteDoProjeto = gerenteDoProjeto;
		
	}

	public Date getDataDeCriacao() {
		
		return dataDeCriacao;
		
	}
	
	public void setDataDeCriacao(Date dataDeInicio) {
		
		this.dataDeCriacao = dataDeInicio;
		
	}
	
	public Date getDataDeModificacao() {
		
		return dataDeModificacao;
		
	}

	public void setDataDeModificacao(Date dataDeModificacao) {
		
		this.dataDeModificacao = dataDeModificacao;
		
	}

	public Date getDataDeConclusao() {
		
		return dataDeConclusao;
		
	}
	
	public void setDataDeConclusao(Date dataDeConclusao) {
		
		this.dataDeConclusao = dataDeConclusao;
		
	}
	
	public List<SolicitacaoDeDesenvolvimento> getSolicitacoesDeDesenvolvimentoDoProjeto() {
		
		return solicitacoesDeDesenvolvimentoDoProjeto;
		
	}
	
	public void setSolicitacoesDeDesenvolvimentoDoProjeto(
			List<SolicitacaoDeDesenvolvimento> solicitacoesDeDesenvolvimentoDoProjeto) {
		
		this.solicitacoesDeDesenvolvimentoDoProjeto = solicitacoesDeDesenvolvimentoDoProjeto;
		
	}

	public AvaliacaoDeProjeto getAvaliacaoDoProjeto() {
		
		return avaliacaoDoProjeto;
		
	}

	public void setAvaliacaoDoProjeto(AvaliacaoDeProjeto avaliacaoDoProjeto) {
		
		this.avaliacaoDoProjeto = avaliacaoDoProjeto;
		
	}
	
}
