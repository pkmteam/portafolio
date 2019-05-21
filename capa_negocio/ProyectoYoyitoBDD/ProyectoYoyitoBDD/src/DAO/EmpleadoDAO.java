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

public class EmpleadoDAO {
    
public boolean IngresarEmpleado(String Pnom, String Snom, String Paterno, String Materno, String Fono, String Mail, String User, String Pass, String RespS, String PregS, String Jera) throws SQLException, ClassNotFoundException{
    boolean resultado=false;
      
    try{
        Connection con;
        con = Conexion.getConexion();
        CallableStatement call = con.prepareCall("{call PKG_EMPLEADO.C_EMPLEADO(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
        call.setString(1, Pnom);
        call.setString(2, Snom);
        call.setString(3, Paterno);
        call.setString(4, Materno);
        call.setString(5, Fono);
        call.setString(6, Mail);
        call.setString(7, User);
        call.setString(8, Pass);
        call.setString(9, RespS);
        call.setString(10, PregS);
        call.setString(11, Jera);
        call.setInt(12, OracleTypes.INTEGER);
        call.execute();
        
        resultado=true;
        
    } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultado;
}
    
public Empleado ReadEmp(String User)
 {  
     ResultSet rs = null;
     Empleado emp = null;
     
     try {
         Connection con;
        con = Conexion.getConexion();
            CallableStatement call = con.prepareCall("{call PKG_EMPLEADO.r_empleado}");        
            call.setString(1,User);
            call.registerOutParameter(2, OracleTypes.CURSOR);
            call.execute();
            rs = (ResultSet) call.getObject(2);
            
            while (rs.next()) 
            {
                emp = new Empleado(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
            
            }
     } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
     }

return  emp;
}
    


}
