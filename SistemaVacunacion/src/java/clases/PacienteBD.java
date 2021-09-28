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
public class PacienteBD implements InterfazPaciente{
    private OracleConnection con;
    private Connection cn;
    private ResultSet rs;
    private String sql;
    
    
    @Override
     public boolean insertar(PacienteBean Paciente){
        
        try {
            sql= "INSERT INTO TBL_PACIENTE (nombre1,nombre2,nombre3,apellido1,apellido2,direccion,celular,comunidad,pueblo,escolaridad,sexo,zona,discapacidad,enfermedad,telefono,departamento,municipio,vacunacion)VALUES(Paciente.getDpi(), '"+Paciente.getNombre1()+"', '"+Paciente.getNombre2()+"','"+Paciente.getNombre3()+"','"+Paciente.getApellido1()+"', '"+Paciente.getApellido2()+"', '"+Paciente.getDireccion()+"','"+Paciente.getCelular()+"', '"+Paciente.getComunidad()+"', '"+Paciente.getPueblo()+"', '"+Paciente.getEscolaridad()+"', '"+Paciente.getSexo()+"', '"+Paciente.getZona()+"', '"+Paciente.getDiscapacidad()+"', '"+Paciente.getEnfermedad()+"', '"+Paciente.getTelefono()+"', '"+Paciente.getDepartamento()+"', '"+Paciente.getMunicipio()+"', '"+Paciente.getVacunacion()+"')";
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
            System.out.print("ERROR SQL");
            return false;
        }finally{
            con.cerrar();
        }
        return true;        
    }
    
}
