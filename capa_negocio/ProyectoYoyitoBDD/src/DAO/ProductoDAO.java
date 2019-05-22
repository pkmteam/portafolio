/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Producto;
import oracle.jdbc.OracleTypes;
//import Modelo.*;
import proyectoyoyitobdd.*;
/**
 *
 * @author felip
 */
public class ProductoDAO {
    
    public boolean IngresarProducto(String nom, int precio, String img, String fam, String vig){
        boolean resultado=false;
      
        try{
            Connection con;
            con = Conexion.getConexion();
            CallableStatement call = con.prepareCall("{call PKG_PRODUCTO.C_PRODUCTO(?,?,?,?,?)}");
            call.setString(1, nom);
            call.setInt(2, precio);
            //call.setString(3, img);
            call.setString(3, fam);
            call.setString(4, vig);
            call.registerOutParameter(5, OracleTypes.INTEGER);
            call.execute();
        
            resultado= call.getInt(5) == 1;
        
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultado;
    }
    
    public Producto read(String nombre){
        Producto producto = null;
        
        try {
            Connection con = Conexion.getConexion();
            CallableStatement call = con.prepareCall("{call pkg_producto.r_producto(?,?)}");
            call.setString(1, nombre);
            call.registerOutParameter(2, OracleTypes.CURSOR);
            call.execute();
            
            ResultSet rs = (ResultSet) call.getObject(2);
            
            while(rs.next()){
                producto = new Producto(rs.getString(1), String.valueOf(rs.getInt(2)), " ", rs.getString(3), rs.getString(4));
            }
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return producto;
    }
    
    public boolean update(Producto producto){
        boolean key = false;
        
        try {
            Connection con = Conexion.getConexion();
            CallableStatement call = con.prepareCall("{call pkg_producto.u_producto(?,?,?,?,?)}");
            call.setString(1, producto.getNomProd());
            call.setInt(2, Integer.parseInt(producto.getPrice()));
            //call.setString(3, img);
            call.setString(3, producto.getFam());
            call.setString(4, producto.getVigencia());
            call.registerOutParameter(5, OracleTypes.INTEGER);
            call.execute();
            
            key = call.getInt(5) == 1;
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return key;
    }
}
