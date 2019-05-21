/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Basti
 */
public class Empleado {
  
    private String P_Nombre;
    private String S_Nombre;
    private String  Paterno;
    private String Materno;
    private int Fono;
    private String Email;
    private String Usuario;
    private String Pass;
    private String RespSec;
    private String PregSec;
    private String Jerarquia;

    public Empleado() {
    }

  
    public Empleado(String P_Nombre, String S_Nombre, String Paterno, String Materno, int Fono, String Email, String Usuario, String Pass, String RespSec, String PregSec, String Jerarquia) {
        this.P_Nombre = P_Nombre;
        this.S_Nombre = S_Nombre;
        this.Paterno = Paterno;
        this.Materno = Materno;
        this.Fono = Fono;
        this.Email = Email;
        this.Usuario = Usuario;
        this.Pass = Pass;
        this.RespSec = RespSec;
        this.PregSec = PregSec;
        this.Jerarquia = Jerarquia;
    }

    public String getP_Nombre() {
        return P_Nombre;
    }

    public void setP_Nombre(String P_Nombre) {
        this.P_Nombre = P_Nombre;
    }

    public String getS_Nombre() {
        return S_Nombre;
    }

    public void setS_Nombre(String S_Nombre) {
        this.S_Nombre = S_Nombre;
    }

    public String getPaterno() {
        return Paterno;
    }

    public void setPaterno(String Paterno) {
        this.Paterno = Paterno;
    }

    public String getMaterno() {
        return Materno;
    }

    public void setMaterno(String Materno) {
        this.Materno = Materno;
    }

    public int getFono() {
        return Fono;
    }

    public void setFono(int Fono) {
        this.Fono = Fono;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getPass() {
        return Pass;
    }

    public void setPass(String Pass) {
        this.Pass = Pass;
    }

    public String getRespSec() {
        return RespSec;
    }

    public void setRespSec(String RespSec) {
        this.RespSec = RespSec;
    }

    public String getPregSec() {
        return PregSec;
    }

    public void setPregSec(String PregSec) {
        this.PregSec = PregSec;
    }

    public String getJerarquia() {
        return Jerarquia;
    }

    public void setJerarquia(String Jerarquia) {
        this.Jerarquia = Jerarquia;
    }

   
   
}
    

