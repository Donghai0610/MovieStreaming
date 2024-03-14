package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost:1433;databaseName= movie";
            String username = "sa";
            String password = "donghai06102003";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
}
//public class DBContext {
//
////    protected Connection connection;
////
////    public DBContext() {
////        try {
////            String url = "jdbc:mysql://localhost:3306/luumanhshop";
////            String username = "root";
////            String password = "donghai06102003";
////
////            connection = DriverManager.getConnection(url, username, password);
////        } catch (SQLException ex) {
////            System.out.println(ex);
////        }
////    }
//
//   
//    
//}
