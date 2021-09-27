/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OracleConnection {
    private Connection conexion;
 
    public Connection getConexion() {
        return conexion;
    }

    public void setConexion(Connection conexion) {
        this.conexion = conexion;
    }

    public OracleConnection conectar() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String BaseDeDatos = "jdbc:oracle:thin:@localhost:1521:umg";            
            conexion = DriverManager.getConnection(BaseDeDatos, "system","Umg$19");

            if (conexion != null) {
                System.out.println("Conexion exitosa!");
            } else {
                System.out.println("Conexion fallida!");
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return this;
    }

    

    public ResultSet consultar(String sql) {
        ResultSet resultado = null;
        try {
            Statement sentencia;
            sentencia = getConexion().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            resultado = sentencia.executeQuery(sql);
            getConexion().commit();            
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return resultado;
    }
   
    
    public void cerrar(){
        try {
            conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(OracleConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
