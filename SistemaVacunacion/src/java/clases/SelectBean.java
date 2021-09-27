/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author IXCAMEY
 */
public class SelectBean {
    private int id;     
    private String nombre, estado;

    public SelectBean() {       
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

     public String getEstado() {
        return estado;
    }

    public void setEsado(String estado) {
        this.estado = estado;
    }
}
