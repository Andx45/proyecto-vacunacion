/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import connections.OracleConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author User
 */
public class PacienteBD {
    private OracleConnection con;
    private Connection cn;
    private ResultSet rs;
    private String sql;
    
    
     public boolean insertar(PacienteBean Paciente){
        
        try {
            sql= "INSERT INTO TBL_PACIENTE (CUI,NOMBRE1,NOMBRE2,NOMBRE3,APELLIDO1,APELLIDO2,FECHA_NACIMIENTO,DIRECCION,CELULAR,"
                    + "IGSS,ID_COMUNIDAD_LINGUISTICA,ID_PUEBLO,ID_ESCOLARIDAD,ID_SEXO,ID_ZONA,ID_DISCAPACIDAD,ID_ENFERMEDAD,ID_TELEFONIA,ID_DEPARTAMENTO,"
                    + "ID_MUNICIPIO) VALUES(" + Paciente.getDpi() +", '"+Paciente.getNombre1()+"', '"+Paciente.getNombre2()+
                    "','"+Paciente.getNombre3()+"','"+Paciente.getApellido1()+"', '"+Paciente.getApellido2()+"', "
                    +"TO_DATE('"+Paciente.getNacimiento()+"', 'yyyy-mm-dd'),'"+Paciente.getDireccion()+"','"+Paciente.getCelular()+"', '"+Paciente.getIgss()+"', '"+Paciente.getComunidad()+"', '"
                    +Paciente.getPueblo()+"', '"+Paciente.getEscolaridad()+"', '"+Paciente.getSexo()+"', '"
                    +Paciente.getZona()+"', '"+Paciente.getDiscapacidad()+"', '"+Paciente.getEnfermedad()+"', '"
                    +Paciente.getTelefono()+"', '"+Paciente.getDepartamento()+"', '"+Paciente.getMunicipio()+"')";
            con = new OracleConnection();    
            con.conectar();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            
            Statement sentencia;            
            sentencia = cn.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            sentencia.executeUpdate(sql);
            cn.commit();
            sentencia.close();
        }
        catch (SQLException e) {
            System.out.print("ERROR SQL" + e.getMessage() + sql);
            return false;
        }finally{
            con.cerrar();
        }
        return true;        
    }
    
}