/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.OracleTypes;
import proyectoyoyitobdd.Conexion;

/**
 *
 * @author felip
 */
public class ProovedorDAO {
    public boolean IngresarProveedor(String nom, String razon, int rut, int fono, String mail){
        boolean resultado=false;
      
        try{
            Connection con;
            con = Conexion.getConexion();
            CallableStatement call = con.prepareCall("{call PAKAGE(?,?,?,?,?)}");
            call.setString(1, nom);
            call.setString(2, razon);
            call.setInt(3, rut);
            call.setInt(4, fono);
            call.setString(5, mail);
            call.setInt(6, OracleTypes.INTEGER);
            call.execute();
        
            resultado=true;
        
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProovedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultado;
}

    
    
}
