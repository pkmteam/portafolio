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
    public boolean IngresarProveedor(String nom, String razon, String rut, String fono, String mail) throws SQLException, ClassNotFoundException{
    boolean resultado=false;
      
    try{
        Connection con;
        con = Conexion.getConexion();
        CallableStatement call = con.prepareCall("{call PAKAGE(?,?,?,?,?)}");
        call.setString(1, nom);
        call.setString(2, razon);
        call.setString(3, rut);
        call.setString(4, fono);
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
