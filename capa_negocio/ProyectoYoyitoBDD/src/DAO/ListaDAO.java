/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import modelo.Empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import proyectoyoyitobdd.Conexion;

/**
 *
 * @author felip
 */
public class ListaDAO {
    
      public ArrayList <Empleado> ListJ()
    {
        ArrayList<Empleado> emple=new ArrayList<>();
        try {
            Connection con;
            con = Conexion.getConexion();
            String sql = "select Nombre from jerarquia";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Empleado emp = new Empleado();
                
                emp.setJerarquia(rs.getString(1));
                emple.add(emp);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ListaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emple;
    }
      
        public ArrayList <Empleado> ListPS()
    {
        ArrayList<Empleado> emple=new ArrayList<>();
        try {
            Connection con;
            con = Conexion.getConexion();
            String sql = "select pregunta from preg_secreta";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Empleado emp = new Empleado();
                
                emp.setPregSec(rs.getString(1));
                emple.add(emp);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ListaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emple;
    }
      
}