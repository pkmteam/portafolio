
package proyectoyoyitobdd;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Conexion {
    
    private static Connection con=null;
    
    public static Connection getConexion() throws SQLException,ClassNotFoundException{
       if(con==null)
       {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          con= DriverManager.getConnection("jdbc:oracle:thin:@172.18.02:1521:XE", "pkm", "pkm");//@172.18.02:1521 "C##usuarioDuoc", "colocolo30"
        }
        return con;
    }
    
    
    
    
    
}
