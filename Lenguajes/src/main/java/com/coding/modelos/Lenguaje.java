package com.coding.modelos;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "lenguajes")
public class Lenguaje {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(min = 2, max = 20, message = "El nombre no puede estar vacío o ser inferior a 2 caracteres o superior a 20 caracteres.")
    private String name;

    @Size(min = 2, max = 20, message = "Tu nombre de creador no puede estar vacío o ser inferior a 2 caracteres o superior a 20 caracteres.")
    private String creator;

    @NotNull(message = "Necesitas ingresar la versión del lenguaje para ingresarlo.")
    private Double currentVersion;

    @Temporal(TemporalType.DATE)
    @Column(name = "fecha_creacion")
    private Date fechaCreacion;

    @Temporal(TemporalType.DATE)
    @Column(name = "fecha_actualizacion")
    private Date fechaActualizacion;

    @PrePersist
    protected void onCreate() {
        this.fechaCreacion = new Date();
        this.fechaActualizacion = this.fechaCreacion;
    }

    @PreUpdate
    protected void onUpdate() {
        this.fechaActualizacion = new Date();
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Double getCurrentVersion() {
        return currentVersion;
    }

    public void setCurrentVersion(Double currentVersion) {
        this.currentVersion = currentVersion;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Date getFechaActualizacion() {
        return fechaActualizacion;
    }

    public void setFechaActualizacion(Date fechaActualizacion) {
        this.fechaActualizacion = fechaActualizacion;
    }
}
