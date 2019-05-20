/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Empleado;

import java.sql.Connection;
import java.sql.CallableStatement;
import Controller.Conexion;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Empleado;

/**
 *
 * @author alvaro
 */
public class EmpleadoDB {
    
    public boolean create(Empleado empleado){
        boolean key = false;
        
        try {
            Connection con = Conexion.getConexion();
            String sql = "{call pkmempleado.create(?,?,?);}";
            CallableStatement call = con.prepareCall(sql);
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EmpleadoDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return key;
    }
    
}
