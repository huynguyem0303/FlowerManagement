package sample.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtils {

    /*USE BELOW METHOD FOR YOUR DATABASE CONNECTION FOR BOTH SINGLE AND MULTILPE SQL SERVER INSTANCE(s)*/
 /*DO NOT EDIT THE BELOW METHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE CONNECTION*/
    public static Connection makeConnection() throws Exception {

        Connection cn = null;
        String IP = "localhost";
        String instanceName = "MINHHUY";
        String port = "1433";
        String uid = "sa";
        String pwd = "12345";
        String db = "PlantShop";
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url = "jdbc:sqlserver://" + IP + "\\" + instanceName + ":" + port
                + ";databasename=" + db + ";user=" + uid + ";password=" + pwd;
        Class.forName(driver);
        cn = DriverManager.getConnection(url);
        return cn;
    }

//    public static void main(String[] args) {
//        Connection cn = null;
//        try {
//            cn = DBUtils.makeConnection();
//            if (cn != null) {
//                System.out.println("Success!");
//            }
//        } catch (Exception e) {
//        }
//    }

    /*Insert your other code right after this comment*/
 /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
}
