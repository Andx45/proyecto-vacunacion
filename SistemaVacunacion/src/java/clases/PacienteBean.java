/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.Date;

/**
 *
 * @author CONSUTELCO
 */
public class PacienteBean {
    String nombre1,nombre2,nombre3,apellido1,apellido2,direccion;
    int  celular,comunidad,pueblo,escolaridad,sexo,zona,discapacidad,enfermedad,telefono,departamento,municipio,vacunacion;
    boolean iggs;
    Date nacimiento;
    
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

    public void setCelular(int celular) {
        this.celular = celular;
    }

    public int getComunidad() {
        return comunidad;
    }

    public void setComunidad(int comunidad) {
        this.comunidad = comunidad;
    }

    public int getPueblo() {
        return pueblo;
    }

    public void setPueblo(int pueblo) {
        this.pueblo = pueblo;
    }

    public int getEscolaridad() {
        return escolaridad;
    }

    public void setEscolaridad(int escolaridad) {
        this.escolaridad = escolaridad;
    }

    public int getSexo() {
        return sexo;
    }

    public void setSexo(int sexo) {
        this.sexo = sexo;
    }

    public int getZona() {
        return zona;
    }

    public void setZona(int zona) {
        this.zona = zona;
    }

    public int getDiscapacidad() {
        return discapacidad;
    }

    public void setDiscapacidad(int discapacidad) {
        this.discapacidad = discapacidad;
    }

    public int getEnfermedad() {
        return enfermedad;
    }

    public void setEnfermedad(int enfermedad) {
        this.enfermedad = enfermedad;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public int getDepartamento() {
        return departamento;
    }

    public void setDepartamento(int departamento) {
        this.departamento = departamento;
    }

    public int getMunicipio() {
        return municipio;
    }

    public void setMunicipio(int municipio) {
        this.municipio = municipio;
    }

    public int getVacunacion() {
        return vacunacion;
    }

    public void setVacunacion(int vacunacion) {
        this.vacunacion = vacunacion;
    }

    public boolean isIggs() {
        return iggs;
    }

    public void setIggs(boolean iggs) {
        this.iggs = iggs;
    }

    public Date getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(Date nacimiento) {
        this.nacimiento = nacimiento;
    }
    
    

    public PacienteBean(String nombre1, String nombre2, String nombre3, String apellido1, String apellido2, String direccion, int celular, int comunidad, int pueblo, int escolaridad, int sexo, int zona, int discapacidad, int enfermedad, int telefono, int departamento, int municipio, int vacunacion, boolean iggs, Date nacimiento) {
        this.nombre1 = nombre1;
        this.nombre2 = nombre2;
        this.nombre3 = nombre3;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.direccion = direccion;
        this.celular = celular;
        this.comunidad = comunidad;
        this.pueblo = pueblo;
        this.escolaridad = escolaridad;
        this.sexo = sexo;
        this.zona = zona;
        this.discapacidad = discapacidad;
        this.enfermedad = enfermedad;
        this.telefono = telefono;
        this.departamento = departamento;
        this.municipio = municipio;
        this.vacunacion = vacunacion;
        this.iggs = iggs;
        this.nacimiento = nacimiento;
    }    
}
