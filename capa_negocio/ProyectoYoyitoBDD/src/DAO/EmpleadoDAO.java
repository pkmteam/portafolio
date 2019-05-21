/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import modelo.Empleado;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.OracleTypes;
import proyectoyoyitobdd.*;

public class EmpleadoDAO {
    
public boolean IngresarEmpleado(String Pnom, String Snom, String Paterno, String Materno, int Fono, String Mail, String User, String Pass, String RespS, String PregS, String Jera) throws SQLException, ClassNotFoundException{
    boolean resultado=false;
      
    try{
        Connection con;
        con = Conexion.getConexion();
        CallableStatement call = con.prepareCall("{call PKG_EMPLEADO.C_EMPLEADO(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
        call.setString(1, Pnom);
        call.setString(2, Snom);
        call.setString(3, Paterno);
        call.setString(4, Materno);
        call.setInt(5, Fono);
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
            CallableStatement call = con.prepareCall("{call PKG_EMPLEADO.r_empleado(?,?)}");        
            call.setString(1,User);
            call.registerOutParameter(2, OracleTypes.CURSOR);
            call.execute();
            rs = (ResultSet) call.getObject(2);
            
            while (rs.next()) 
            {
                emp = new Empleado();
                emp.setP_Nombre(rs.getString(1));
                emp.setS_Nombre(rs.getString(2));
                emp.setPaterno(rs.getString(3));
                emp.setMaterno(rs.getString(4));
                emp.setFono(rs.getInt(5));
                emp.setEmail(rs.getString(6));
                emp.setUsuario(rs.getString(7));
                emp.setPregSec(rs.getString(8));
                emp.setJerarquia(rs.getString(9));
            }
     } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
     }

return  emp;
}

    


}
