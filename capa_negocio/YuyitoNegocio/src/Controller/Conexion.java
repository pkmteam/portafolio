/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author alvaro
 */
public class Conexion {
    private static Connection con=null;
    public static Connection getConexion() throws SQLException,ClassNotFoundException{
       if(con==null)
       {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          con= DriverManager.getConnection("jdbc:oracle:thin:@192.168.2.23:1521:cepdb", "admincep", "Admincep");
        }
        return con;
    }
}