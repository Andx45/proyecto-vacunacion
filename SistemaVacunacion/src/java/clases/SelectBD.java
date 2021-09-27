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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author IXCAMEY
 */
public class SelectBD {
    private OracleConnection con;
    private Connection cn;
    private ResultSet rs;
    private String sql;
   
    
    public List<SelectBean> buscar(String nombre_tabla){       
        List<SelectBean> lstSelect = null;
        SelectBean selection = null;
        try {
            sql = "SELECT ID_" + nombre_tabla +", NOMBRE, ESTADO FROM TBL_"+nombre_tabla;
            con = new OracleConnection();    
            con.conectar();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            
            Statement sentencia;            
            sentencia = cn.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            rs = sentencia.executeQuery(sql);
            lstSelect = new ArrayList<SelectBean>();
            while(rs.next()){
                selection = new SelectBean();
                selection.setId(Integer.parseInt(rs.getString("id_" + nombre_tabla)));
                selection.setNombre(rs.getString("nombre"));
                lstSelect.add(selection);
            }            
        }
        catch (SQLException e) {
            System.out.print("ERROR SQL");
        }finally{
            con.cerrar();
        }
        return lstSelect;
    }
    
    public List<SelectBean> buscarWh(String nombre_tabla, String estado){       
        List<SelectBean> lstSelect = null;
        SelectBean selection = null;
        try {
            sql = "SELECT ID_" + nombre_tabla +", NOMBRE FROM TBL_"+nombre_tabla + " WHERE ID_DEPARTAMENTO = " + estado;
            con = new OracleConnection();    
            con.conectar();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            
            Statement sentencia;            
            sentencia = cn.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            rs = sentencia.executeQuery(sql);
            lstSelect = new ArrayList<SelectBean>();
            while(rs.next()){
                selection = new SelectBean();
                selection.setId(Integer.parseInt(rs.getString("id_" + nombre_tabla)));
                selection.setNombre(rs.getString("nombre"));
                lstSelect.add(selection);
            }            
        }
        catch (SQLException e) {
            System.out.print("ERROR SQL");
        }finally{
            con.cerrar();
        }
        return lstSelect;
    }
    
     public List<SelectBean> buscarPuesto(String estado){       
        List<SelectBean> lstSelect = null;
        SelectBean selection = null;
        try {
            sql = "SELECT ID_PUESTO_VACUNACION, NOMBRE FROM TBL_PUESTO_VACUNACION WHERE ID_MUNICIPIO = " + estado;
            con = new OracleConnection();    
            con.conectar();
            cn = con.getConexion();
            cn.setAutoCommit(false);
            
            Statement sentencia;            
            sentencia = cn.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            rs = sentencia.executeQuery(sql);
            lstSelect = new ArrayList<SelectBean>();
            while(rs.next()){
                selection = new SelectBean();
                selection.setId(Integer.parseInt(rs.getString("ID_PUESTO_VACUNACION")));
                selection.setNombre(rs.getString("nombre"));
                lstSelect.add(selection);
            }            
        }
        catch (SQLException e) {
            System.out.print("ERROR SQL");
        }finally{
            con.cerrar();
        }
        return lstSelect;
    }
}

