/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.OracleTypes;
//import Modelo.*;
import proyectoyoyitobdd.*;
/**
 *
 * @author felip
 */
public class ProductoDAO {
    
    public boolean IngresarProducto(String nom, String precio, String img, String fam, String vig) throws SQLException, ClassNotFoundException{
    boolean resultado=false;
      
    try{
        Connection con;
        con = Conexion.getConexion();
        CallableStatement call = con.prepareCall("{call PACKAGE(?,?,?,?,?");
        call.setString(1, nom);
        call.setString(2, precio);
        call.setString(3, img);
        call.setString(4, fam);
        call.setString(5, vig);
        call.setInt(6, OracleTypes.INTEGER);
        call.execute();
        
        resultado=true;
        
    } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultado;
}

    
}
