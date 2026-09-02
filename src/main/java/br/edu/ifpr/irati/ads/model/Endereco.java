package br.edu.ifpr.irati.ads.model;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
public class Endereco {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "sequence_endereco", allocationSize = 1)
    private Long _id;
    @Column(name = "logradouro", nullable = false, length = 64)
    private String _logradouro;
    @Column(name = "numero", nullable = false)
    private int _numero;
    @Column(name = "bairro", nullable = false, length = 16)
    private String _bairro;
    @Column(name = "cidade", nullable = false, length = 16)
    private String _cidade;
    @Column(name = "estado", nullable = false, length = 16)
    private String _estado;
    @Column(name = "cep", nullable = false, length = 8)
    private String _cep;

    public Endereco() {
        this(0L, null, 0, null, null, null, null);
    }

    public Endereco(Long id, String logradouro, int numero, String bairro, String cidade, String estado, String cep) {
        this._id = id;
        this._logradouro = logradouro;
        this._numero = numero;
        this._bairro = bairro;
        this._cidade = cidade;
        this._estado = estado;
        this._cep = cep;
    }

    public Long getId() {
        return _id;
    }

    public void setId(Long id) {
        this._id = id;
    }

    public String getLogradouro() {
        return _logradouro;
    }

    public void setLogradouro(String logradouro) {
        this._logradouro = logradouro;
    }

    public int getNumero() {
        return _numero;
    }

    public void setNumero(int numero) {
        this._numero = numero;
    }

    public String getBairro() {
        return _bairro;
    }

    public void setBairro(String bairro) {
        this._bairro = bairro;
    }

    public String getCidade() {
        return _cidade;
    }

    public void setCidade(String cidade) {
        this._cidade = cidade;
    }

    public String getEstado() {
        return _estado;
    }

    public void setEstado(String estado) {
        this._estado = estado;
    }

    public String getCep() {
        return _cep;
    }

    public void setCep(String cep) {
        this._cep = cep;
    }
}
