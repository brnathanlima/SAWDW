package com.nathanaellima.modelo;

import java.util.Date;
import java.util.List;

public class SolicitacaoDeDesenvolvimento {
	
	private long id;
	private String titulo;
	private String justificativa;
	private String status;
	private Date dataDeRealizacao;
	private Date dataDeModificacao;
	private Gerente solicitante;
	private List<EstruturaDeWebsite> estruturasDeWebsitesSolicitadas;
	
	public long getId() {
		
		return id;
		
	}
	
	public void setId(long id) {
		
		this.id = id;
		
	}
	
	public String getTitulo() {
		
		return titulo;
		
	}

	public String getJustificativa() {
		
		return justificativa;
		
	}

	public String getStatus() {
		
		return status;
		
	}

	public Date getDataDeRealizacao() {
		
		return dataDeRealizacao;
		
	}

	public Date getDataDeModificacao() {
		
		return dataDeModificacao;
		
	}

	public Gerente getSolicitante() {
		
		return solicitante;
		
	}

	public List<EstruturaDeWebsite> getEstruturasDeWebsitesSolicitadas() {
		
		return estruturasDeWebsitesSolicitadas;
		
	}
	
	public static class Builder {
		
		private long id;
		private String titulo;
		private String justificativa;
		private String status;
		private Date dataDeRealizacao;
		private Date dataDeModificacao;
		private Gerente solicitante;
		private List<EstruturaDeWebsite> estruturasDeWebsitesSolicitadas;
		
		public Builder id(long id) {
			
			this.id = id;
			return this;
			
		}
		
		public Builder titulo(String titulo) {
			
			this.titulo = titulo;
			return this;
			
		}
		
		public Builder justificativa(String justificativa) {
			
			this.justificativa = justificativa;
			return this;
			
		}
		
		public Builder status(String status) {
			
			this.status = status;
			return this;
			
		}
		
		public Builder dataDeRealizacao(Date dataDeRealizacao) {
			
			this.dataDeRealizacao = dataDeRealizacao;
			return this;
			
		}
		
		public Builder dataDeModificacao(Date dataDeModificacao) {
			
			this.dataDeModificacao = dataDeModificacao;
			return this;
			
		}
		
		public Builder solicitante(Gerente solicitante) {
			
			this.solicitante = solicitante;
			return this;
			
		}
		
		public Builder estruturasDeWebsites(List<EstruturaDeWebsite> estruturasDeWebsitesSolicitadas) {
			this.estruturasDeWebsitesSolicitadas = estruturasDeWebsitesSolicitadas;
			return this;
			
		}
		
		public SolicitacaoDeDesenvolvimento solicitar() {
			
			return new SolicitacaoDeDesenvolvimento(this);
			
		}
		
	}
	
	private SolicitacaoDeDesenvolvimento(Builder builder) {
		setId(builder.id);
		titulo = builder.titulo;
		justificativa = builder.justificativa;
		status = builder.status;
		dataDeRealizacao = builder.dataDeRealizacao;
		dataDeModificacao = builder.dataDeModificacao;
		solicitante = builder.solicitante;
		estruturasDeWebsitesSolicitadas = builder.estruturasDeWebsitesSolicitadas;
		
	}
	
}
