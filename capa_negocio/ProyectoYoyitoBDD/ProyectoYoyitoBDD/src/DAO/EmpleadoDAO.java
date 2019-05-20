
     
package DAO;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Empleado;
import oracle.jdbc.OracleTypes;
//import Modelo.*;
import proyectoyoyitobdd.*;

public class EmpleadoDAO {
    
public boolean IngresarEmpleado(String Pnom, String Snom, String Paterno, String Materno, int Fono, String Mail, String User, String Pass, String RespS, String PregS, String Jera) throws SQLException, ClassNotFoundException{
    boolean resultado=false;
      
    try{
        Connection con;
        con = Conexion.getConexion();
        CallableStatement call = con.prepareCall("{call PKG_EMPLEADO.C_EMPLEADO(?,?,?,?,?,?,?,?,?,?,?,?)}");
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
        call.registerOutParameter(12, OracleTypes.INTEGER);
        call.execute();
        
        resultado= call.getInt(12) == 1;
        
    } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultado;
}

  


}
    

