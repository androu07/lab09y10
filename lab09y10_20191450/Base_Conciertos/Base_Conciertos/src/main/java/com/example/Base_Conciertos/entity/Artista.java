package com.example.Base_Conciertos.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "Artistas")
public class Artista {
    @Id
    @Column(name = "ArtistaId", nullable = false)
    private String artistaId;
    @Column(name = "NombreGrupo")
    private String nombreGrupo;
    @Column(name = "TipoMusica")
    private String tipoMusica;
    @Column(name = "FechaCreacion")
    private String fechaCreacion;
}
