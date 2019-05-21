/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectoyoyito;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import static javax.swing.WindowConstants.DISPOSE_ON_CLOSE;
import proyectoyoyitobdd.Conexion;

/**
 *
 * @author Basti
 */
public class ProyectoYoyito {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
      //Llamada a la ventana Login
      
        venLogin ven = new venLogin();
        ven.setVisible(true); 
        ven.setLocationRelativeTo(null);
        ven.setResizable(false);
        ven.setTitle("Login");
        ven.setDefaultCloseOperation(DISPOSE_ON_CLOSE);

       
        
        
        
        
        
        
      //Prueba de conexion a la BDD
        try {
            Connection con;
            con = Conexion.getConexion();
            
            String sql = "select * from jerarquia";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                System.out.println("ide: "+ rs.getInt(1)+ " Nombre: "+rs.getString(2));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProyectoYoyito.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
   
    
    
}
