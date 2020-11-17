/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConnectDATABASE;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author LAPTOPTOKYO
 */
public class MyConnect {
    public MyConnectUnit getDAO() throws Exception{
        return new MyConnectUnit("localhost","sa","123456789","csdlcaphe");
    }
    
    public Connection openConnection(){
        Connection conn = null;
        try {
                conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=csdlcaphe;user=sa;password=123456789");
                System.out.println("connect successfully!");
            } catch (SQLException ex) {
                System.out.println("connect failure!");
            }
        return conn;
    }
}
