package com.tangcheng.shoopingmail.Util;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class DBUtils {

    private static Connection conn = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
   // private static String url = "jdbc:mysql://localhost:3306/test";
   private static String url = "jdbc:mysql://localhost:3306/carshopping?useSSL=false&serverTimezone=UTC";
    private static String username = "root";
    private static String password = "tangcheng120";



    static{

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            System.out.println("����ʧ��");
            e.printStackTrace();
        }

    }

    private static Connection getConn(){

        try{
            conn = DriverManager.getConnection(url,username,password);
            return conn;
        }catch(Exception e){
            System.out.println("����ʧ��");
            e.printStackTrace();
            return null;
        }

    }


    public static int update(String sql){
        try{
            stmt = getConn().createStatement();

            return stmt.executeUpdate(sql);
        }catch(SQLException e){
            System.out.println("����ʧ��");
            e.printStackTrace();
            return -1;
        }
    }


    public static List<Map<String,Object>> query(String sql){

        try{

            ArrayList<Map<String,Object>> list = new ArrayList<Map<String,Object>>();

            stmt = getConn().createStatement();
            rs = stmt.executeQuery(sql);

            ResultSetMetaData rsmd = rs.getMetaData();

            int columnCount = rsmd.getColumnCount();

            while(rs.next()){
                Map<String,Object> map = new HashMap<String,Object>();
                for(int i = 1; i<=columnCount; i++){
                    String columnName = rsmd.getColumnLabel(i);
                    Object columnValue = rs.getObject(columnName);
                    map.put(columnName, columnValue);
                }
                list.add(map);
            }

            return list;
        }catch(SQLException e){
            System.out.println("����ʧ��");
            e.printStackTrace();
            return null;
        }
    }


    private static void guanBi(){

        if(rs != null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(stmt != null){
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(conn != null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}

