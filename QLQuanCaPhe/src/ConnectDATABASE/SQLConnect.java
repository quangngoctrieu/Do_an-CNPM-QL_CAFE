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
 * @author Vo The Hoc
 */
public class SQLConnect {
    public static Connection openConnection() throws SQLException{
        Connection conn = null;
        try {
                conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=csdlcaphe;user=sa;password=123456");
                System.out.println("connect successfully!");
            } catch (SQLException ex) {
                System.out.println("connect failure!");
            }
        return conn;
    }
}
