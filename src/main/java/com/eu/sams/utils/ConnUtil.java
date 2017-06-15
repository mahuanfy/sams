package com.eu.sams.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.junit.Test;

import java.sql.*;

/**
 * Created by 马欢欢 on 2017/6/5.
 */
public class ConnUtil{

    public static Connection getConnextion() {
        Connection conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");//1.加载数据库驱动

            String url="jdbc:mysql://localhost:3306/sams?useUnicode=true&characterEncoding=utf-8";//2.指定连接数据库的地址名称
            String user="root";
            String passWord = "root";//指定用户名和密码

            conn= (Connection) DriverManager.getConnection(url,user,passWord);//3获取数据库连接

            if(null!=conn){//判断是否连接成功！
                System.out.println("恭喜！数据库连接成功！");
            }
        } catch (Exception e) {
            System.out.println("很遗憾！数据库连接失败！");
            e.printStackTrace();
        }
        return conn;
    }

//关闭连接1
    public static void close(Statement stmt, Connection conn){
            try {
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        System.out.print("关闭成功");
    }

    //关闭连接2
    public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
            try {
                rs.close();
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        System.out.print("关闭成功");
    }
}