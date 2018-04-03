package com.nathanaellima.modelo;

import java.util.Date;
import java.util.List;

public class Categoria {
	
	private long id;
	private String nome;
	private String descricao;
	private Date dataDeCriacao;
	private Date dataDeModificacao;
	private Categoria categoriaMae;
	private Instituicao instituicao;
	private List<EstruturaDeWebsite> estruturasDeWebsitesDaCategoria;

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

	public Categoria getCategoriaMae() {
		
		return categoriaMae;
		
	}

	public void setCategoriaMae(Categoria categoriaMae) {
		
		this.categoriaMae = categoriaMae;
		
	}

	public Instituicao getInstituicao() {
		return instituicao;
	}

	public void setInstituicao(Instituicao instituicao) {
		
		this.instituicao = instituicao;
		
	}
	public List<EstruturaDeWebsite> getEstruturasDeWebsitesDaCategoria() {
		
		return estruturasDeWebsitesDaCategoria;
		
	}

	public void setEstruturasDeWebsitesDaCategoria(List<EstruturaDeWebsite> estruturasDeWebsitesDaCategoria) {
		
		this.estruturasDeWebsitesDaCategoria = estruturasDeWebsitesDaCategoria;
		
	}
	
}
