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
    
    public ArrayList<String> listJerarquia()
    {
        ArrayList<String> lista = new ArrayList<>();
        try {
            Connection con;
            con = Conexion.getConexion();
            String sql = "select nombre from jerarquia";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) { lista.add(rs.getString(1)); }
            
            ps.close();
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ListaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList<String> listPregunta()
    {
        ArrayList<String> lista=new ArrayList<>();
        try {
            Connection con;
            con = Conexion.getConexion();
            String sql = "select pregunta from preg_secreta";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){ lista.add(rs.getString(1)); }
            
            ps.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ListaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList<String> listFamilia()
    {
        ArrayList<String> lista=new ArrayList<>();
        try {
            Connection con;
            con = Conexion.getConexion();
            String sql = "select nombre from familia";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){ lista.add(rs.getString(1)); }
            
            ps.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ListaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList<String> listVigencia()
    {
        ArrayList<String> lista=new ArrayList<>();
        try {
            Connection con;
            con = Conexion.getConexion();
            String sql = "select vigencia from vigencia_prod";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){ lista.add(rs.getString(1)); }
            
            ps.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ListaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}