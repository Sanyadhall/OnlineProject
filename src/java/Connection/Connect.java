/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;


import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Sanya Dhall
 */
public class Connect

{
    
    Connection conn=null;
    
    public Connection getConnection() {
    try{
    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dummy","root","root");
      }
    catch(Exception e)
    {
        e.printStackTrace();
    }

    return conn;
    
}
}