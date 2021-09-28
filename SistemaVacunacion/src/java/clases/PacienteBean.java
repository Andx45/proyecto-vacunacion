/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author CONSUTELCO
 */
public class PacienteBean {
    String nombre1,nombre2,nombre3,apellido1,apellido2,direccion, igss, nacimiento;
    int celular,comunidad,pueblo,escolaridad,sexo,zona,discapacidad,enfermedad,telefono,departamento,municipio,vacunacion;
    //Date nacimiento; 
    long dpi;

    public PacienteBean() {
    }

    public long getDpi() {
        return dpi;
    }

    public void setDpi(String dpi) {
        this.dpi = Long.parseLong(dpi);
    }
    
    public String getNombre1() {
        return nombre1;
    }

    public void setNombre1(String nombre1) {
        this.nombre1 = nombre1;
    }

    public String getNombre2() {
        return nombre2;
    }

    public void setNombre2(String nombre2) {
        this.nombre2 = nombre2;
    }

    public String getNombre3() {
        return nombre3;
    }

    public void setNombre3(String nombre3) {
        this.nombre3 = nombre3;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = Integer.parseInt(celular);
    }

    public int getComunidad() {
        return comunidad;
    }

    public void setComunidad(String comunidad) {
        this.comunidad = Integer.parseInt(comunidad);
    }

    public int getPueblo() {
        return pueblo;
    }

    public void setPueblo(String pueblo) {
        this.pueblo = Integer.parseInt(pueblo);
    }

    public int getEscolaridad() {
        return escolaridad;
    }

    public void setEscolaridad(String escolaridad) {
        this.escolaridad = Integer.parseInt(escolaridad);
    }

    public int getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = Integer.parseInt(sexo);
    }

    public int getZona() {
        return zona;
    }

    public void setZona(String zona) {
        this.zona = Integer.parseInt(zona);
    }

    public int getDiscapacidad() {
        return discapacidad;
    }

    public void setDiscapacidad(String discapacidad) {
        this.discapacidad = Integer.parseInt(discapacidad);
    }

    public int getEnfermedad() {
        return enfermedad;
    }

    public void setEnfermedad(String enfermedad) {
        this.enfermedad = Integer.parseInt(enfermedad);
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = Integer.parseInt(telefono);
    }

    public int getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = Integer.parseInt(departamento);
    }

    public int getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = Integer.parseInt(municipio);
    }

    public int getVacunacion() {
        return vacunacion;
    }

    public void setVacunacion(int vacunacion) {
        this.vacunacion = vacunacion;
    }

    public String getIgss() {
        return igss;
    }

    public void setIgss(String igss) {
        this.igss = igss;
    }
    
    public String getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(String nacimiento) {
        this.nacimiento = nacimiento;
    }
}
